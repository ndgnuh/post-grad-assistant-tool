import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';
import 'package:pdf/pdf.dart';
import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../services/pdf_builder/index.dart';

// final doubleCheckPdfProvider = FutureProvider.autoDispose((ref) async {
//   final model = await ref.watch(thesisPaymentPdfModelProvider.future);
//   return await buildDoubleCheckPdf(model: model);
// });

// final incomeListingPdfProvider = FutureProvider.autoDispose((ref) async {
//   final model = await ref.watch(thesisPaymentPdfModelProvider.future);
//   return await buildIncomeListing(model: model);
// });

// final paymentListingPdfProvider = FutureProvider.autoDispose((ref) async {
//   final model = await ref.watch(thesisPaymentPdfModelProvider.future);
//   return await buildPaymentListing(model: model);
// });

// final paymentRequestPdfProvider = FutureProvider.autoDispose((ref) async {
//   final myName = await ref.watch(myNameProvider.future);
//   final myFalcuty = await ref.watch(myFalcutyProvider.future);
//   final model = await ref.watch(thesisPaymentPdfModelProvider.future);
//
//   return await buildPaymentRequestPdf(
//     requesterName: myName ?? "",
//     requesterDivision: myFalcuty,
//     payReason: model.paymentReason,
//     payAmount: model.totalBeforeTax,
//   );
// });

// final paymentSummaryPdfProvider = FutureProvider.autoDispose((ref) async {
//   final model = await ref.watch(thesisPaymentPdfModelProvider.future);
//   return await buildPaymentSummaryPdf(model: model);
// });

// final thesisPaymentPdfModelProvider = FutureProvider.autoDispose((ref) async {
//   final thesesIds = await ref.watch(trackedThesisData.future);
//   final theses = await ref.watch(thesesByIdsProvider(thesesIds).future);
//   return await ThesisData.createFrom(
//     theses: theses,
//     paymentReason: "Hội đồng chấm luận văn thạc sĩ",
//   );
// });

Future<Uint8List> buildDoubleCheckPdf({
  required ThesisData model,
}) async {
  return await buildMultiPageDocument(
    margin: EdgeInsets.all(0.5 * PdfPageFormat.inch),
    build: (context) => [
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "BẢNG KIỂM TRA LẠI SỐ LIỆU THANH TOÁN"),
              TextSpan(text: "\n"),
              // TextSpan(text: model.paymentReason.toUpperCase()),
              TextSpan(text: "\n"),
            ],
          ),
        ),
      ),

      SizedBox(height: 10), // Space between title and content
      _PaymentListingTable(model: model),
    ],
    pageFormat: IsoPageFormat.verticalA4,
    baseFontSize: 10.0,
  );
}

Future<Uint8List> buildIncomeListing({
  required ThesisData model,
}) async {
  return await buildMultiPageDocument(
    margin: EdgeInsets.all(0.5 * PdfPageFormat.inch),
    build: (context) => [
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "TỔNG HỢP THU NHẬP CÁN BỘ TRONG TRƯỜNG"),
              TextSpan(text: "\n"),
              TextSpan(text: "\n"),
            ],
          ),
        ),
      ),

      SizedBox(height: 10), // Space between title and content
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
        trailing: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(text: "Hà Nội, ngày .... tháng .... năm ........"),
              TextSpan(text: "\n"),
              TextSpan(
                text: "KHOA TOÁN - TIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],
    pageFormat: IsoPageFormat.verticalA4,
    baseFontSize: 10.0,
  );
}

Future<Uint8List> buildPaymentListing({
  required ThesisData model,
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
            ],
          ),
        ),
      ),
      SizedBox(height: 10), // Space between footer and content

      Footer(
        trailing: Text("Đơn vị tính: đồng"),
      ),
      _PaymentListingTable(model: model),
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

Future<Uint8List> buildPaymentRequestPdf({
  required String requesterName,
  required String requesterDivision,
  required String payReason,
  required int payAmount,
}) async {
  return await buildSinglePageDocument(
    baseFontSize: 14,
    pageFormat: IsoPageFormat.horizontalA5,
    build: (context) => _PaymentRequestPage(
      requesterName: requesterName,
      requesterDivision: requesterDivision,
      payReason: payReason,
      payAmount: payAmount,
    ),
  );
}

