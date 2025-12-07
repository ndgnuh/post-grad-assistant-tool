import 'package:fami_tools/utilities/pdf_building.dart';
import 'package:fami_tools/utilities/strings.dart';

import '../../documents.dart';

Future<PdfFile> thesisScoreSheetsPdf({
  required String studentName,
  int? year,
}) async {
  final bytes = await buildSinglePageDocument(
    baseFontSize: 11,
    pageFormat: PdfPageFormat.a4,
    margin: EdgeInsets.all(0.5 * inch),
    build: (context) => ScoreSheet(
      name: studentName,
      year: year,
    ),
  );

  final slug = studentName.toPascalCase();
  final title = "${slug}_PhieuDiem";
  final pdf = PdfFile(name: title, bytes: bytes);
  return pdf;
}

Future<PdfFile> thesisScoreSheetsMultiplePdf({
  required List<String> studentNames,
  int? year,
}) async {
  final bytes = await buildMultiPageDocument(
    baseFontSize: 11,
    pageFormat: PdfPageFormat.a4,
    margin: EdgeInsets.all(0.5 * inch),
    build: (context) => [
      for (final name in studentNames)
        ScoreSheet(
          name: name,
          year: year,
        ),
    ],
  );

  final hashCode = studentNames.join("_").toPascalCase().hashCode;
  final title = "ScoreSheets_x$hashCode";
  final pdf = PdfFile(name: title, bytes: bytes);
  return pdf;
}

class ScoreSheet extends StatelessWidget {
  final String name;
  final int? year;
  ScoreSheet({this.year, this.name = ""});

  @override
  Widget build(Context context) {
    final tile = ScoreSheetTile(year: year, name: name);
    return FullPage(
      ignoreMargins: false,
      child: Row(
        children: [
          for (int i = 0; i < 2; i++)
            Expanded(
              child: Column(
                children: [for (int j = 0; j < 3; j++) Expanded(child: tile)],
              ),
            ),
        ],
      ),
    );
  }
}

class ScoreSheetTile extends StatelessWidget {
  int? year;
  final String name;
  ScoreSheetTile({this.year, this.name = ""});

  @override
  Widget build(Context context) {
    year ??= DateTime.now().year;

    final bold = TextStyle(fontWeight: FontWeight.bold);
    final italic = TextStyle(fontStyle: FontStyle.italic);

    final mainLayout = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Footer(title: Text("PHIẾU CHẤM ĐIỂM", style: bold)),
        Footer(title: Text("BẢO VỆ LUẬN VĂN THẠC SĨ", style: bold)),
        SizedBox(height: 6 * pt),

        Dotfill(leading: InfoField(texts: ["Họ và tên học viên: ", name, " "])),
        SizedBox(height: 4 * pt),
        Dotfill(leading: InfoField(texts: ["Kết quả bảo vệ: "])),
        SizedBox(height: 4 * pt),
        Row(
          children: [
            Text("Đề nghị tiếp tục làm NCS:"),
            Spacer(flex: 2),
            PrintedCheckBox("Có"),
            Spacer(),
            PrintedCheckBox("Không"),
          ],
        ),

        SizedBox(height: 6 * pt),
        Footer(
          trailing: Column(
            children: [
              Text("Hà Nội, ngày .... tháng .... năm $year"),
              SizedBox(height: 2 * pt),
              Text("ỦY VIÊN HỘI ĐỒNG", style: bold),
              Text("(ký & ghi rõ họ tên)", style: italic),
            ],
          ),
        ),
        Spacer(),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5 * PdfPageFormat.mm,
        vertical: 10 * PdfPageFormat.mm,
      ),
      foregroundDecoration: BoxDecoration(
        border: Border.all(),
      ),
      child: mainLayout,
    );
  }
}
