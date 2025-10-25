import 'dart:typed_data';

import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';

import '../../services/pdf_builder/index.dart';

Future<Uint8List> paymentRequestPdf({
  required String requesterName,
  required String requesterOrganization,
  required String paymentReason,
  required int paymentAmount,
}) async {
  return await buildSinglePageDocument(
    baseFontSize: 14,
    pageFormat: IsoPageFormat.horizontalA5,
    build: (context) => PaymentRequestPdf(
      requesterName: requesterName,
      requesterOrganization: requesterOrganization,
      paymentReason: paymentReason,
      paymentAmount: paymentAmount,
    ),
  );
}

class PaymentRequestPdf extends StatelessWidget {
  final String requesterName;
  final String requesterOrganization;
  final String paymentReason;
  final int paymentAmount;

  PaymentRequestPdf({
    required this.requesterName,
    required this.requesterOrganization,
    required this.paymentReason,
    required this.paymentAmount,
  });

  @override
  Widget build(Context context) {
    final payMoneyNumber = paymentAmount.formatMoney();
    final payMoneyText = paymentAmount.toVietnameseWords();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Footer(
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Đơn vị: Đại học Bách khoa Hà Nội",
              ),
              Text(
                "Mã QHNC: ......................................",
              ),
            ],
          ),
        ), // Footer with leading content

        SizedBox(height: 20), // Space between footer and content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "GIẤY ĐỀ NGHỊ THANH TOÁN",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("Ngày ..... tháng ..... năm .........."),
          ],
        ),

        SizedBox(height: 10), // Space between title and content
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Kính gửi: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "BAN TÀI CHÍNH KẾ HOẠCH - ĐẠI HỌC BÁCH KHOA HÀ NỘI",
              ),
            ],
          ),
        ),

        SizedBox(height: 5), // Space between title and content
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            text:
                """Họ và tên người đề nghị thanh toán: $requesterName
Bộ phận (hoặc địa chỉ): $requesterOrganization
Nội dung thanh toán: $paymentReason
Số tiền: $payMoneyNumberđ. Viết bằng chữ: $payMoneyText đồng.
(Kèm theo ........ chứng từ gốc)""",
          ),
        ),

        SizedBox(height: 10), // Space between content and footer
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
      ],
    );
  }
}
