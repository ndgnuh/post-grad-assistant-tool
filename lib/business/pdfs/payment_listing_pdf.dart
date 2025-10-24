import 'dart:typed_data';

import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';
import 'package:pdf/pdf.dart';

import '../../services/pdf_builder/index.dart';
import '../../services/pdf_widgets.dart';

const _headings = [
  "TT",
  "Số\nhóa đơn",
  "Số\nchứng từ",
  "Ngày chứng từ",
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
              WidgetSpan(
                child: Container(width: 100, height: 1, color: PdfColors.black),
              ),
            ],
          ),
        ),
      ),

      SizedBox(height: 10), // Space between footer and content
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
      SizedBox(height: 10), // Space between footer and content

      Footer(
        trailing: Text("Đơn vị tính: đồng"),
      ),
      PaymentListingTable(model: model),
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

      SizedBox(height: 10), // Space between footer and content
      Footer(
        leading: SizedBox(
          width: 120,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: "\n"),
                TextSpan(
                  text: "LẬP BIỂU",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(text: "\n"),
              TextSpan(
                text: "KẾ TOÁN TRƯỞNG",
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
                text: "TUQ GIÁM ĐỐC\nTRƯỞNG KHOA KHOA TOÁN - TIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],
    pageFormat: IsoPageFormat.verticalA4,
    baseFontSize: 11.0,
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
    for (final entry in insiderEntries) {
      final row = <String>[
        "",
        "",
        "",
        "",
        _magicInsiderCode,
        entry.reason,
        entry.amount.formatMoney(),
      ];
      insiderRows.add(row);
    }

    final outsiderRows = <List<String>>[];
    for (final entry in outsiderEntries) {
      final row = <String>[
        "",
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

    // Final summary row
    final totalRow = [
      "",
      "",
      "",
      "",
      "",
      "TỔNG CỘNG ($_magicInsiderCode + $_magicOutsiderCode)",
      (model.insiderTotal + model.outsiderTotal).formatMoney(),
    ];

    final boldRows = {
      insiderRows.length, // The insider summary row
      insiderRows.length + outsiderRows.length + 1, // The outsider summary row
      insiderRows.length + outsiderRows.length + 2, // The final total row
    };

    return TableHelper.fromTextArray(
      headerAlignments: {for (int i = 0; i < 8; i++) i: Alignment.center},
      cellAlignment: Alignment.center,
      cellAlignments: {
        6: Alignment.centerRight,
        5: Alignment.centerLeft, // Content column
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
      data: [
        _headings,
        ...insiderRows,
        insiderSummaryRow,
        ...outsiderRows,
        outsiderSummaryRow,
        totalRow,
      ],
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
