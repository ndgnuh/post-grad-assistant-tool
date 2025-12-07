import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<Uint8List> createPdf({
  required List<CourseData> courses,
  required String semester,
}) async {
  final pdf = pw.Document(
    theme: await pw.defaultTheme(
      baseSize: 11 * pw.PdfPageFormat.point,
    ),
  );

  // Information
  final today = DateTime.now();
  final day = today.day;
  final month = today.month;
  final year = today.year;
  final greetLine =
      "Thực hiện kế hoạch giảng dạy cao học học kỳ $semester, Khoa Toán - Tin đề xuất danh mục các học phần trong chương trình đào tạo Thạc sĩ các ngành như sau:";

  final page = pw.MultiPage(
    margin: pw.EdgeInsets.symmetric(
      vertical: 0.75 * pw.inch,
      horizontal: 0.9 * pw.inch,
    ),
    orientation: pw.PageOrientation.landscape,
    pageFormat: pw.transpose(pw.PdfPageFormat.a4),
    build: (context) {
      return [
        pw.EzTopHeader.fami(),
        pw.EzSkip.medskip(),
        pw.EzTitle("Kính gửi: Ban Đào tạo"),
        pw.EzSkip.medskip(),
        pw.Text(greetLine),
        pw.EzSkip.medskip(),
        pw.EzTable<CourseData>(
          padding: pw.EdgeInsetsDirectional.symmetric(
            vertical: 2 * pw.pt,
            horizontal: 3 * pw.pt,
          ),
          textAligns: {
            2: pw.TextAlign.justify,
          },
          alignments: {
            2: pw.Alignment.centerLeft,
          },
          data: courses,
          headers: [
            "TT",
            "Mã HP",
            "Tên học phần",
            "Khối lượng",
            "Khối kiến thức",
            "Đợt học",
          ],
          rowBuilder: (int i, CourseData course) {
            String name = "${course.englishName}\n${course.vietnameseName}";
            // if (name.length > 70) {
            //   name = "${hp.tenTiengAnh}\n${hp.tenTiengViet}";
            // }
            return [
              "${i + 1}",
              course.id,
              name,
              course.numCredits.toString(),
              course.category.label,
              semester,
            ];
          },
        ),
        pw.EzSkip.medskip(),
        pw.Row(
          children: [
            pw.Expanded(child: pw.SizedBox.shrink()),
            pw.Column(
              children: [
                pw.ItalicText("Hà Nội, ngày $day tháng $month năm $year"),
                pw.EzSkip.smallskip(),
                pw.Text("KHOA TOÁN - TIN"),
                pw.EzSkip(height: 15 * pw.mm),
              ],
            ),
          ],
        ),
        pw.Spacer(),
        pw.Footer(
          leading: pw.Text("ĐT.QT05.BM08"),
          title: pw.Center(child: pw.Text("Ban hành lần: 02")),
          trailing: pw.Text("Ngày ban hành: 28/04/2023"),
          padding: pw.EdgeInsetsDirectional.symmetric(vertical: 3 * pw.pt),
          decoration: pw.BoxDecoration(
            border: pw.Border(
              top: pw.BorderSide(width: 0.5 * pw.pt),
            ),
          ),
        ),
      ];
    },
  );

  pdf.addPage(page);

  return await pdf.save();
}
