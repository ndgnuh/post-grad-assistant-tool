import 'package:fami_tools/business/documents/pdf_utils.dart';
import 'package:fami_tools/utilities/strings.dart';

import '../common_widgets.dart';
import '../../db_v2_providers.dart';
import '../../documents.dart';

class PhdAdmissionPaymentDocument {
  final PhdStudentData student;
  final TeacherData president;
  final TeacherData secretary;
  final TeacherData firstMember;
  final TeacherData secondMember;
  final TeacherData thirdMember;
  final TeacherData? assistant;

  static final PdfConfig defaultPdfConfig = PdfConfig(
    pageFormat: PdfPageFormat.a4,
    horizontalMargin: 0.75 * inch,
    verticalMargin: 1 * inch,
    baseFontSize: 11 * pt,
  );

  Future<PdfFile> buildPdf(PdfConfig config) async {
    return await _paymentTablePdf(
      model: this,
      config: config,
    );
  }

  String get name {
    final admissionId = student.admissionId;
    final name = student.name.toPascalCase();
    final pdfName = "BangThanhToan";
    return "${admissionId}_${name}_$pdfName";
  }

  PhdAdmissionPaymentDocument({
    required this.student,
    required this.president,
    required this.secretary,
    required this.firstMember,
    required this.secondMember,
    required this.thirdMember,
    this.assistant,
  });
}

Future<PdfFile> _paymentTablePdf({
  required final PhdAdmissionPaymentDocument model,
  required final PdfConfig config,
}) async {
  final bytes = await buildSinglePageDocument(
    baseFontSize: config.baseFontSize,
    pageFormat: PdfPageFormat.a4,
    margin: EdgeInsets.symmetric(
      horizontal: config.horizontalMargin,
      vertical: config.verticalMargin,
    ),
    build: (context) => _PaymentTable(
      student: model.student,
      president: model.president,
      secretary: model.secretary,
      firstMember: model.firstMember,
      secondMember: model.secondMember,
      thirdMember: model.thirdMember,
      assistant: model.assistant,
    ),
  );

  return PdfFile(
    name: model.name,
    bytes: bytes,
  );
}

class _PaymentTable extends StatelessWidget {
  final PhdStudentData student;
  final TeacherData president;
  final TeacherData secretary;
  final TeacherData firstMember;
  final TeacherData secondMember;
  final TeacherData thirdMember;
  final TeacherData? assistant;

  _PaymentTable({
    required this.student,
    required this.president,
    required this.secretary,
    required this.firstMember,
    required this.secondMember,
    required this.thirdMember,
    this.assistant,
  });

  @override
  Widget build(Context context) {
    final tableData = [
      (president, "Trưởng TB", 200_000),
      (secretary, "Thư ký TB", 200_000),
      (firstMember, "Ủy viên", 150_000),
      (secondMember, "Ủy viên", 150_000),
      (thirdMember, "Ủy viên", 150_000),
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
            [
              "6",
              "Nguyễn Đức Hùng",
              "Đại học Bách khoa Hà Nội",
              "Người phục vụ*",
              "150.000",
            ],
            ["", "Tổng cộng", "", "", "1.000.000", ""],
          ],
        ),

        // Notes on the helper
        SizedBox(height: 3 * pt),
        Text(
          "*Phục vụ buổi chấm đề cương (nước, vệ sinh phòng, chuẩn bị hồ sơ thí sinh).",
        ),

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
