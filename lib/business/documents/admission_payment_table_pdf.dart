import 'dart:typed_data';

import 'package:fami_tools/utilities/pdf_building.dart';
import 'package:fami_tools/utilities/strings.dart';
import 'package:intl/intl.dart';

import '../main_database.dart';

Future<Uint8List> admissionPaymentTablePdf({
  required AdmissionPaymentTableModel model,
}) async {
  return await buildSinglePageDocument(
    baseFontSize: 12,
    pageFormat: PdfPageFormat.a4.landscape,
    margin: EdgeInsets.all(1 * inch),
    build: (context) => AdmissionPaymentTablePdf(
      model: model,
    ),
  );
}

class AdmissionPaymentTableModel {
  final TeacherData president;
  final TeacherData secretary;
  final TeacherData member1;
  final TeacherData member2;
  final TeacherData member3;
  final String establishmentDecisionCode;
  final DateTime establishmentDecisionDate;

  final int numberOfStudents;
  final int presidentAllowance;
  final int secretaryAllowance;
  final int memberAllowance;

  AdmissionPaymentTableModel({
    required this.president,
    required this.secretary,
    required this.member1,
    required this.member2,
    required this.member3,
    required this.numberOfStudents,
    required this.presidentAllowance,
    required this.secretaryAllowance,
    required this.memberAllowance,
    required this.establishmentDecisionCode,
    required this.establishmentDecisionDate,
  });
  int get memberTotal => memberAllowance * numberOfStudents;
  int get presidentTotal => presidentAllowance * numberOfStudents;
  int get secretaryTotal => secretaryAllowance * numberOfStudents;
  int get totalAmount => totalPerStudent * numberOfStudents;

  int get totalPerStudent =>
      presidentAllowance + secretaryAllowance + 3 * memberAllowance;
}

class AdmissionPaymentTablePdf extends StatelessWidget {
  final AdmissionPaymentTableModel model;
  AdmissionPaymentTablePdf({required this.model});

  @override
  Widget build(Context context) {
    final title1 = "THANH TOÁN TIỀN BỒI DƯỠNG";
    final title2 = "TIỂU BAN XÉT TUYỂN THẠC SĨ THEO ĐỊNH HƯỚNG NGHIÊN CỨU";
    final dateFormat = DateFormat("ngày dd tháng MM năm yyyy");
    final estCode = model.establishmentDecisionCode;
    final estDay = model.establishmentDecisionDate.day;
    final estMonth = model.establishmentDecisionDate.month;
    final estYear = model.establishmentDecisionDate.year;
    final subtitle =
        "(Kèm theo Quyết định số: $estCode ngày $estDay tháng $estMonth năm $estYear của Chủ tịch HĐTS năm $estYear)";
    final councilName = "Tiểu ban chuyên ngành: Toán tin";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Organization names
        Footer(
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bộ Giáo dục và Đào tạo".toUpperCase(),
              ),
              Text(
                "Đại học Bách Khoa Hà Nội".toUpperCase(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        // The main title
        // --------------
        SizedBox(height: 6 * pt), // Space between footer and content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              title2,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(subtitle),
          ],
        ),

        // The specialization of the council
        // This is generally not changed
        // ---------------------------------
        SizedBox(height: 6 * pt),
        Text(councilName),

        // The payment table
        // -----------------
        SizedBox(height: 3 * pt), // Space between footer and content
        _AdmissionPaymentTable(model: model),
        SizedBox(height: 3 * pt), // Space between footer and content
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            children: [
              TextSpan(text: "Tổng số tiền bằng chữ: "),
              TextSpan(
                text: "${model.totalAmount.toVietnameseWords()} đồng",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 6 * pt),

        // Signing area
        // ------------
        Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text("BAN TUYỂN SINH")),
            Flexible(child: Text("BAN TÀI CHÍNH - KẾ HOẠCH")),
            Flexible(child: Text("KHOA QUẢN NGÀNH")),
            Flexible(
              child: Column(
                children: [
                  Text("Ngày ..... tháng ..... năm .........."),
                  Text("NGƯỜI LẬP BẢNG"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AdmissionPaymentTable extends StatelessWidget {
  static const List<String> headerTexts = [
    "STT",
    "Họ và tên",
    "Đơn vị công tác",
    "Chức năng",
    "Kinh phí\n(VNĐ/thí sinh)",
    "Tổng số lượng\nthí sinh",
    "Thành tiền\n(VNĐ)",
    "Ký nhận",
  ];
  final AdmissionPaymentTableModel model;

  _AdmissionPaymentTable({required this.model});

  List<Widget> get headerCells => [
    for (final headerText in headerTexts)
      cell(
        headerText,
        fontWeight: FontWeight.bold,
      ),
  ];

  TableRow get presidentRow => TableRow(
    children: [
      cell("1"),
      cell(model.president.name, align: Alignment.centerLeft),
      cell("Khoa Toán - Tin"),
      cell("Chủ tịch"),
      cell(model.presidentAllowance.formatMoney()),
      cell(model.numberOfStudents.toString()),
      cell(model.presidentTotal.formatMoney()),
      cell(""),
    ],
  );

  TableRow get secretaryRow => TableRow(
    children: [
      cell("2"),
      cell(model.secretary.name, align: Alignment.centerLeft),
      cell("Khoa Toán - Tin"),
      cell("Thư ký"),
      cell(model.secretaryAllowance.formatMoney()),
      cell(model.numberOfStudents.toString()),
      cell(model.secretaryTotal.formatMoney()),
      cell(""),
    ],
  );

  @override
  Widget build(Context context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      tableWidth: TableWidth.max,
      children: [
        TableRow(children: headerCells),
        presidentRow,
        secretaryRow,
        memberRow(3, model.member1),
        memberRow(4, model.member2),
        memberRow(5, model.member3),
        TableRow(
          children: [
            Text(""),
            Text(""),
            Text(""),
            cell("Tổng cộng", fontWeight: FontWeight.bold),
            cell(
              model.totalPerStudent.formatMoney(),
              fontWeight: FontWeight.bold,
            ),
            cell(
              model.numberOfStudents.toString(),
              fontWeight: FontWeight.bold,
            ),
            cell(
              model.totalAmount.formatMoney(),
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ],
    );
  }

  Widget cell(
    String text, {
    Alignment align = Alignment.center,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Container(
      height: 1.1 * cm,
      padding: EdgeInsets.symmetric(horizontal: 3 * pt, vertical: 1.5 * pt),
      alignment: align,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: fontWeight),
      ),
    );
  }

  TableRow memberRow(int index, TeacherData teacher) => TableRow(
    children: [
      cell(index.toString()),
      cell(teacher.name, align: Alignment.centerLeft),
      cell("Khoa Toán - Tin"),
      cell("Ủy viên"),
      cell(model.memberAllowance.formatMoney()),
      cell(model.numberOfStudents.toString()),
      cell(model.memberTotal.formatMoney()),
      cell(""),
    ],
  );
}
