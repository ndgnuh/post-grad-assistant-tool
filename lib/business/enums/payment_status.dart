import 'package:drift/drift.dart';
import '../../utilities/strings.dart';

final paymentStatusConverter = const PaymentStatusConverter();

enum PaymentStatus {
  unpaid('Chưa thanh toán'),
  paid('Đã thanh toán');

  final String label;

  const PaymentStatus(this.label);

  String get value => name.camelToKebabCase();

  static PaymentStatus fromValue(String value) {
    return PaymentStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('Invalid thesis payment status value: $value'),
    );
  }
}

class PaymentStatusConverter extends TypeConverter<PaymentStatus, String> {
  const PaymentStatusConverter();

  @override
  PaymentStatus fromSql(String fromDb) => PaymentStatus.fromValue(fromDb);

  @override
  String toSql(PaymentStatus value) => value.value;
}
