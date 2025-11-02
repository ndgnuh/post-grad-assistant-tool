import 'dart:typed_data';

import 'package:fami_tools/business/pdfs/common_widgets.dart';
import 'package:fami_tools/utilities/pdf_building.dart';
import 'package:fami_tools/utilities/strings.dart';

import '../../db_v2_providers.dart';
import '../pdfs.dart';

Future<PdfFile> paymentTablePdf({
  required final PhdStudentData student,
  required final TeacherData president,
  required final TeacherData secretary,
  required final TeacherData firstMember,
  required final TeacherData secondMember,
  required final TeacherData thirdMember,
}) async {
  final bytes = await buildSinglePageDocument(
    baseFontSize: 11 * pt,
    pageFormat: PdfPageFormat.a4,
    margin: EdgeInsets.symmetric(
      horizontal: 0.79 * inch,
      vertical: 1 * inch,
    ),
    build: (context) => PaymentTable(
      student: student,
      president: president,
      secretary: secretary,
      firstMember: firstMember,
      secondMember: secondMember,
      thirdMember: thirdMember,
    ),
  );

  final admissionId = student.admissionId;
  final name = student.name.toPascalCase();
  final pdfName = "BangThanhToan";

  return PdfFile(
    name: "${admissionId}_${name}_$pdfName.pdf",
    bytes: bytes,
  );
}

class PaymentTable extends StatelessWidget {
  final PhdStudentData student;
  final TeacherData president;
  final TeacherData secretary;
  final TeacherData firstMember;
  final TeacherData secondMember;
  final TeacherData thirdMember;

  PaymentTable({
    required this.student,
    required this.president,
    required this.secretary,
    required this.firstMember,
    required this.secondMember,
    required this.thirdMember,
  });

  @override
  Widget build(Context context) {
    final tableData = [
      (president, "Trưởng TB", 200_000),
      (secretary, "Thư ký TB", 200_000),
      (firstMember, "Ủy viên", 200_000),
      (secondMember, "Ủy viên", 200_000),
      (thirdMember, "Ủy viên", 200_000),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titles
        Row(
          children: [
            HustTitle(),
            Spacer(),
            VietnamTitle(),
          ],
        ),

        SizedBox(height: 32 * pt),

        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "thanh toán tiền bồi dưỡng\nchấm đề cương nghiên cứu sinh"
                  .toUpperCase(),
              style: TextStyle(fontSize: 16 * pt, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 6 * pt),
        Center(
          child: Text(
            "Kèm theo quyết định số: ${" " * 16}/QĐ-ĐHBK-ĐT-SĐH ngày ${" " * 6} tháng ${" " * 6} năm ${" " * 12}",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),

        // Student info
        SizedBox(height: 24 * pt),
        InfoField(
          texts: [
            "Họ và tên nghiên cứu sinh: ",
            student.name,
          ],
        ),

        // Payment units
        SizedBox(height: 6 * pt),
        Row(
          children: [
            Spacer(),
            InfoField(texts: ["Đơn vị: ", "VNĐ"]),
          ],
        ),
        SizedBox(height: 6 * pt),

        TableHelper.fromTextArray(
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          headerAlignment: Alignment.center,
          cellHeight: 1.25 * cm,
          columnWidths: {
            0: IntrinsicColumnWidth(),
            1: IntrinsicColumnWidth(),
            3: IntrinsicColumnWidth(),
            2: FlexColumnWidth(),
            4: IntrinsicColumnWidth(),
          },
          headerAlignments: {
            1: Alignment.center,
            2: Alignment.center,
            4: Alignment.center,
          },
          cellAlignments: {
            0: Alignment.center,
            1: Alignment.centerLeft,
            2: Alignment.centerLeft,
            3: Alignment.center,
            4: Alignment.centerRight,
          },
          textStyleBuilder: (row, data, column) {
            if (data == "Tổng cộng" || data == "1.000.000") {
              return TextStyle(fontWeight: FontWeight.bold);
            }
            return null;
          },
          data: [
            [
              "TT",
              "Họ tên, chức danh, học vị",
              "Cơ quan công tác",
              "Nhiệm vụ",
              "Thành tiền",
              "Ký nhận",
            ],
            for (final (i, (teacher, role, amount)) in tableData.indexed)
              [
                (i + 1).toString(),
                teacher.nameWithTitle,
                teacher.university,
                role,
                amount.formatMoney(),
                "",
              ],

            // TODO: use my-id setting in the DB
            // Nevermind: I'll remove myself
            // [
            //   "6",
            //   "Nguyễn Đức Hùng",
            //   "Đại học Bách khoa Hà Nội",
            //   "Người phục vụ*",
            //   "150.000",
            // ],
            ["", "Tổng cộng", "", "", "1.000.000", ""],
          ],
        ),

        // Notes on the helper
        // SizedBox(height: 3 * pt),
        // Text(
        //   "*Phục vụ buổi chấm đề cương (nước, vệ sinh phòng, chuẩn bị hồ sơ thí sinh).",
        // ),

        // Money in words
        SizedBox(height: 3 * pt),
        InfoField(
          texts: ["Bằng chữ: ", "${1_000_000.toVietnameseWords()} đồng", "."],
        ),

        // Signing area
        SizedBox(height: 12 * pt),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(child: Text(""), flex: 3, fit: FlexFit.tight),
            Flexible(
              child: Text("Hà Nội, ngày .... tháng .... năm 20...."),
              fit: FlexFit.tight,
              flex: 2,
            ),
          ],
        ),
        TableHelper.fromTextArray(
          border: TableBorder(),
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          data: [
            [
              "Ban tuyển sinh".toUpperCase(),
              "Ban TC - KH".toUpperCase(),
              "Khoa Toán - Tin".toUpperCase(),
              "Lập biểu".toUpperCase(),
            ],
          ],
        ),
      ],
    );
  }
}
