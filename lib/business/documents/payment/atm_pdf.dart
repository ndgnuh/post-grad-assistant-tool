import 'package:fami_tools/business/documents/pdf_utils.dart';
import 'package:fami_tools/utilities/strings.dart';

import '../../db_v2_providers.dart';
import '../../documents.dart';
import '../common_widgets.dart';
import '../xlsx_utils.dart' hide TextSpan;

export '../models/payment_atm.dart';

final defaultDocumentConfig = PdfConfig(
  baseFontSize: 12 * pt,
  verticalMargin: 1 * inch,
  horizontalMargin: 1 * inch,
  verticalTableCellPadding: 3 * pt,
  horizontalTableCellPadding: 3 * pt,
  pageFormat: PdfPageFormat.a4.transpose,
);

const _taxPercent = 0.1;

Future<PdfFile> _pdf({
  required PaymentAtmModel model,
  PdfConfig config = const PdfConfig(),
}) async {
  final baseFontSize = config.baseFontSize;

  final bytes = await buildMultiPageDocument(
    pageFormat: PdfPageFormat.a4.transpose,
    margin: EdgeInsets.symmetric(
      vertical: config.verticalMargin,
      horizontal: config.horizontalMargin,
    ),
    baseFontSize: config.baseFontSize,
    footer: (context) => Footer(
      leading: Text("Trang ${context.pageNumber}/${context.pagesCount}"),
    ),
    build: (context) {
      final paymentReason = model.reason.toUpperCase();
      final year = DateTime.now().year;

      // Default theme
      final totalAfterTax = model.totalAfterTax;

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
        EzTable(
          data: model.dataRows,
          headers: model.dataHeaders,
          padding: EdgeInsets.symmetric(
            vertical: config.verticalTableCellPadding,
            horizontal: config.horizontalTableCellPadding,
          ),
          alignments: {
            for (int i = 0; i < 8; i++) i: Alignment.center,
            1: Alignment.centerLeft,
          },
          textStyleBuilder: (rowIndex, colIndex, data, defaultStyle) {
            if (rowIndex == model.dataRows.length - 1) {
              return defaultStyle.copyWith(
                fontWeight: FontWeight.bold,
              );
            }
            return defaultStyle;
          },
          rowBuilder: (int rowIndex, rowData) {
            if (rowIndex == model.dataRows.length - 1) {
              // Summary row style
              return [
                "",
                "Tổng",
                model.totalBeforeTax.formatMoney(),
                model.totalTax == 0 ? "" : model.totalTax.formatMoney(),
                model.totalAfterTax.formatMoney(),
                "",
                "",
                "",
              ];
            }

            return <String>[
              rowData[0].toString(),
              rowData[1].toString(),
              (rowData[2] as int).formatMoney(),
              switch (rowData[3] as int) {
                int n when n == 0 => "",
                int n => n.formatMoney(),
              },
              (rowData[4] as int).formatMoney(),
              for (int i = 5; i < rowData.length; i++) rowData[i].toString(),
            ];
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
        Column(
          children: [
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
                    TextSpan(text: "\n" * 5),
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
                    TextSpan(text: "\n" * 5),
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
                    TextSpan(text: "\n" * 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ];
    },
  );

  final name = model.fileName;
  return PdfFile(name: name, bytes: bytes, config: config);
}

XlsxFile _xlsx({required PaymentAtmModel model}) {
  final builder = _PaymentAtmExcelBuilder(model);
  final bytes = buildSingleSheetExcel(builder: builder.call);
  final file = XlsxFile(name: model.fileName, bytes: bytes);
  return file;
}

/// Map each [TeacherData] to their payment [amount]
class PaymentAtmEntry {
  final TeacherData teacher;
  final int amount;

  const PaymentAtmEntry({
    required this.teacher,
    required this.amount,
  });

  int get afterTax => amount - tax;
  int get tax => teacher.isOutsider ? (amount * _taxPercent).round() : 0;
}

/// Common model for payment ATM document generation
class PaymentAtmModel {
  final String reason;
  final List<PaymentAtmEntry> entries;

  PaymentAtmModel({
    required this.reason,
    required this.entries,
  });

  List<PaymentAtmEntry> get aggregatedEntries {
    final Map<TeacherData, int> amountMap = {};
    for (final entry in entries) {
      amountMap.update(
        entry.teacher,
        (value) => value + entry.amount,
        ifAbsent: () => entry.amount,
      );
    }
    return [
      for (final e in amountMap.entries)
        PaymentAtmEntry(teacher: e.key, amount: e.value),
    ];
  }

  List<PaymentAtmEntry> get sortedEntries {
    final sorted = List<PaymentAtmEntry>.from(aggregatedEntries);
    sorted.sort((a, b) {
      final isOutsiderA = a.teacher.isOutsider;
      final isOutsiderB = b.teacher.isOutsider;
      if (isOutsiderA != isOutsiderB) {
        return isOutsiderA ? 1 : -1; // Outsiders come last
      }

      // If both are outsiders or both are locals, sort by name
      return a.teacher.name.compareTo(b.teacher.name);
    });
    return sorted;
  }

  Future<PdfFile> pdf([PdfConfig config = const PdfConfig()]) =>
      _pdf(model: this, config: config);
  XlsxFile get xlsx => _xlsx(model: this);

  List<String> get dataHeaders => [
    "TT",
    "Họ và tên",
    "Thành tiền",
    "Thuế 10%",
    "Còn lĩnh",
    "ATM",
    "Ngân hàng",
    "Mã số thuế",
  ];

  List<List<Object>> get dataRows {
    final summaryTable = <List<Object>>[];
    for (final (i, entry) in sortedEntries.indexed) {
      final teacher = entry.teacher;
      final amount = entry.amount;
      final afterTaxAmount = entry.afterTax;
      final tax = entry.tax;
      final bankAccount = teacher.bankAccount;
      final bankName = teacher.bankName;
      final citizenId = teacher.citizenId;

      // Create summary row for each teacher
      final unknown = "Thiếu";
      final rows = <Object>[
        (i + 1),
        teacher.name,
        amount,
        tax,
        afterTaxAmount,
        bankAccount ?? unknown,
        bankName ?? unknown,
        teacher.isOutsider ? (citizenId ?? unknown) : "",
      ];
      summaryTable.add(rows);
    }

    // Add a summary row at the end
    summaryTable.add([
      "",
      "Tổng",
      totalBeforeTax,
      totalTax == 0 ? "" : totalTax,
      totalAfterTax,
      "",
      "",
      "",
    ]);

    return summaryTable;
  }

  String get fileName => "Bảng ATM $reason x2";

  int get totalAfterTax => entries.fold(
    0,
    (previousValue, element) => previousValue + element.afterTax,
  );

  int get totalBeforeTax => entries.fold(
    0,
    (previousValue, element) => previousValue + element.amount,
  );

  int get totalTax => entries.fold(
    0,
    (previousValue, element) => previousValue + element.tax,
  );
}

class _PaymentAtmExcelBuilder {
  final PaymentAtmModel model;

  _PaymentAtmExcelBuilder(this.model);

  void call(Sheet sheet) {
    final style = sheet.defaultCellStyle
        .copyWith(fontSizeVal: 12)
        .centerVertically;

    sheet.setCell(
      cellIndex: CellIndex.indexByString("A1"),
      mergeTo: CellIndex.indexByString("C1"),
      value: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
      style: style.center,
    );

    sheet.setCell(
      cellIndex: CellIndex.indexByString("A2"),
      mergeTo: CellIndex.indexByString("C2"),
      value: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
      style: style.bold.center,
    );

    sheet.setCell(
      cellIndex: CellIndex.indexByString("A4"),
      mergeTo: CellIndex.indexByString("H4"),
      value: "BẢNG TỔNG HỢP THANH TOÁN TIỀN",
      style: style.bold.center,
    );

    sheet.setCell(
      cellIndex: CellIndex.indexByString("A5"),
      mergeTo: CellIndex.indexByString("H5"),
      value: model.reason.toUpperCase(),
      style: style.bold.center,
    );

    sheet.addTable(
      topLeftIndex: CellIndex.indexByString("A7"),
      data: model.dataRows,
      header: model.dataHeaders,
      headerStyle: style.bold.center,
      cellStyle: style.center,
      cellStyleBuilder: (row, col, value, defaultStyle) {
        final style = switch (col) {
          0 => defaultStyle.center,
          1 => defaultStyle.flushLeft,
          2 || 3 || 4 => defaultStyle.flushRight.centerVertically.formatMoney,
          _ => defaultStyle,
        };

        if (col == 2 || col == 3 || col == 4) {
          // Format money columns
          print("Value type: ${value.runtimeType}");
        }

        /// Summary row style
        if (row == model.dataRows.length - 1) {
          return style.bold;
        }
        return style;
      },
    );

    final pt = CellPointer(
      CellIndex.indexByColumnRow(
        columnIndex: 0,
        rowIndex: sheet.maxRows + 1,
      ),
    );
    sheet.setCell(
      cellIndex: pt.current,
      mergeTo: pt.peek(advanceColumn: sheet.maxColumns - 1),
      value: [
        "Tổng số còn lĩnh: ",
        "${model.totalAfterTax.formatMoney()}đ",
        ". Bằng chữ: ",
        "${model.totalAfterTax.toVietnameseWords()} đồng",
        ".",
      ].join(""),
      style: style.bold.center,
    );

    sheet.setCell(
      cellIndex: pt.advanceRow(3),
      mergeTo: pt.advanceColumn(2),
      value: "DUYỆT CỦA BAN GIÁM ĐỐC",
      style: style.bold.center,
    );

    sheet.setCell(
      cellIndex: pt.advanceColumn(1),
      mergeTo: pt.advanceColumn(2),
      value: "BAN TÀI CHÍNH - KẾ HOẠCH",
      style: style.bold.center,
    );

    final numCol = 1;
    sheet.setCell(
      cellIndex: pt.advanceColumn(1),
      mergeTo: pt.peek(advanceColumn: numCol),
      value: "TRƯỞNG KHOA KHOA TOÁN-TIN",
      style: style.bold.center,
    );
    sheet.setCell(
      cellIndex: pt.advanceRow(-1),
      mergeTo: pt.peek(advanceColumn: numCol),
      style: style.italic.center,
      value: "Hà Nội, ngày ${'.' * 6} tháng ${'.' * 6} năm ${'.' * 12}",
    );

    sheet.setColumnWidth(0, 5);
    sheet.setColumnWidth(1, 25);
    sheet.setColumnWidth(2, 15);
    sheet.setColumnWidth(3, 15);
    sheet.setColumnWidth(4, 15);
    sheet.setColumnWidth(5, 25);
    sheet.setColumnWidth(6, 25);
    sheet.setColumnWidth(7, 20);
  }
}