Future<Uint8List> buildPaymentSummaryPdf({
  required ThesisData model,
}) async {
  return await buildMultiPageDocument(
    pageFormat: IsoPageFormat.horizontalA4,
    margin: EdgeInsets.all(1.0 * PdfPageFormat.cm),
    baseFontSize: 10,
    build: (context) {
      return [];
      // final payments = model.payoutPerTeacher;
      // final paymentReason = model.paymentReason.toUpperCase();
      //
      // // Default theme
      // final theme = Theme.of(context);
      // final defaultTextStyle = theme.defaultTextStyle;
      // final defaultFontSize = defaultTextStyle.fontSize ?? 10;
      //
      // final totalBeforeTax = model.totalBeforeTax;
      // final totalAfterTax = model.totalAfterTax;
      // final totalTax = model.totalBeforeTax - model.totalAfterTax;
      //
      // /// Sort entries by foreign and then by name
      // // payments = Map.fromEntries(
      // //   payments.entries.toList()..sort((a, b) {
      // //     final isForeignA = a.key.isOutsider;
      // //     final isForeignB = b.key.isOutsider;
      // //     if (isForeignA != isForeignB) {
      // //       return isForeignA ? 1 : -1; // Foreign teachers come last
      // //     }
      // //
      // //     // If both are foreign or both are local, sort by name
      // //     final aFirstName = a.key.name.split(" ").last;
      // //     final bFirstName = b.key.name.split(" ").last;
      // //     return aFirstName.compareTo(bFirstName);
      // //   }),
      // // );
      //
      // final summaryTable = <List<String>>[];
      // for (final (i, entry) in payments.entries.indexed) {
      //   final teacher = entry.key;
      //   final payment = entry.value;
      //
      //   final afterTaxAmount = payment.afterTax;
      //   final tax = payment.tax;
      //
      //   // Create summary row for each teacher
      //   final rows = <String>[
      //     (i + 1).toString(),
      //     teacher.name,
      //     payment.moneyTotal.formatMoney(),
      //     tax == 0 ? "" : tax.formatMoney(),
      //     afterTaxAmount.formatMoney(),
      //     teacher.bankAccount ?? "",
      //     teacher.bankName ?? "",
      //     // New laws requires citizen ID instead of tax code
      //     // What??
      //     teacher.citizenId ?? "",
      //   ];
      //   summaryTable.add(rows);
      // }
      //
      // // Add a summary row at the end
      // summaryTable.add([
      //   "",
      //   "Tổng",
      //   totalBeforeTax.formatMoney(),
      //   totalTax == 0 ? "" : totalTax.formatMoney(),
      //   totalAfterTax.formatMoney(),
      //   "",
      //   "",
      //   "",
      // ]);
      //
      // final headers = [
      //   "TT",
      //   "Họ và tên",
      //   "Thành tiền",
      //   "Thuế 10%",
      //   "Còn lĩnh",
      //   "ATM",
      //   "Ngân hàng",
      //   "Mã số thuế",
      // ];
      //
      // return <Widget>[
      //   // Header
      //   Footer(
      //     leading: RichText(
      //       textAlign: TextAlign.center,
      //       text: TextSpan(
      //         children: [
      //           TextSpan(text: "BỘ GIÁO DỤC VÀ ĐÀO TẠO"),
      //           TextSpan(text: "\n"),
      //           TextSpan(
      //             text: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           TextSpan(text: "\n"),
      //         ],
      //       ),
      //     ),
      //   ),
      //
      //   // Title
      //   Center(
      //     child: RichText(
      //       textAlign: TextAlign.center,
      //       text: TextSpan(
      //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //         children: [
      //           TextSpan(text: "BẢNG TỔNG HỢP THANH TOÁN"),
      //           TextSpan(text: "\n"),
      //           TextSpan(text: paymentReason),
      //         ],
      //       ),
      //     ),
      //   ),
      //
      //   SizedBox(height: 10), // Space between title and content
      //   // The summary table
      //   TableHelper.fromTextArray(
      //     headerAlignments: {
      //       for (int i = 0; i < 8; i++) i: Alignment.center,
      //     },
      //     cellPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      //     cellAlignment: Alignment.center,
      //     cellAlignments: {1: Alignment.centerLeft},
      //     headerStyle: TextStyle(fontWeight: FontWeight.bold),
      //     data: [headers, ...summaryTable],
      //     textStyleBuilder: (col, data, row) {
      //       if (row == 0 || (row == summaryTable.length && col != 3)) {
      //         return TextStyle(
      //           fontSize: defaultFontSize,
      //           fontWeight: FontWeight.bold,
      //         );
      //       }
      //       return TextStyle(fontSize: defaultFontSize);
      //     },
      //   ),
      //
      //   // Summary text
      //   SizedBox(height: 10), // Space between table and summary text
      //
      //   Center(
      //     child: Text(
      //       "Tổng số còn lĩnh: ${totalAfterTax.formatMoney()}đ Bằng chữ: ${totalAfterTax.toVietnameseWords()} đồng.",
      //       textAlign: TextAlign.justify,
      //       style: TextStyle(fontWeight: FontWeight.bold),
      //     ),
      //   ),
      //
      //   // The date & the signing area
      //   SizedBox(height: 10), // Space between title and content
      //   Footer(
      //     leading: RichText(
      //       textAlign: TextAlign.center,
      //       text: TextSpan(
      //         children: [
      //           TextSpan(text: "\n"),
      //           TextSpan(
      //             text: "DUYỆT CỦA BAN GIÁM ĐỐC",
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //         ],
      //       ),
      //     ),
      //     title: RichText(
      //       textAlign: TextAlign.center,
      //       text: TextSpan(
      //         children: [
      //           TextSpan(text: "\n"),
      //           TextSpan(
      //             text: "BAN TÀI CHÍNH - KẾ HOẠCH",
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //         ],
      //       ),
      //     ),
      //     trailing: RichText(
      //       textAlign: TextAlign.center,
      //       text: TextSpan(
      //         children: [
      //           TextSpan(text: "Hà Nội, ngày .... tháng .... năm ........"),
      //           TextSpan(text: "\n"),
      //           TextSpan(
      //             text: "TRƯỞNG KHOA KHOA TOÁN - TIN",
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ];
    },
  );
}

