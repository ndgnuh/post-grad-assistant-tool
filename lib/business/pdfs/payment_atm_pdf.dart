import 'dart:typed_data';

import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';
import 'package:pdf/pdf.dart';

import '../drift_orm.dart';
import '../../services/pdf_builder/index.dart';

const _taxPercent = 0.1;

class PaymentAtmEntry {
  final TeacherData teacher;
  final int amount;

  int get tax => teacher.isOutsider ? (amount * _taxPercent).round() : 0;
  int get afterTax => amount - tax;

  const PaymentAtmEntry({
    required this.teacher,
    required this.amount,
  });
}

class PaymentAtmModel {
  final String reason;
  final List<PaymentAtmEntry> entries;

  int get totalBeforeTax => entries.fold(
    0,
    (previousValue, element) => previousValue + element.amount,
  );

  int get totalTax => entries.fold(
    0,
    (previousValue, element) => previousValue + element.tax,
  );

  int get totalAfterTax => entries.fold(
    0,
    (previousValue, element) => previousValue + element.afterTax,
  );

  PaymentAtmModel({
    required this.reason,
    required this.entries,
  });
}

Future<Uint8List> paymentAtmPdf({
  required PaymentAtmModel model,
}) async {
  return await buildMultiPageDocument(
    pageFormat: IsoPageFormat.horizontalA4,
    margin: EdgeInsets.all(1.0 * PdfPageFormat.cm),
    baseFontSize: 10,
    build: (context) {
      final paymentReason = model.reason.toUpperCase();

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

      final summaryTable = <List<String>>[];
      for (final (i, entry) in model.entries.indexed) {
        final teacher = entry.teacher;
        final amount = entry.amount;
        final afterTaxAmount = entry.afterTax;
        final tax = entry.tax;
        final bankAccount = teacher.bankAccount;
        final bankName = teacher.bankName;
        final citizenId = teacher.citizenId;

        assert(
          bankAccount != null && bankAccount.isNotEmpty,
          "Teacher ${teacher.name} does not have a bank account",
        );
        assert(
          bankName != null && bankName.isNotEmpty,
          "Teacher ${teacher.name} does not have a bank name",
        );
        if (teacher.isOutsider) {
          assert(
            citizenId != null && citizenId.isNotEmpty,
            "Teacher ${teacher.name} does not have citizen ID",
          );
        }

        // Create summary row for each teacher
        final rows = <String>[
          (i + 1).toString(),
          teacher.name,
          amount.formatMoney(),
          tax == 0 ? "" : tax.formatMoney(),
          afterTaxAmount.formatMoney(),
          bankAccount ?? "",
          bankName ?? "",
          teacher.isOutsider ? citizenId! : "",
        ];
        summaryTable.add(rows);
      }

      // Add a summary row at the end
      summaryTable.add([
        "",
        "Tổng",
        totalBeforeTax.formatMoney(),
        totalTax == 0 ? "" : totalTax.formatMoney(),
        totalAfterTax.formatMoney(),
        "",
        "",
        "",
      ]);

      final headers = [
        "TT",
        "Họ và tên",
        "Thành tiền",
        "Thuế 10%",
        "Còn lĩnh",
        "ATM",
        "Ngân hàng",
        "Mã số thuế",
      ];

      return <Widget>[
        // Header
        Footer(
          leading: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: "BỘ GIÁO DỤC VÀ ĐÀO TẠO"),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "\n"),
              ],
            ),
          ),
        ),

        // Title
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "BẢNG TỔNG HỢP THANH TOÁN"),
                TextSpan(text: "\n"),
                TextSpan(text: paymentReason),
              ],
            ),
          ),
        ),

        SizedBox(height: 10), // Space between title and content
        // The summary table
        TableHelper.fromTextArray(
          headerAlignments: {
            for (int i = 0; i < 8; i++) i: Alignment.center,
          },
          cellPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
        SizedBox(height: 10), // Space between table and summary text

        Center(
          child: Text(
            "Tổng số còn lĩnh: ${totalAfterTax.formatMoney()}đ Bằng chữ: ${totalAfterTax.toVietnameseWords()} đồng.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // The date & the signing area
        SizedBox(height: 10), // Space between title and content
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
                TextSpan(text: "Hà Nội, ngày .... tháng .... năm ........"),
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
}
