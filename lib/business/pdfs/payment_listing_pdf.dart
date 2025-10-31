import 'dart:typed_data';

import 'package:fami_tools/utilities/pdf_building.dart';
import 'package:fami_tools/utilities/strings.dart';

const _headings = [
  "TT",
  "Số\nhóa đơn",
  "Số\nchứng từ",
  "Ngày\nchứng từ",
  "Mục,\ntiểu mục",
  "Nội dung chi",
  "Số tiền\n(đ)",
];

const _magicInsiderCode = "6449";
const _magicOutsiderCode = "6756";

Future<Uint8List> paymentListingPdf({
  required PaymentListingTableModel model,
}) async {
  return await buildMultiPageDocument(
    pageFormat: PdfPageFormat.a4,
    baseFontSize: 11.0,
    margin: EdgeInsets.all(0.7 * PdfPageFormat.inch),
    build: (context) => [
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
                child: Container(width: 100, height: 1, color: PdfColors.black),
              ),
            ],
          ),
        ),
      ),

      // The big title
      SizedBox(height: 18 * pt),
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "BẢNG KÊ CHỨNG TỪ THANH TOÁN"),
              TextSpan(text: "\n"),
              TextSpan(text: model.reason.toUpperCase()),
            ],
          ),
        ),
      ),

      /// Money unit
      SizedBox(height: 12 * pt),
      Footer(
        trailing: Text("Đơn vị tính: đồng"),
      ),

      /// Listing table + money in words
      SizedBox(height: 6 * pt),
      PaymentListingTable(model: model),
      SizedBox(height: 6 * pt),
      Footer(
        trailing: Text(
          "(Bằng chữ: ${model.total.toVietnameseWords()} đồng)",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),

      // Sign area
      SizedBox(height: 12 * pt),
      Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Text(
              "LẬP BIỂU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Text(
              "KẾ TOÁN TRƯỞNG",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hà Nội, ngày ..... tháng ..... năm ..........",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  "TƯQ GIÁM ĐỐC",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "TRƯỞNG KHOA KHOA TOÁN - TIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  softWrap: false,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

typedef PaymentListingEntry = ({String reason, int amount});

class PaymentListingTable extends StatelessWidget {
  final PaymentListingTableModel model;
  PaymentListingTable({required this.model});

  @override
  Widget build(Context context) {
    final insiderEntries = model.insiderEntries;
    final outsiderEntries = model.outsiderEntries;

    // Insider payments
    final insiderRows = <List<String>>[];
    for (final (i, entry) in insiderEntries.indexed) {
      final row = <String>[
        (i + 1).toString(),
        "",
        "",
        "",
        _magicInsiderCode,
        entry.reason,
        entry.amount.formatMoney(),
      ];
      insiderRows.add(row);
    }

    // Outsider payments
    final outsiderRows = <List<String>>[];
    for (final (i, entry) in outsiderEntries.indexed) {
      final row = <String>[
        (i + 1).toString(),
        "",
        "",
        "",
        _magicOutsiderCode,
        entry.reason,
        entry.amount.formatMoney(),
      ];
      outsiderRows.add(row);
    }

    // Summary rows
    final insiderSummaryRow = [
      "",
      "",
      "",
      "",
      "",
      "CỘNG $_magicInsiderCode",
      model.insiderTotal.formatMoney(),
    ];
    final outsiderSummaryRow = [
      "",
      "",
      "",
      "",
      "",
      "CỘNG $_magicOutsiderCode",
      model.outsiderTotal.formatMoney(),
    ];

    // If either insider or outsider rows are empty, their summary row is omitted
    final hasMultipleSection = !(insiderRows.isEmpty || outsiderRows.isEmpty);

    // Final summary row
    final totalRow = [
      "",
      "",
      "",
      "",
      "",
      if (hasMultipleSection)
        "TỔNG CỘNG ($_magicInsiderCode + $_magicOutsiderCode)"
      else
        "TỔNG CỘNG",
      (model.insiderTotal + model.outsiderTotal).formatMoney(),
    ];

    // All the rows
    final allRows = [
      _headings,
      ...insiderRows,
      if (hasMultipleSection) insiderSummaryRow,
      ...outsiderRows,
      if (hasMultipleSection) outsiderSummaryRow,
      totalRow,
    ];

    // Which row are bold?
    final boldRows = <int>{allRows.length - 1};
    if (hasMultipleSection) {
      // Insider summary row
      boldRows.add(insiderRows.length + 1);
      boldRows.add(insiderRows.length + outsiderRows.length + 2);
    }

    return TableHelper.fromTextArray(
      headerAlignments: {for (int i = 0; i < 8; i++) i: Alignment.center},
      cellAlignment: Alignment.center,
      cellAlignments: {
        6: Alignment.centerRight,
        5: Alignment.centerLeft, // Content column
      },
      cellBuilder: (col, data, row) {
        if (col == 5 && !boldRows.contains(row)) {
          return Text(data.toString(), textAlign: TextAlign.justify);
        }
        return null; // Default cell
      },
      textStyleBuilder: (col, data, row) {
        if (boldRows.contains(row)) {
          return TextStyle(fontWeight: FontWeight.bold);
        }
        return null; // Default style
      },
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      columnWidths: {
        1: FixedColumnWidth(60), // Fixed width for invoice number
        2: FixedColumnWidth(60), // Fixed width for invoice number
        3: FixedColumnWidth(90), // Fixed width for invoice number
        5: FlexColumnWidth(), // Wider column for content
      },
      data: allRows,
    );
  }
}

class PaymentListingTableModel {
  final List<PaymentListingEntry> insiderEntries;
  final List<PaymentListingEntry> outsiderEntries;
  final String reason;

  const PaymentListingTableModel({
    required this.insiderEntries,
    required this.outsiderEntries,
    required this.reason,
  });

  int get insiderTotal => insiderEntries.fold(
    0,
    (previousValue, element) => previousValue + element.amount,
  );

  int get outsiderTotal => outsiderEntries.fold(
    0,
    (previousValue, element) => previousValue + element.amount,
  );

  int get total => insiderTotal + outsiderTotal;
}
