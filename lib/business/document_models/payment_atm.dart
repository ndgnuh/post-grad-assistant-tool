import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:fami_tools/utilities/strings.dart';

const _taxPercent = 0.1;

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

class PaymentAtmModel {
  final String reason;
  final List<PaymentAtmEntry> entries;

  PaymentAtmModel({
    required this.reason,
    required this.entries,
  });

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

  List<List<Object>> get dataRows {
    final summaryTable = <List<Object>>[];
    for (final (i, entry) in entries.indexed) {
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
      final rows = <Object>[
        (i + 1).toString(),
        teacher.name,
        amount,
        tax == 0 ? "" : tax,
        afterTaxAmount,
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

    return summaryTable;
  }

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
}
