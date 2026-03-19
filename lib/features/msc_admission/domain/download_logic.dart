import 'package:dio/dio.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfrx/pdfrx.dart' as pdfrx;

import '../../../business/documents.dart';
import '../../../utilities/strings.dart';

final _dio = Dio();
const _baseUrl = "https://sdh.hust.edu.vn/AnhTuyenSinh";

typedef DownloadResult = ({bool success, String error});

/// Link đến bài báo khoa học
String _publicationUrl(Object? id) => "$_baseUrl/20175/$id.pdf";

/// Link đến chứng chỉ ngoại ngữ
String _englishCertUrl(Object? id) => "$_baseUrl/20174/$id.pdf";

/// Link đến bằng tốt nghiệp cử nhân
String _bachelorDegreeUrl(Object? id) => "$_baseUrl/20172/$id.pdf";

/// Link đến phụ lục bằng
String _degreeAppendixUrl(Object? id) => "$_baseUrl/20171/$id.pdf";

/// Trang trống PDF, để padding nếu cần
final _blankPdf = (() {
  final doc = pw.Document(
    pageMode: PdfPageMode.outlines,
  );

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.SizedBox.shrink(),
    ),
  );

  return doc.save();
})();

/// Tải file tuyển sinh của thí sinh
Future<PdfFile> downloadAdmissionProfile({
  required String admissionId,
  required String candidateName,
}) async {
  // Link các file, và có optional hay không?
  final urls = [
    (_bachelorDegreeUrl(admissionId), false),
    (_englishCertUrl(admissionId), false),
    (_degreeAppendixUrl(admissionId), false),
    (_publicationUrl(admissionId), true),
  ];

  // Trang trống (để padding)
  final emptyPdf = await pdfrx.PdfDocument.openData(await _blankPdf);
  final emptyPage = emptyPdf.pages.first;

  final pages = <pdfrx.PdfPage>[];
  for (final (url, failable) in urls) {
    /// Thử tải file
    try {
      final res = await _dio.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
        ),
      );

      // Mở dữ liệu của PDF ra,
      // lưu lại các trang đếm trang
      final pageBytes = res.data;
      final pdf = await pdfrx.PdfDocument.openData(pageBytes);
      pages.addAll(pdf.pages);

      // Nếu số trang là lẻ thì thêm trang trống
      // Để khi in ra các tài liệu ngăn cách rõ ràng với nhau
      if (pdf.pages.length % 2 == 1) {
        pages.add(emptyPage);
      }
    } on DioException catch (_) {
      // Nếu lỗi và file này không phải file tùy chọn
      // Nếu không đẩy nổi lỗi ra ngoài
      if (!failable) {
        rethrow;
      }
    }
  }

  // Nếu trang cuối là trang trắng, xóa nó đi
  if (pages.last == emptyPage) {
    pages.removeLast();
  }

  // Tên file: mã hồ sơ + tên ứng viên
  final name = "$admissionId-${candidateName.toPascalCase()}";

  // Ghép các trang PDF
  final output = await pdfrx.PdfDocument.createNew(sourceName: name);
  output.pages = pages;
  final outputBytes = await output.encodePdf();

  // Trả về file object lưu PDF có tên
  return PdfFile(name: name, bytes: outputBytes);
}
