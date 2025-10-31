import 'dart:typed_data';

import '../../services/pdf_builder/index.dart' hide inch, pt;

import '../../services/pdf_widgets.dart';
import '../drift_orm.dart';

Future<Uint8List> phdAdmissionCouncilSuggestionPdf({
  required PhdStudentData phdStudent,
  required TeacherData supervisor,
  required List<TeacherData> councilMembers,
  TeacherData? secondarySupervisor,
}) async {
  return buildSinglePageDocument(
    pageFormat: IsoPageFormat.verticalA4,
    margin: EdgeInsets.all(1 * inch),
    baseFontSize: 12 * pt,
    build: (context) {
      return PhdAdmissionCouncilSuggestionPdf(
        phdStudent: phdStudent,
        supervisor: supervisor,
        secondarySupervisor: secondarySupervisor,
        councilMembers: councilMembers,
      );
    },
  );
}

class PhdAdmissionCouncilSuggestionPdf extends StatelessWidget {
  final PhdStudentData phdStudent;
  final TeacherData supervisor;
  final TeacherData? secondarySupervisor;
  final List<TeacherData> councilMembers;

  static List<String> roles = [
    "Chủ tịch",
    "Thư ký",
    "Ủy viên",
    "Ủy viên",
    "Ủy viên",
  ];

  PhdAdmissionCouncilSuggestionPdf({
    required this.phdStudent,
    required this.supervisor,
    required this.councilMembers,
    this.secondarySupervisor,
  });

  Widget cell(String text, [Alignment alignment = Alignment.centerLeft]) =>
      Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsets.all(6 * pt),
          child: Text(text),
        ),
      );

  @override
  Widget build(Context context) {
    final bold = TextStyle(fontWeight: FontWeight.bold);

    final supervisorNames = switch (secondarySupervisor) {
      null => supervisor.nameWithTitle,
      TeacherData s =>
        "HD1: ${supervisor.nameWithTitle}, HD2: ${s.nameWithTitle}",
    };

    SizedBox titleRule() => SizedBox(
      width: 3 * cm,
      child: Center(
        child: Divider(height: 2 * pt, thickness: 1 * pt),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Headings
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ĐẠI HỌC BÁCH KHOA HÀ NỘI", style: bold),
                Text("KHOA TOÁN - TIN", style: bold),
                titleRule(),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM", style: bold),
                Text("Độc lập - Tự do - Hạnh phúc", style: bold),
                titleRule(),
              ],
            ),
          ],
        ),

        // Title
        SizedBox(height: 32 * pt),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "PHIẾU ĐỀ XUẤT\nTIỂU BAN CHUYÊN MÔN",
              style: TextStyle(fontSize: 16 * pt, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 16 * pt),

        // Phd student information
        Table(
          border: TableBorder.all(width: 1 * pt),
          columnWidths: {
            0: FlexColumnWidth(3.0),
            1: FlexColumnWidth(7.0),
          },
          children: [
            TableRow(
              children: [
                cell("Họ và tên thí sinh"),
                cell(phdStudent.name),
              ],
            ),
            TableRow(
              children: [
                cell("Đề tài"),
                cell(phdStudent.thesis),
              ],
            ),
            TableRow(
              children: [
                cell("Ngành"),
                cell(phdStudent.majorName),
              ],
            ),
            TableRow(
              children: [
                cell("Mã số"),
                cell(phdStudent.majorId),
              ],
            ),
            TableRow(
              children: [
                cell("Người hướng dẫn"),
                cell(supervisorNames),
              ],
            ),
          ],
        ),

        // Content
        SizedBox(height: 6 * pt),
        Text("Danh sách tiểu ban:", style: bold),
        SizedBox(height: 6 * pt),

        // Table of council
        TableHelper.fromTextArray(
          headers: [
            "TT",
            "Họ tên, chức danh, học vị",
            "Cơ quan công tác",
            "Nhiệm vụ",
          ],
          headerStyle: bold,
          headerAlignments: {
            0: Alignment.center,
            1: Alignment.center,
            2: Alignment.center,
            3: Alignment.center,
          },

          cellAlignment: Alignment.center,
          cellAlignments: {1: Alignment.centerLeft, 2: Alignment.centerLeft},
          data: [
            for (final (i, teacher) in councilMembers.indexed)
              [
                (councilMembers.indexOf(teacher) + 1).toString(),
                teacher.nameWithTitle,
                teacher.university,
                roles[i],
              ],
          ],
        ),

        // Time and place
        SizedBox(height: 6 * pt),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(text: "Thời gian xét tuyển: ${"." * 30}"),
        ),
        SizedBox(height: 3 * pt),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(text: "Địa điểm xét tuyển: ${"." * 30}"),
        ),

        // Signatures
        SizedBox(height: 16 * pt),
        Row(
          children: [
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Ngày ...... tháng ...... năm ............",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text("KHOA TOÁN - TIN", style: bold),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
