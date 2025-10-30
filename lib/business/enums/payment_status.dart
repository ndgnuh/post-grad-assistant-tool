enum PaymentStatus {
  unpaid('unpaid', 'Chưa thanh toán'),
  paid('paid', 'Đã thanh toán');

  final String value;
  final String label;

  const PaymentStatus(this.value, this.label);

  String toValue() => value;
  static PaymentStatus fromValue(String value) {
    return PaymentStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('Invalid thesis payment status value: $value'),
    );
  }
}
