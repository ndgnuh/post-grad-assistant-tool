import 'dart:typed_data';

import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';

import '../../services/pdf_builder/index.dart';
import '../drift_orm.dart';

Future<Uint8List> admissionPaymentTablePdf({
  required AdmissionPaymentTableModel model,
}) async {
  return await buildSinglePageDocument(
    baseFontSize: 12,
    pageFormat: IsoPageFormat.horizontalA4,
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

  final int numberOfStudents;
  final int presidentAllowance;
  final int secretaryAllowance;
  final int memberAllowance;

  int get presidentTotal => presidentAllowance * numberOfStudents;
  int get secretaryTotal => secretaryAllowance * numberOfStudents;
  int get memberTotal => memberAllowance * numberOfStudents;
  int get totalPerStudent =>
      presidentAllowance + secretaryAllowance + 3 * memberAllowance;
  int get totalAmount => totalPerStudent * numberOfStudents;

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
  });
}

class AdmissionPaymentTablePdf extends StatelessWidget {
  final AdmissionPaymentTableModel model;
  AdmissionPaymentTablePdf({required this.model});

  @override
  Widget build(Context context) {
    final title1 = "THANH TOÁN TIỀN BỒI DƯỠNG";
    final title2 = "TIỂU BAN XÉT TUYỂN THẠC SĨ THEO ĐỊNH HƯỚNG NGHIÊN CỨU";
    final subtitle =
        "(Kèm theo Quyết định số: ........./QĐ-ĐHBK-TS ngày ..... tháng ..... năm .......... của Chủ tịch HĐTS năm ..........)";
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
  final AdmissionPaymentTableModel model;
  _AdmissionPaymentTable({required this.model});

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
}
