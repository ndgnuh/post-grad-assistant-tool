import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

final dio = Dio();
const baseTuyenSinhUrl = "https://sdh.hust.edu.vn/AnhTuyenSinh";

typedef DownloadResult = ({bool success, String error});

String englishCertUrl(Object? id) {
  return "$baseTuyenSinhUrl/20174/$id.pdf";
}

String bachelorDegreeUrl(Object? id) {
  return "$baseTuyenSinhUrl/20172/$id.pdf";
}

String degreeAppendixUrl(Object? id) {
  return "$baseTuyenSinhUrl/20171/$id.pdf";
}

Future<DownloadResult> downloadAdmissionFiles({
  required String admissionId,
  required String name,
  required String outputDirectory,
}) async {
  // Build output paths
  final urls = [
    bachelorDegreeUrl(admissionId),
    degreeAppendixUrl(admissionId),
    englishCertUrl(admissionId),
  ];
  final outNames = [
    "$admissionId-$name-bang.pdf",
    "$admissionId-$name-bangdiem.pdf",
    "$admissionId-$name-tienganh.pdf",
  ];
  final outPaths = [
    for (final name in outNames) p.join(outputDirectory, name),
  ];

  try {
    for (final (i, url) in urls.indexed) {
      final res = await dio.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
        ),
      );
      Uint8List data = res.data;
      File file = File(outPaths[i]);
      await file.writeAsBytes(data);
    }
    return (success: true, error: "");
  } on Exception {
    return (success: false, error: "Tải file thất bại");
  }
}
