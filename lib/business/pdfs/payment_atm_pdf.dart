import 'package:fami_tools/business/pdfs/common_widgets.dart';
import 'package:fami_tools/business/pdfs/pdfs.dart';
import 'package:fami_tools/utilities/pdf_building.dart';
import 'package:fami_tools/utilities/strings.dart';

export '../document_models/payment_atm.dart';

Future<PdfFile> paymentAtmPdf({
  required PaymentAtmModel model,
  double baseFontSize = 10,
  EdgeInsets margin = const EdgeInsets.all(1.0 * PdfPageFormat.cm),
  EdgeInsets tableCellPadding = const EdgeInsets.symmetric(
    vertical: 2 * pt,
    horizontal: 3 * pt,
  ),
}) async {
  final bytes = await buildMultiPageDocument(
    pageFormat: PdfPageFormat.a4.transpose,
    margin: margin,
    baseFontSize: baseFontSize,
    build: (context) {
      final paymentReason = model.reason.toUpperCase();
      final year = DateTime.now().year;

      // Default theme
      final theme = Theme.of(context);
      final defaultTextStyle = theme.defaultTextStyle;
      final defaultFontSize = defaultTextStyle.fontSize ?? 10;

      final totalBeforeTax = model.totalBeforeTax;
      final totalAfterTax = model.totalAfterTax;
      final totalTax = model.totalTax;

      /// Sort entries by foreign and then by name
      // payments = Map.fromEntries(
      //   payments.entries.toList()..sort((a, b) {
      //     final isForeignA = a.key.isForeign;
      //     final isForeignB = b.key.isForeign;
      //     if (isForeignA != isForeignB) {
      //       return isForeignA ? 1 : -1; // Foreign teachers come last
      //     }
      //
      //     // If both are foreign or both are local, sort by name
      //     final aFirstName = a.key.hoTen.split(" ").last;
      //     final bFirstName = b.key.hoTen.split(" ").last;
      //     return aFirstName.compareTo(bFirstName);
      //   }),
      // );

      final summaryTable = model.dataRows;
      final headers = model.dataHeaders;

      final titleStyle = TextStyle(
        fontSize: baseFontSize + 2,
        fontWeight: FontWeight.bold,
      );

      return <Widget>[
        // Header
        HustTitle(),

        // Title
        SizedBox(height: 24 * pt),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: "BẢNG TỔNG HỢP THANH TOÁN\n", style: titleStyle),
                WidgetSpan(child: SizedBox(height: 3 * pt)),
                TextSpan(text: paymentReason, style: titleStyle),
              ],
            ),
          ),
        ),

        // The summary table
        SizedBox(height: 12 * pt),
        TableHelper.fromTextArray(
          headerAlignments: {
            for (int i = 0; i < 8; i++) i: Alignment.center,
          },
          cellPadding: tableCellPadding,
          cellAlignment: Alignment.center,
          cellAlignments: {1: Alignment.centerLeft},
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          data: [headers, ...summaryTable],
          textStyleBuilder: (col, data, row) {
            if (row == 0 || (row == summaryTable.length && col != 3)) {
              return TextStyle(
                fontSize: defaultFontSize,
                fontWeight: FontWeight.bold,
              );
            }
            return TextStyle(fontSize: defaultFontSize);
          },
        ),

        // Summary text
        SizedBox(height: 12 * pt), // Space between table and summary text

        Center(
          child: InfoField(
            texts: [
              "Tổng số còn lĩnh: ",
              "${totalAfterTax.formatMoney()}đ",
              ". Bằng chữ: ",
              "${totalAfterTax.toVietnameseWords()} đồng",
              ".",
            ],
          ),
        ),

        // The date & the signing area
        SizedBox(height: 12 * pt), // Space between title and content
        Footer(
          leading: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: "\n"),
                TextSpan(
                  text: "DUYỆT CỦA BAN GIÁM ĐỐC",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: "\n"),
                TextSpan(
                  text: "BAN TÀI CHÍNH - KẾ HOẠCH",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          trailing: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: "Hà Nội, ngày .... tháng .... năm $year"),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "TRƯỞNG KHOA KHOA TOÁN - TIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ];
    },
  );

  final name = model.fileName;
  return PdfFile(name: name, bytes: bytes);
}
