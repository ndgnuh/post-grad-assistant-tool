import 'package:fami_tools/utilities/strings.dart';

class PaymentRequestModel {
  final String requesterName;
  final String requesterOrganization;
  final String paymentReason;
  final int paymentAmount;

  const PaymentRequestModel({
    required this.requesterName,
    required this.requesterOrganization,
    required this.paymentReason,
    required this.paymentAmount,
  });

  String get paymentAmountFormatted => paymentAmount.formatMoney();

  String get paymentAmountInWords => paymentAmount.toVietnameseWords();

  String get name => "Đề nghị thanh toán $paymentReason";
}
