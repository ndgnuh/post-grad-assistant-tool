// Double check the payment details before processing the transaction.

import 'package:fami_tools/business/documents/common_widgets.dart';
import 'package:fami_tools/business/documents/pdf_utils.dart';
import 'package:fami_tools/business/documents/utilities/xlsx_builder.dart';

import '../../utilities/strings.dart';
import '../documents.dart';
import '../main_database.dart';

XlsxFile _xlsx(PaymentDoubleCheckModel model) {
  final name = model.name;
  // Build XLSX file here
  final bytes = buildSingleSheetExcel(
    builder: (sheet) => _xlsxBuilder(sheet, model),
  );
  return XlsxFile(name: name, bytes: bytes);
}

void _xlsxBuilder(Sheet sheet, PaymentDoubleCheckModel model) {
  int row = 0;
  final entries = model.entries;
  for (final entry in entries) {}
}

class PaymentDoubleCheckEntry<R extends PaymentRole> {
  final TeacherData teacher;
  final Set<R> roles;
  PaymentDoubleCheckEntry({
    required this.teacher,
    required this.roles,
  });
}

class PaymentDoubleCheckModel<R extends PaymentRole> {
  /// QoL constructor for entry
  // ignore: constant_identifier_names
  static const Entry = PaymentDoubleCheckEntry.new;
  final List<PaymentDoubleCheckEntry> entries;
  final Map<R, int> paymentPerRole;

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
    required PhdAdmissionPaymentPolicyData policy,
  }) {
    final entries = <PaymentDoubleCheckEntry>[];
    final paymentPerRole = {
      PhdAdmissionRole.president: policy.presidentPayment,
      PhdAdmissionRole.secretary: policy.secretaryPayment,
      PhdAdmissionRole.member: policy.memberPayment,
      PhdAdmissionRole.helper: policy.secretaryPayment,
    };
    final roles = PhdAdmissionRole.values;

    /// Populate entries
    for (final (i, president) in presidents.indexed) {
      final secretary = secretaries[i];
      final firstMember = firstMembers[i];
      final secondMember = secondMembers[i];
      final thirdMember = thirdMembers[i];
      final helper = helpers[i];

      entries.add(
        PaymentDoubleCheckEntry(
          teacher: president,
          roles: {PhdAdmissionRole.president},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          teacher: secretary,
          roles: {PhdAdmissionRole.secretary},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          teacher: firstMember,
          roles: {PhdAdmissionRole.member},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          teacher: secondMember,
          roles: {PhdAdmissionRole.member},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          teacher: thirdMember,
          roles: {PhdAdmissionRole.member},
        ),
      );
      entries.add(
        PaymentDoubleCheckEntry(
          teacher: helper,
          roles: {PhdAdmissionRole.helper},
        ),
      );
    }

    /// Remove roles with 0 payment
    paymentPerRole.removeWhere((key, value) => value == 0);
    roles.removeWhere((role) => !paymentPerRole.containsKey(role));

    return PaymentDoubleCheckModel(
      entries: entries,
      roles: roles,
      paymentPerRole: paymentPerRole,
    );
  }

  PaymentDoubleCheckModel({
    required this.entries,
    required this.roles,
    required this.paymentPerRole,
  });

  List<List<String>> getTableData({bool formatMoney = false}) {
    final rows = <List<String>>[
      [
        "TT",
        "Họ và tên",
        for (final role in roles) role.displayName,
        "Số tiền (VNĐ)",
      ],
    ];

    for (final (i, entry) in entries.indexed) {
      final row = <Object>[
        (i + 1),
        entry.teacher.name,
      ];

      int total = 0;
      for (final role in roles) {
        final payment = switch (entry.roles.contains(role)) {
          false => 0,
          true => paymentPerRole[role]!,
        };
        total += payment;

        final paymentFmt = formatMoney
            ? payment.formatMoney()
            : payment.toString();

        row.add(paymentFmt);
      }

      row.add(
        formatMoney ? total.formatMoney() : total.toString(),
      );
    }
    return rows;
  }

  // Document name
  String get name => "KiemTra_ThanhToan";

  /// Build [XlsxFile] for payment ATM
  XlsxFile get xlsx => _xlsx(this);

  /// Build [PdfFile] for payment ATM
  Future<PdfFile> get pdf => _pdf(this);
}

mixin PaymentRole {
  String get displayName;
}

enum PhdAdmissionRole with PaymentRole {
  president("Chủ tịch"),
  secretary("Thư ký"),
  member("Ủy viên"),
  helper("Trợ giúp");

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

List<Widget> _pdfBuilder(Context context, PaymentDoubleCheckModel model) {
  final formalTitle = FormalTitle(
    firstTitle: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
    secondTitle: "KHOA TOÁN - TIN",
  );

  final title = Center(
    child: Text(
      "BẢNG TỔNG HỢP DANH SÁCH CÁC THẦY CÔ CHẤM LUẬN VĂN THẠC SĨ",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  final tableData = model.getTableData(formatMoney: true);
  final tableHeaders = tableData.first;
  final tableBody = tableData.sublist(1);
  final table = EzTable(
    data: tableBody,
    rowBuilder: (_, obj) => obj,
    headers: tableHeaders,
  );

  return [
    formalTitle,
    SizedBox(height: 9 * pt),
    title,
    SizedBox(height: 6 * pt),
    table,
  ];
}

Future<PdfFile> _pdf(
  PaymentDoubleCheckModel model,
) async {
  final bytes = await buildMultiPageDocument(
    build: (context) {
      return _pdfBuilder(context, model);
    },
  );
  final name = model.name;
  return PdfFile(name: name, bytes: bytes);
}