List<Widget> _buildPaymentSummary({
  required Context context,
  required Map<TeacherData, int> payments,
  required String paymentReason,
}) {
  /// This function builds a payment summary PDF document.

  // Default theme
  final theme = Theme.of(context);
  final defaultTextStyle = theme.defaultTextStyle;
  final defaultFontSize = defaultTextStyle.fontSize ?? 10;

  final totalBeforeTax = payments.values.fold(0, (a, b) => a + b);
  final taxRate = 0.1; // 10% tax rate
  final afterTax = <TeacherData, int>{};
  int totalTax = 0;
  int totalAfterTax = 0;
  paymentReason = paymentReason.toUpperCase();

  /// Sort entries by foreign and then by name
  payments = Map.fromEntries(
    payments.entries.toList()..sort((a, b) {
      final isForeignA = a.key.isOutsider;
      final isForeignB = b.key.isOutsider;
      if (isForeignA != isForeignB) {
        return isForeignA ? 1 : -1; // Foreign teachers come last
      }

      // If both are foreign or both are local, sort by name
      final aFirstName = a.key.name.split(" ").last;
      final bFirstName = b.key.name.split(" ").last;
      return aFirstName.compareTo(bFirstName);
    }),
  );

  final summaryTable = <List<String>>[];
  for (final (i, entry) in payments.entries.indexed) {
    final teacher = entry.key;
    final amount = entry.value;

    /// Calculate tax and after-tax amounts for each teacher
    final tax = switch (teacher.isOutsider) {
      false => 0,
      true => (amount * taxRate).round(),
    };
    final afterTaxAmount = amount - tax;

    // Store total value
    afterTax[teacher] = afterTaxAmount;
    totalTax += tax;
    totalAfterTax += afterTaxAmount;

    // Create summary row for each teacher
    final rows = <String>[
      (i + 1).toString(),
      teacher.name,
      amount.formatMoney(),
      tax == 0 ? "" : tax.formatMoney(),
      afterTaxAmount.formatMoney(),
      teacher.bankAccount ?? "",
      teacher.bankName ?? "",
      teacher.citizenId ?? "",
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
      headerAlignments: {for (int i = 0; i < 8; i++) i: Alignment.center},
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
}

// class PayoutPerTeacher {
//   final TeacherData teacher;
//   final int timesPresident;
//   final int timesSecretary;
//   final int timesReviewer;
//   final int timesMember;
//
//   const PayoutPerTeacher({
//     required this.teacher,
//     this.timesPresident = 0,
//     this.timesSecretary = 0,
//     this.timesReviewer = 0,
//     this.timesMember = 0,
//   });
//   int get afterTax => moneyTotal - tax;
//   int get moneyMember => timesMember * 300_000;
//
//   String get moneyMemberFormatted => "$timesMember x 300.000đ = $moneyMember";
//
//   /// Money for each role
//   int get moneyPresident => timesPresident * 400_000;
//
//   /// Formatted strings for display
//   String get moneyPresidentFormatted =>
//       "$timesPresident x 400.000đ = $moneyPresident";
//   int get moneyReviewer => timesReviewer * 1_050_000;
//   String get moneyReviewerFormatted =>
//       "$timesReviewer x 400.000đ = $moneyReviewer";
//   int get moneySecretary => timesSecretary * 400_000;
//   String get moneySecretaryFormatted =>
//       "$timesSecretary x 400.000đ = $moneyPresident";
//
//   int get moneyTotal =>
//       moneyPresident + moneySecretary + moneyReviewer + moneyMember;
//
//   String get moneyTotalFormatted => "$moneyTotal đ";
//
//   /// Summary line for display
//   List<String> get summaryLine {
//     final tax = teacher.isOutsider ? 0 : (0.1 * moneyTotal).round();
//     final remain = moneyTotal - tax;
//     return [
//       teacher.name,
//       moneyTotal.toString(),
//       tax.toString(),
//       remain.toString(),
//       teacher.bankAccount?.toString() ?? "",
//       teacher.bankName?.toString() ?? "",
//       teacher.citizenId?.toString() ?? "",
//     ];
//   }
//
//   int get tax => switch (teacher.isOutsider) {
//     true => (0.1 * moneyTotal).round(),
//     false => 0,
//   };
// }

// This is used to render payment documents
// class ThesisPaymentPdfModel {
//   final List<ThesisData> theses;
//   final List<TeacherData> teachers;
//   final String paymentReason;
//   final Map<TeacherData, PayoutPerTeacher> payoutPerTeacher;
//   final Map<ThesisData, int> insiderListings;
//   final Map<ThesisData, int> outsiderListings;
//   final int totalBeforeTax;
//   final int totalAfterTax;
//   final int totalInsiderPayout;
//   final int totalOutsiderPayout;
//
//   /// Don't use this constructor directly, use [fromTheses] instead.
//   const ThesisPaymentPdfModel({
//     required this.teachers,
//     required this.theses,
//     required this.paymentReason,
//     required this.payoutPerTeacher,
//     required this.insiderListings,
//     required this.outsiderListings,
//     required this.totalBeforeTax,
//     required this.totalAfterTax,
//     required this.totalInsiderPayout,
//     required this.totalOutsiderPayout,
//   });
//
//   List<TeacherData> get insiderTeachers => [
//     for (final teacher in teachers)
//       if (!teacher.isOutsider) teacher,
//   ];
//
//   List<TeacherData> get outsiderTeachers => [
//     for (final teacher in teachers)
//       if (teacher.isOutsider) teacher,
//   ];
//
//   /// Create a [ThesisPaymentPdfModel] from a list of theses.
//   static Future<ThesisPaymentPdfModel> createFrom({
//     required String paymentReason,
//     List<Thesis>? theses,
//     List<ThesisData>? thesisProxies,
//   }) async {
//     // Convert everything to proxies
//     thesisProxies ??= [for (final thesis in theses ?? []) await thesis.proxy];
//     thesisProxies.sort((a, b) {
//       final aName = a.thesis.soQdBaoVe ?? "";
//       final bName = b.thesis.soQdBaoVe ?? "";
//       return aName.compareTo(bName);
//     });
//     theses ??= [for (final proxy in thesisProxies) proxy.thesis];
//
//     // Resolve payout per teachers and list of teachers
//     final teachers = <TeacherData>{};
//     final timesPresident = <TeacherData, int>{};
//     final timesSecretary = <TeacherData, int>{};
//     final timesReviewer = <TeacherData, int>{};
//     final timesMember = <TeacherData, int>{};
//
//     for (final thesis in thesisProxies) {
//       final president = thesis.president!;
//       timesPresident[president] = (timesPresident[president] ?? 0) + 1;
//       teachers.add(president);
//
//       final secretary = thesis.secretary!;
//       timesSecretary[secretary] = (timesSecretary[secretary] ?? 0) + 1;
//       teachers.add(secretary);
//
//       final reviewer1 = thesis.reviewer1!;
//       timesReviewer[reviewer1] = (timesReviewer[reviewer1] ?? 0) + 1;
//       teachers.add(reviewer1);
//
//       final reviewer2 = thesis.reviewer2!;
//       timesReviewer[reviewer2] = (timesReviewer[reviewer2] ?? 0) + 1;
//       teachers.add(reviewer2);
//
//       final member = thesis.member!;
//       timesMember[member] = (timesMember[member] ?? 0) + 1;
//       teachers.add(member);
//     }
//
//     final payoutPerTeacher = <TeacherData, PayoutPerTeacher>{};
//
//     // Sort teachers by foreign status and then by name
//     final teachersList = teachers.toList()
//       ..sort((a, b) {
//         final isForeignA = a.isOutsider;
//         final isForeignB = b.isOutsider;
//         if (isForeignA != isForeignB) {
//           return isForeignA ? 1 : -1; // Foreign teachers come last
//         }
//
//         // If both are foreign or both are local, sort by name
//         final aFirstName = a.name.split(" ").last;
//         final bFirstName = b.name.split(" ").last;
//         return aFirstName.compareTo(bFirstName);
//       });
//
//     for (final teacher in teachersList) {
//       payoutPerTeacher[teacher] = PayoutPerTeacher(
//         teacher: teacher,
//         timesPresident: timesPresident[teacher] ?? 0,
//         timesSecretary: timesSecretary[teacher] ?? 0,
//         timesReviewer: timesReviewer[teacher] ?? 0,
//         timesMember: timesMember[teacher] ?? 0,
//       );
//     }
//
//     // Resolve insider/outsider listings
//     final insiderListings = <ThesisData, int>{};
//     final outsiderListings = <ThesisData, int>{};
//
//     void addMoney(ThesisData thesis, GiangVien teacher, int amount) {
//       final tgt = (teacher.isOutsider) ? outsiderListings : insiderListings;
//       tgt[thesis] = (tgt[thesis] ?? 0) + amount;
//     }
//
//     for (final thesis in thesisProxies) {
//       addMoney(thesis, thesis.president!, 400_000);
//       addMoney(thesis, thesis.secretary!, 400_000);
//       addMoney(thesis, thesis.reviewer1!, 1_050_000);
//       addMoney(thesis, thesis.reviewer2!, 1_050_000);
//       addMoney(thesis, thesis.member!, 300_000);
//     }
//
//     final insiderTotal = insiderListings.values.fold(0, (a, b) => a + b);
//     final outsiderTotal = outsiderListings.values.fold(0, (a, b) => a + b);
//     final totalBeforeTax = insiderTotal + outsiderTotal;
//     final totalAfterTax = (insiderTotal + outsiderTotal * 0.9).round();
//
//     return ThesisData(
//       teachers: teachersList,
//       theses: thesisProxies,
//       paymentReason: paymentReason,
//       payoutPerTeacher: payoutPerTeacher,
//       insiderListings: insiderListings,
//       outsiderListings: outsiderListings,
//       totalBeforeTax: totalBeforeTax,
//       totalAfterTax: totalAfterTax,
//       totalInsiderPayout: insiderTotal,
//       totalOutsiderPayout: outsiderTotal,
//     );
//   }
// }

// class _IncomeListingTable extends StatelessWidget {
//   final ThesisData model;
//
//   _IncomeListingTable({required this.model});
//   @override
//   Widget build(Context context) {
//     final headings = [
//       "TT",
//       "Họ tên cán bộ",
//       "Chức danh",
//       "Số\ntài khoản",
//       "Mã\ncán\nbộ",
//       "Đơn vị\ncông tác",
//       "Chủ\ntịch\nHĐ",
//       "Thư\nký\nHĐ",
//       "Phản\nbiện",
//       "Ủy\nviên",
//       "Số tiền\n(đ)",
//     ];
//
//     final countHeadings = [
//       for (int i = 0; i < headings.length; i++) (1 + i).toString(),
//     ];
//
//     return TableHelper.fromTextArray(
//       headerAlignments: {10: Alignment.center},
//       cellAlignment: Alignment.center,
//       headerStyle: TextStyle(fontWeight: FontWeight.bold),
//       cellPadding: EdgeInsets.all(2),
//       headerCount: 2,
//       cellAlignments: {
//         1: Alignment.centerLeft,
//         10: Alignment.centerRight,
//       },
//       data: [
//         headings,
//         countHeadings,
//         ...[
//           for (final (i, teacher) in model.insiderTeachers.indexed)
//             [
//               (i + 1).toString(),
//               teacher.name,
//               teacher.chucDanh,
//               teacher.stk ?? "",
//               teacher.maCanBo ?? "",
//               "Khoa Toán - Tin",
//               model.payoutPerTeacher[teacher]?.timesPresident.toString() ?? "0",
//               model.payoutPerTeacher[teacher]?.timesSecretary.toString() ?? "0",
//               model.payoutPerTeacher[teacher]?.timesReviewer.toString() ?? "0",
//               model.payoutPerTeacher[teacher]?.timesMember.toString() ?? "0",
//               model.payoutPerTeacher[teacher]?.moneyTotal.formatMoney() ?? "0",
//             ],
//         ],
//       ],
//     );
//   }
// }

class _PaymentListingTable extends StatelessWidget {
  static const headings = [
    "TT",
    "Số\nhóa đơn",
    "Số\nchứng từ",
    "Ngày chứng từ",
    "Mục,\ntiểu mục",
    "Nội dung chi",
    "Số tiền\n(đ)",
  ];
  static const magicInsiderCode = "6449";

  static const magicOutsiderCode = "6756";

  final ThesisData model;
  _PaymentListingTable({required this.model});

  @override
  Widget build(Context context) {
    return Text("TODO");
    // // Resolve insider/outsider listings
    // final insiderListings = model.insiderListings;
    // final outsiderListings = model.outsiderListings;
    // final insiderTotal = model.totalInsiderPayout;
    // final outsiderTotal = model.totalOutsiderPayout;
    // final theses = model.theses;
    //
    // final insiderRows = <List<String>>[];
    // final outsiderRows = <List<String>>[];
    // for (final (i, thesis) in theses.indexed) {
    //   final insiderAmount = insiderListings[thesis] ?? 0;
    //   final outsiderAmount = outsiderListings[thesis] ?? 0;
    //
    //   final student = thesis.student!;
    //   final studentName = student.name;
    //   final studentClassOfYear = student.nienKhoa.toString();
    //   final dateFmt = DateFormat("dd/MM/yyyy");
    //   final defenseDate = switch (thesis.thesis.ngayBaoVe) {
    //     null => "!ĐIỀN NGÀY BẢO VỆ TRÊN CSDL!",
    //     DateTime defenseDate => dateFmt.format(defenseDate),
    //   };
    //   final content =
    //       "Thanh toán hội đồng chấm luận văn thạc sĩ $studentName khóa $studentClassOfYear theo chứng từ thanh toán ngày $defenseDate";
    //
    //   // Create a row for each thesis
    //   final insiderRow = <String>[
    //     (i + 1).toString(),
    //     "",
    //     "",
    //     "",
    //     magicInsiderCode,
    //     content,
    //     insiderAmount.formatMoney(),
    //   ];
    //   insiderRows.add(insiderRow);
    //
    //   // Create a row for each thesis
    //   final outsiderRow = <String>[
    //     (i + 1).toString(),
    //     "",
    //     "",
    //     "",
    //     magicOutsiderCode,
    //     content,
    //     outsiderAmount.formatMoney(),
    //   ];
    //   outsiderRows.add(outsiderRow);
    // }
    //
    // // Summary rows
    // final insiderSummaryRow = [
    //   "",
    //   "",
    //   "",
    //   "",
    //   "",
    //   "CỘNG $magicInsiderCode",
    //   insiderTotal.formatMoney(),
    // ];
    // final outsiderSummaryRow = [
    //   "",
    //   "",
    //   "",
    //   "",
    //   "",
    //   "CỘNG $magicOutsiderCode",
    //   outsiderTotal.formatMoney(),
    // ];
    //
    // // Final summary row
    // final totalRow = [
    //   "",
    //   "",
    //   "",
    //   "",
    //   "",
    //   "TỔNG CỘNG ($magicInsiderCode + $magicOutsiderCode)",
    //   (insiderTotal + outsiderTotal).formatMoney(),
    // ];
    //
    // // Bold cell indices
    // final boldCellIndices = {
    //   (theses.length + 1, 5),
    //   (theses.length + 1, 6),
    //   (theses.length * 2 + 2, 5),
    //   (theses.length * 2 + 2, 6),
    //   (theses.length * 2 + 3, 5),
    //   (theses.length * 2 + 3, 6),
    // };
    //
    // return TableHelper.fromTextArray(
    //   headerAlignments: {for (int i = 0; i < 8; i++) i: Alignment.center},
    //   cellAlignment: Alignment.center,
    //   cellAlignments: {
    //     6: Alignment.centerRight,
    //     5: Alignment.centerLeft, // Content column
    //   },
    //   textStyleBuilder: (col, data, row) {
    //     if (boldCellIndices.contains((row, col))) {
    //       return TextStyle(fontWeight: FontWeight.bold);
    //     }
    //     return null; // Default style
    //   },
    //   headerStyle: TextStyle(fontWeight: FontWeight.bold),
    //   columnWidths: {
    //     1: FixedColumnWidth(60), // Fixed width for invoice number
    //     2: FixedColumnWidth(60), // Fixed width for invoice number
    //     3: FixedColumnWidth(90), // Fixed width for invoice number
    //     5: FlexColumnWidth(), // Wider column for content
    //   },
    //   data: [
    //     headings,
    //     ...insiderRows,
    //     insiderSummaryRow,
    //     ...outsiderRows,
    //     outsiderSummaryRow,
    //     totalRow,
    //   ],
    // );
  }
}

class _PaymentRequestPage extends StatelessWidget {
  final String requesterName;
  final String requesterDivision;
  final String payReason;
  final int payAmount;

  _PaymentRequestPage({
    this.requesterName = "Nguyễn Đức Hùng",
    this.requesterDivision = "Khoa Toán - Tin",
    required this.payAmount,
    required this.payReason,
  });

  @override
  Widget build(Context context) {
    final payMoneyNumber = payAmount.formatMoney();
    final payMoneyText = payAmount.toVietnameseWords();
    final year = DateTime.now().year;

    Widget infoField(List<String> children) {
      final widgets = [
        for (final (i, child) in children.indexed)
          if (i % 2 == 0)
            TextSpan(text: child)
          else
            TextSpan(
              text: child,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
      ];

      return RichText(
        text: TextSpan(
          children: widgets,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Footer(
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3 * pt),
              Text(
                "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
              ),
            ],
          ),
        ), // Footer with leading content

        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "GIẤY ĐỀ NGHỊ THANH TOÁN",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3 * pt),
            Text("Ngày ......... tháng ......... năm $year"),
          ],
        ),

        SizedBox(height: 12 * pt), // Space between title and content
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Kính gửi: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: "BAN TÀI CHÍNH KẾ HOẠCH - ĐẠI HỌC BÁCH KHOA HÀ NỘI",
              ),
            ],
          ),
        ),

        SizedBox(height: 12 * pt), // Space between title and content
        infoField([
          "Họ và tên người đề nghị thanh toán: ",
          requesterName,
        ]),
        SizedBox(height: 6 * pt),
        infoField([
          "Bộ phận (hoặc địa chỉ): ",
          requesterDivision,
        ]),
        SizedBox(height: 6 * pt),
        infoField([
          "Nội dung thanh toán: ",
          payReason,
        ]),
        SizedBox(height: 6 * pt),
        infoField([
          "Số tiền: ",
          "$payMoneyNumberđ",
          ". Viết bằng chữ: ",
          "$payMoneyText đồng",
          ".",
        ]),
        SizedBox(height: 6 * pt),
        Text("(Kèm theo ........ chứng từ gốc)"),

        //         RichText(
        //           textAlign: TextAlign.justify,
        //           text: TextSpan(
        //             text:
        //                 """
        // """,
        //           ),
        //         ),
        SizedBox(height: 12 * pt), // Space between content and footer
        Footer(
          leading: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Người đề nghị thanh toán\n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "(Ký, họ tên)"),
              ],
            ),
          ),
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Kế toán trưởng\n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "(Ký, họ tên)"),
              ],
            ),
          ),
          trailing: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Thủ trưởng đơn vị\n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "(Ký, họ tên)"),
              ],
            ),
          ),
        ),

        Spacer(flex: 4),
      ],
    );
  }
}
