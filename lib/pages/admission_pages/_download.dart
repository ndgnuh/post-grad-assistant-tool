import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:fami_tools/services/pdf_builder.bak/drafting.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_combiner/pdf_combiner.dart';
import 'package:pdf_combiner/responses/pdf_combiner_status.dart';
import 'package:dart_pdf_reader/dart_pdf_reader.dart';

final dio = Dio();
const baseTuyenSinhUrl = "https://sdh.hust.edu.vn/AnhTuyenSinh";

typedef DownloadResult = ({bool success, String error});

String paperUrl(Object? id) => "$baseTuyenSinhUrl/20175/$id.pdf";

String englishCertUrl(Object? id) => "$baseTuyenSinhUrl/20174/$id.pdf";

String bachelorDegreeUrl(Object? id) => "$baseTuyenSinhUrl/20172/$id.pdf";

String degreeAppendixUrl(Object? id) => "$baseTuyenSinhUrl/20171/$id.pdf";

Future<String> blankPdf() async {
  final bytes = await createSinglePageDocument(build: (_) => SizedBox());
  final tmpDir = await getTemporaryDirectory();
  final tmpPath = p.join(tmpDir.path, "blank.pdf");
  await File(tmpPath).writeAsBytes(bytes);
  return tmpPath;
}

Future<bool> needPadding(Uint8List bytes) async {
  final doc = await PDFParser(ByteStream(bytes)).parse();
  final catalog = await doc.catalog;
  final pages = await catalog.getPages();
  return pages.pageCount % 2 == 1;
}

Future<Uint8List?> downloadTo({
  required String url,
  required String savePath,
  required failable,
}) async {
  if (await File(savePath).exists()) {
    return await File(savePath).readAsBytes();
  }

  try {
    final res = await dio.get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: true,
      ),
    );
    Uint8List data = res.data;
    File file = File(savePath);
    await file.writeAsBytes(data);
    return data;
  } on Exception {
    if (failable) {
      return null;
    } else {
      rethrow;
    }
  }
}

Future<void> downloadAdmissionFiles({
  required String admissionId,
  required String studentName,
  required String saveDirectory,
}) async {
  // Slugify
  final name = studentName.toKebabCase();
  final outputPath = p.join(saveDirectory, "$admissionId-$name.pdf");
  if (await File(outputPath).exists()) {
    print("File $outputPath already exists. Skipping download.");
    return;
  }

  final urls = [
    (bachelorDegreeUrl(admissionId), false),
    (englishCertUrl(admissionId), false),
    (degreeAppendixUrl(admissionId), false),
    (paperUrl(admissionId), true),
  ];

  final names = [
    "$admissionId-$name-Bang.pdf",
    "$admissionId-$name-NgoaiNgu.pdf",
    "$admissionId-$name-BangDiem.pdf",
    "$admissionId-$name-BaiBao.pdf",
  ];

  final outputPaths = <String>[];
  final needPaddings = <bool>[];

  for (final (i, (url, failable)) in urls.indexed) {
    final outPath = p.join(saveDirectory, names[i]);
    final bytes = await downloadTo(
      url: url,
      savePath: outPath,
      failable: failable,
    );

    if (bytes == null && !failable) {
      throw Exception("Failed to download required file from $url");
    }

    if (bytes != null) {
      outputPaths.add(outPath);
      final padding = await needPadding(bytes);
      needPaddings.add(padding);
    }
  }

  final paddedOutputPaths = <String>[];
  final blankPath = await blankPdf();
  for (final (i, path) in outputPaths.indexed) {
    paddedOutputPaths.add(path);
    if (needPaddings[i]) {
      paddedOutputPaths.add(blankPath);
    }
  }

  final response = await PdfCombiner.generatePDFFromDocuments(
    inputPaths: paddedOutputPaths,
    outputPath: outputPath,
  );
  switch (response.status) {
    case PdfCombinerStatus.success:
      // Clean up individual files
      for (final path in outputPaths) {
        final file = File(path);
        if (await file.exists()) {
          await file.delete();
        }
      }

    case PdfCombinerStatus.error:
      throw Exception("Failed to merge PDFs: ${response.message}");
  }
}
