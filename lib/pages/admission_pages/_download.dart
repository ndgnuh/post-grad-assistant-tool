import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:path/path.dart' as p;
import 'package:pdf_combiner/pdf_combiner.dart';
import 'package:pdf_combiner/responses/pdf_combiner_status.dart';

final dio = Dio();
const baseTuyenSinhUrl = "https://sdh.hust.edu.vn/AnhTuyenSinh";

typedef DownloadResult = ({bool success, String error});

String paperUrl(Object? id) => "$baseTuyenSinhUrl/20175/$id.pdf";

String englishCertUrl(Object? id) => "$baseTuyenSinhUrl/20174/$id.pdf";

String bachelorDegreeUrl(Object? id) => "$baseTuyenSinhUrl/20172/$id.pdf";

String degreeAppendixUrl(Object? id) => "$baseTuyenSinhUrl/20171/$id.pdf";

Future<bool> downloadTo({
  required String url,
  required String savePath,
  required failable,
}) async {
  if (await File(savePath).exists()) {
    return true;
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
    return true;
  } on Exception {
    if (failable) {
      return false;
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

  final outputPaths = [for (final name in names) p.join(saveDirectory, name)];

  for (final (i, (url, failable)) in urls.indexed) {
    final outPath = outputPaths[i];
    final success = await downloadTo(
      url: url,
      savePath: outPath,
      failable: failable,
    );
    if (!success) {
      // Remove the path from outputPaths if download failed
      if (failable) {
        outputPaths.removeAt(i);
      } else {
        throw Exception("Failed to download required file from $url");
      }
    }
  }

  final response = await PdfCombiner.generatePDFFromDocuments(
    inputPaths: outputPaths,
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
