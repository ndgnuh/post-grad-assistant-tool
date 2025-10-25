import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';
import 'package:pdf/pdf.dart';

import '../../services/pdf_builder/index.dart';
import '../drift_orm.dart';
import 'utils.dart';

Future<Uint8List> admissionPaymentListingPdf({
  required AdmissionPaymentListingModel model,
}) async {
  return await buildSinglePageDocument(
    baseFontSize: 12,
    pageFormat: IsoPageFormat.verticalA4,
    margin: EdgeInsets.all(1 * inch),
    build: (context) => AdmissionPaymentListingPdf(
      model: model,
    ),
  );
}

class AdmissionPaymentListingModel {
  final String establishmentDecisionCode;
  final DateTime establishmentDecisionDate;
  final List<String> studentNames;
  final int paymentPerStudent;

  int get totalAmount => paymentPerStudent * studentNames.length;
  String get totalAmountInWords => totalAmount.toVietnameseWords();

  String formatEntry(String studentName) {
    final dateStr = DateFormat("dd/MM/yyyy").format(establishmentDecisionDate);
    return 'Thanh toán tiền cho tiểu ban xét tuyển thạc sĩ theo định hướng nghiên cứu của thí sinh $studentName, theo Quyết định số $establishmentDecisionCode ngày $dateStr';
  }

  AdmissionPaymentListingModel({
    required this.paymentPerStudent,
    required this.studentNames,
    required this.establishmentDecisionCode,
    required this.establishmentDecisionDate,
  });
}

class AdmissionPaymentListingPdf extends StatelessWidget {
  final AdmissionPaymentListingModel model;
  AdmissionPaymentListingPdf({required this.model});

  int get paymentPerStudent => model.paymentPerStudent;
  List<String> get studentNames => model.studentNames;
  String get establishmentDecisionCode => model.establishmentDecisionCode;
  DateTime get establishmentDecisionDate => model.establishmentDecisionDate;
  int get totalAmount => model.totalAmount;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Organization names
        Footer(
          leading: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "BỘ GIÁO DỤC VÀ ĐÀO TẠO"),
                TextSpan(text: "\n"),
                TextSpan(text: "ĐẠI HỌC BÁCH KHOA HÀ NỘI"),
                TextSpan(text: "\n"),
                WidgetSpan(child: SizedBox(height: 3 * pt)),
                WidgetSpan(
                  child: Container(
                    width: 100,
                    height: 1,
                    color: PdfColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),

        // The main title
        // --------------
        SizedBox(height: 12 * pt),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bản kê thanh toán".toUpperCase(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        // Money unit
        SizedBox(height: 6 * pt),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            children: [
              TextSpan(text: "Đơn vị: "),
              TextSpan(
                text: "đồng",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        // The payment table
        // -----------------
        SizedBox(height: 3 * pt),
        TableHelper.fromTextArray(
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          headerAlignments: {
            0: Alignment.center,
            1: Alignment.centerLeft,
            2: Alignment.centerRight,
          },
          cellBuilder: (colIndex, data, rowIndex) {
            final align = switch (colIndex) {
              1 => Alignment.centerLeft,
              2 => Alignment.centerRight,
              _ => Alignment.center,
            };
            final textAlign = switch (colIndex) {
              1 => TextAlign.justify,
              2 => TextAlign.right,
              _ => TextAlign.center,
            };

            // Header row
            final footerRowIndex = studentNames.length + 1;
            if (rowIndex == 0 || rowIndex == footerRowIndex) {
              return Align(
                alignment: align,
                child: Text(
                  data,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: textAlign,
                ),
              );
            }

            // Normal row
            return Align(
              alignment: align,
              child: Text(
                data,
                textAlign: textAlign,
              ),
            );
          },

          // Formatting
          columnWidths: {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: IntrinsicColumnWidth(),
          },

          // Entries
          data: [
            // headers
            ['STT', 'Nội dung chi', 'Số tiền'],

            // Entry rows
            for (final (i, name) in studentNames.indexed)
              [
                (i + 1).toString(),
                model.formatEntry(name),
                paymentPerStudent.formatMoney(),
              ],
            // Total row
            ["", "Tổng cộng", totalAmount.formatMoney()],
          ],
        ),
        SizedBox(height: 3 * pt),

        // Total amount in words
        // ---------------------
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            children: [
              TextSpan(text: "Tổng số tiền bằng chữ: "),
              TextSpan(
                text: "${totalAmount.toVietnameseWords()} đồng",
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
            Flexible(child: BoldText("NGƯỜI LẬP BIỂU")),
            Flexible(child: BoldText("KẾ TOÁN TRƯỞNG")),
            Flexible(
              child: Column(
                children: [
                  ItalicText("Ngày ..... tháng ..... năm .........."),
                  BoldText("THỦ TRƯỞNG ĐƠN VỊ"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
