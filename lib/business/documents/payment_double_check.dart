// Double check the payment details before processing the transaction.

import 'package:fami_tools/business/documents/common_widgets.dart';
import 'package:fami_tools/business/documents/pdf_utils.dart';
import 'package:fami_tools/business/documents/utilities/xlsx_builder.dart';
import 'package:fami_tools/services/misc_services.dart';
import 'package:fami_tools/utilities/strings.dart';

import '../documents.dart';
import '../main_database.dart';

XlsxFile _xlsx(PaymentDoubleCheckModel model) {
  final name = model.name;
  // Build XLSX file here
  final bytes = buildExcel(
    builders: {
      "Theo bộ": (sheet) => _xlsxBuilder(sheet, model, false),
      "Tổng hợp": (sheet) => _xlsxBuilder(sheet, model, true),
    },
  );
  return XlsxFile(name: name, bytes: bytes);
}

void _xlsxBuilder(Sheet sheet, PaymentDoubleCheckModel model, bool summary) {
  /// Start at B2
  final ptr = CellPointer(CellIndex.indexByString("B1"));
  final style = sheet.defaultCellStyle;

  /// Formal headers
  sheet.setCell(
    value: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
    cellIndex: ptr.current,
    style: style.bold.center,
  );

  ptr.advanceRow();
  sheet.setCell(
    value: "KHOA TOÁN - TIN",
    cellIndex: ptr.current,
    style: style.bold.center,
  );

  ptr.advanceRow(); // Skip 1
  ptr.advanceRow(); // This is suppose to be the title
  final titleRow = ptr.current.rowIndex;
  ptr.advanceRow(); // Skip 1
  ptr.advanceRow(); // Skip 1

  final tableData = summary ? model.summaryTableData : model.tableData;

  ptr.jumpToColumn(0);
  sheet.addTable(
    topLeftIndex: ptr.current,
    header: model.tableHeaders,
    data: tableData,
    headerStyle: style.bold.center,
    cellStyleBuilder: (rowIndex, colIndex, cellData, defaultStyle) {
      final colStyle = switch ((colIndex, cellData)) {
        (0, _) => defaultStyle.center,
        (1, _) => defaultStyle,
        (_, int value) => defaultStyle.copyWith(
          numberFormat: NumFormat.custom(
            formatCode: value
                .formatMoney()
                .replaceAll(
                  RegExp('\\d'),
                  '#',
                )
                .replaceAll('.', ','),
          ),
        ),
        _ => defaultStyle.center,
      };

      // Is summary row
      if (tableData[rowIndex][0] == "") {
        return colStyle.bold;
      }

      // Bold the last row (summary)
      if (rowIndex == tableData.length - 1) {
        return colStyle.bold;
      }
      return colStyle;
    },
  );

  ptr.jumpToRow(sheet.maxRows);
  ptr.advanceColumn();
  sheet.setCell(
    value: "Bằng chữ: ${model.totalPayment.toVietnameseWords()} đồng.",
    cellIndex: ptr.current,
    style: style.bold,
  );

  ptr.advanceRow(2);
  ptr.jumpToColumn(sheet.maxColumns - 2);

  sheet.setCell(
    value: "Hà Nội, ngày ....... tháng ....... năm 20....",
    cellIndex: ptr.current,
    style: style.italic.center,
  );
  ptr.advanceRow();
  sheet.setCell(
    cellIndex: ptr.current,
    value: "TRƯỞNG KHOA KHOA TOÁN - TIN",
    style: style.bold.center,
  );
  ptr.advanceRow();
  sheet.setCell(
    value: "(Ký, ghi rõ họ tên)",
    cellIndex: ptr.current,
    style: style.center,
  );

  // Go back to title
  ptr.jumpToRow(titleRow);
  ptr.jumpToColumn(0);
  sheet.setCell(
    value: model.title.toUpperCase(),
    cellIndex: ptr.current,
    mergeTo: ptr.jumpToColumn(sheet.maxColumns - 1),
    style: style.bold.center,
  );

  // Set column widths
  sheet.setColumnWidth(0, 5); // TT
  sheet.setColumnWidth(1, 25); // Họ và tên
  for (var i = 2; i < sheet.maxColumns; i++) {
    sheet.setColumnWidth(i, 15); // Payment columns
  }
}

class PaymentDoubleCheckEntry<R extends PaymentRole> {
  final TeacherData teacher;
  final Set<R> roles;
  final Map<R, int> paymentPerRole;

  PaymentDoubleCheckEntry({
    required this.teacher,
    required this.roles,
    required this.paymentPerRole,
  });
}

class PaymentDoubleCheckModel<R extends PaymentRole> {
  /// QoL constructor for entry
  // ignore: constant_identifier_names
  static const Entry = PaymentDoubleCheckEntry.new;

  final String title;
  final List<PaymentDoubleCheckEntry> entries;

  final List<R> roles;

