import 'package:fami_tools/utilities/strings.dart';
import 'package:fami_tools/business/documents/pdf_utils.dart';

import '../../db_v2_providers.dart';
import '../../documents.dart';

class PhdAdmissionScoreSheetDocument {
  final PhdStudentData student;
  final int? year;

  Future<PdfFile> get pdf async {
    return await _scoreSheetPdf(
      student: student,
      year: year,
    );
  }

  PhdAdmissionScoreSheetDocument({
    required this.student,
    this.year,
  });
}

Future<PdfFile> _scoreSheetPdf({
  required PhdStudentData student,
  int? year,
}) async {
  final pdfName = "PhieuDiem";
  final name = student.name.toPascalCase();
  final admissionId = student.admissionId;
  final fileName = "${admissionId}_${name}_$pdfName.pdf";

  final bytes = await buildSinglePageDocument(
    pageFormat: PdfPageFormat.a4,
    baseFontSize: 11 * pt,
    margin: EdgeInsets.all(0.25 * inch),
    build: (context) => _TiledScoreSheet(
      student: student,
      year: year,
      copies: 6,
    ),
  );

  return PdfFile(name: fileName, bytes: bytes);
}

class _TiledScoreSheet extends StatelessWidget {
  final PhdStudentData student;
  final int? year;
  final int copies;

  _TiledScoreSheet({
    required this.student,
    this.year,
    this.copies = 6,
  });

  @override
  Widget build(Context context) {
    return GridView(
      crossAxisCount: 2,
      children: [
        for (int i = 0; i < copies; i++)
          _SingleScoreSheet(
            student: student,
            year: year,
          ),
      ],
    );
  }
}

class _SingleScoreSheet extends StatelessWidget {
  int? year;
  final PhdStudentData student;

  _SingleScoreSheet({
    required this.student,
    this.year,
  });

  @override
  Widget build(Context context) {
    // Default year
    year ??= DateTime.now().year;
    final style = context.defaultTextStyle;
    final skip = SizedBox(height: 3 * pt);

    final mainLayout = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Footer(title: Text("PHIẾU CHO ĐIỂM", style: style.bold)),
        Footer(
          title: Text("XÉT TUYỂN NCS", style: style.bold),
        ),
        SizedBox(height: 6 * pt),

        // Basic information
        Dotfill(
          leading: InfoField(texts: ["Họ và tên: ", student.name]),
        ),
        skip,
        Dotfill(
          leading: InfoField(texts: ["Ngành: ", student.majorName]),
        ),
        skip,
        Dotfill(
          leading: InfoField(
            texts: ["Hướng chuyên sâu: ", student.majorSpecialization.label],
          ),
        ),
        skip,
        Dotfill(
          leading: InfoField(texts: ["Mã số: ", student.majorId]),
        ),
        skip,

        // Scoring form
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kết quả bảo vệ: "),
            Expanded(
              child: Table(
                defaultColumnWidth: FlexColumnWidth(),
                children: [
                  TableRow(
                    children: [
                      PrintedCheckBox("Xuất sắc"),
                      PrintedCheckBox("Khá"),
                    ],
                  ),
                  TableRow(children: [skip]),
                  TableRow(
                    children: [
                      PrintedCheckBox("Trung bình"),
                      PrintedCheckBox("Không tuyển"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        // Signing area
        SizedBox(height: 6 * pt),
        Footer(
          trailing: Column(
            children: [
              Text("Hà Nội, ngày .... tháng .... năm $year"),
              SizedBox(height: 1 * pt),
              Text("ỦY VIÊN TIỂU BAN", style: style.bold),
              Text("(ký & ghi rõ họ tên)", style: style.italic),
            ],
          ),
        ),
        Spacer(),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1 * pt),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 0.4 * inch,
        vertical: 0.3 * inch,
      ),
      child: mainLayout,
    );
  }
}