  /// Create model for thesis defense payment double check
  // static PaymentDoubleCheckModel<ThesisPaymentRole> forThesisDefense({
  //   required List<PaymentDoubleCheckEntry> entries,
  // }) {
  //   return PaymentDoubleCheckModel(
  //     entries: entries,
  //     roles: ThesisPaymentRole.values,
  //   );
  // }

  /// Create model for PhD admission payment double check
  static PaymentDoubleCheckModel<PhdAdmissionRole> forPhdAdmission({
    required List<TeacherData> presidents,
    required List<TeacherData> secretaries,
    required List<TeacherData> firstMembers,
    required List<TeacherData> secondMembers,
    required List<TeacherData> thirdMembers,
    required List<TeacherData> helpers,
    required List<PhdAdmissionPaymentPolicyData> paymentPolicies,
  }) {
    final entries = <PaymentDoubleCheckEntry>[];
    final roles = PhdAdmissionRole.values;

    /// Populate entries
    for (final (i, president) in presidents.indexed) {
      final secretary = secretaries[i];
      final firstMember = firstMembers[i];
      final secondMember = secondMembers[i];
      final thirdMember = thirdMembers[i];
      final helper = helpers[i];
      final policy = paymentPolicies[i];

      final paymentPerRole = <PhdAdmissionRole, int>{
        PhdAdmissionRole.president: policy.presidentPayment,
        PhdAdmissionRole.secretary: policy.secretaryPayment,
        PhdAdmissionRole.member: policy.memberPayment,
        PhdAdmissionRole.helper: policy.helperPayment,
      };

      entries.add(
        PaymentDoubleCheckEntry(
          paymentPerRole: paymentPerRole,
          teacher: president,
          roles: {PhdAdmissionRole.president},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          paymentPerRole: paymentPerRole,
          teacher: secretary,
          roles: {PhdAdmissionRole.secretary},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          paymentPerRole: paymentPerRole,
          teacher: firstMember,
          roles: {PhdAdmissionRole.member},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          paymentPerRole: paymentPerRole,
          teacher: secondMember,
          roles: {PhdAdmissionRole.member},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          paymentPerRole: paymentPerRole,
          teacher: thirdMember,
          roles: {PhdAdmissionRole.member},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          paymentPerRole: paymentPerRole,
          teacher: helper,
          roles: {PhdAdmissionRole.helper},
        ),
      );
    }

    return PaymentDoubleCheckModel(
      title: "Bảng tổng hợp thanh toán hội đồng chấm đề cương NCS",
      entries: entries,
      roles: roles,
    );
  }

  PaymentDoubleCheckModel({
    required this.title,
    required this.entries,
    required this.roles,
  });

  Map<R, int> get totalPerRole {
    final mapping = <R, int>{};
    for (final entry in entries) {
      final paymentPerRole = entry.paymentPerRole;
      for (final role in entry.roles) {
        final ppr = paymentPerRole[role] ?? 0;
        mapping.update(
          role as R,
          (value) => value + ppr,
          ifAbsent: () => ppr,
        );
      }
    }
    return mapping;
  }

  int get totalPayment {
    return totalPerRole.values.reduce((a, b) => a + b);
  }

  List<List<Object>> get summaryTableData {
    final dataRows = tableData;

    /// Collect teacher names
    final teachers = <String>{};
    for (final (i, row) in dataRows.indexed) {
      if (i == dataRows.length - 1) break; // Skip summary row
      final teacherName = row[1].toString();
      teachers.add(teacherName);
    }

    /// Sort by teacher names
    final rows = <List<Object>>[];
    for (final currentTeacherName in teachers) {
      final subtotal = [for (final _ in roles) 0, 0];

      innerLoop:
      for (final dataRow in dataRows) {
        final teacherName = dataRow[1].toString();
        if (currentTeacherName != teacherName) continue innerLoop;

        /// Update subtotal
        for (var i = 0; i < roles.length; i++) {
          // The row starts from index 2 for roles
          final payment = dataRow[i + 2] as int;
          subtotal[i] += payment;
        }
        subtotal[subtotal.length - 1] += dataRow.last as int;

        /// Add summary row
        rows.add(dataRow);
      }

      rows.add([
        "",
        "$currentTeacherName (tổng)",
        ...subtotal,
      ]);
    }

    rows.add([
      "",
      "Tổng cộng toàn bộ",
      for (final role in roles) totalPerRole[role] ?? 0,
      totalPayment,
    ]);

    return rows;
  }

  List<String> get tableHeaders {
    return [
      "TT",
      "Họ và tên",
      for (final role in roles) role.displayName,
      "Số tiền (VNĐ)",
    ];
  }

  List<List<Object>> get tableData {
    final rows = <List<Object>>[];

    for (final (i, entry) in entries.indexed) {
      final paymentPerRole = entry.paymentPerRole;
      final row = <Object>[
        (i + 1),
        entry.teacher.name,
      ];

      int total = 0;
      for (final role in roles) {
        final ppr = paymentPerRole[role] ?? 0;

        final payment = switch (entry.roles.contains(role)) {
          false => 0,
          true => ppr,
        };
        total += payment;

        row.add(payment);
      }

      row.add(total);
      rows.add(row);
    }

    /// Summary row
    final summaryRow = [
      "",
      "Tổng cộng",
      for (final role in roles) totalPerRole[role] ?? 0,
      totalPayment,
    ];
    rows.add(summaryRow);

    return rows;
  }

  // Document name
  String get name => "KiemTra_ThanhToan";

  /// Build [XlsxFile] for payment ATM
  XlsxFile get xlsx => _xlsx(this);

  /// Build [PdfFile] for payment ATM
  Future<PdfFile> pdf({
    PdfConfig config = const PdfConfig(),
  }) => _pdf(model: this, summary: false, config: config);

  Future<PdfFile> summaryPdf({
    PdfConfig config = const PdfConfig(),
  }) => _pdf(model: this, summary: true, config: config);
}

mixin PaymentRole {
  String get displayName;
}

enum PhdAdmissionRole with PaymentRole {
  president("Chủ tịch"),
  secretary("Thư ký"),
  member("Ủy viên"),
  helper("Phục vụ");

  @override
  final String displayName;
  const PhdAdmissionRole(this.displayName);
}

enum ThesisPaymentRole with PaymentRole {
  president("Chủ tịch"),
  secretary("Thư ký"),
  reviewer("Phản biện"),
  commentation("Viết nhận xét"),
  member("Ủy viên");

  @override
  final String displayName;
  const ThesisPaymentRole(this.displayName);
}

List<Widget> _pdfBuilder({
  required Context context,
  required PaymentDoubleCheckModel model,
  required PdfConfig config,
  required bool summary,
}) {
  final formalTitle = FormalTitle(
    firstTitle: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
    secondTitle: "KHOA TOÁN - TIN",
  );

  final title = Center(
    child: Text(
      model.title.toUpperCase(),
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  final tableData = summary ? model.summaryTableData : model.tableData;
  final tableHeaders = model.tableHeaders;
  final table = EzTable(
    headers: tableHeaders,
    data: tableData,
    padding: EdgeInsets.symmetric(
      vertical: config.verticalTableCellPadding,
      horizontal: config.horizontalTableCellPadding,
    ),
    textStyleBuilder: (rowIndex, colIndex, data, defaultTextStyle) {
      if (rowIndex == tableData.length - 1 || tableData[rowIndex][0] == "") {
        return defaultTextStyle.copyWith(fontWeight: FontWeight.bold);
      }
      return defaultTextStyle;
    },
    alignments: {
      0: Alignment.center,
      1: Alignment.centerLeft,
      for (var i = 2; i < tableHeaders.length; i++) i: Alignment.centerRight,
    },
    rowBuilder: (rowIndex, row) {
      if (rowIndex == tableData.length - 1) {
        return [
          row[0].toString(),
          row[1].toString(),
          for (int i = 2; i < row.length - 1; i++) formatMoney(row[i] as int),
          formatMoney(row.last as int),
        ];
      }

      final rowFmt = <String>[];
      rowFmt.add(row[0].toString());
      for (int i = 1; i < row.length - 1; i++) {
        switch (row[i]) {
          case int n when n == 0:
            rowFmt.add("");
          case int n:
            rowFmt.add(formatMoney(n));
          default:
            rowFmt.add(row[i].toString());
        }
      }
      rowFmt.add(formatMoney(row.last as int));
      return rowFmt;
    },
  );

  final footer = Row(
    children: [
      Spacer(flex: 9),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hà Nội, ngày ....... tháng ....... năm 20....",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            "TRƯỞNG KHOA KHOA TOÁN - TIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1 * pt),
          Text("(Ký, ghi rõ họ tên)"),
          SizedBox(height: 3 * cm),
        ],
      ),
      Spacer(flex: 1),
    ],
  );

  final totalText = Row(
    children: [
      Spacer(),
      InfoField(
        texts: [
          "Bằng chữ: ",
          "${model.totalPayment.toVietnameseWords()} đồng.",
        ],
      ),
    ],
  );

  return [
    formalTitle,
    SizedBox(height: 9 * pt),
    title,
    SizedBox(height: 6 * pt),
    table,
    SizedBox(height: 3 * pt),
    totalText,
    SizedBox(height: 6 * pt),
    footer,
  ];
}

Future<PdfFile> _pdf({
  required PaymentDoubleCheckModel model,
  required bool summary,
  PdfConfig config = const PdfConfig(),
}) async {
  final bytes = await buildMultiPageDocument(
    pageFormat: PdfPageFormat.a4.landscape,
    baseFontSize: config.baseFontSize,
    footer: (context) {
      return Footer(
        trailing: Text("Trang ${context.pageNumber} / ${context.pagesCount}"),
      );
    },
    margin: EdgeInsets.symmetric(
      horizontal: config.horizontalMargin,
      vertical: config.verticalMargin,
    ),
    build: (context) {
      return _pdfBuilder(
        context: context,
        model: model,
        summary: summary,
        config: config,
      );
    },
  );
  final name = summary ? model.name : "${model.name}_ChiTiet";
  return PdfFile(name: name, bytes: bytes, config: config);
}
