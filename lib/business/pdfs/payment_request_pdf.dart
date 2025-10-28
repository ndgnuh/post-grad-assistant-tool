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
    final year = DateTime.now().year;

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
        InfoField(
          texts: [
            "Họ và tên người đề nghị thanh toán: ",
            requesterName,
          ],
        ),
        SizedBox(height: 6 * pt),
        InfoField(
          texts: [
            "Bộ phận (hoặc địa chỉ): ",
            requesterOrganization,
          ],
        ),
        SizedBox(height: 6 * pt),
        InfoField(
          texts: [
            "Nội dung thanh toán: ",
            paymentReason,
          ],
        ),
        SizedBox(height: 6 * pt),
        InfoField(
          texts: [
            "Số tiền: ",
            "$payMoneyNumberđ",
            ". Viết bằng chữ: ",
            "$payMoneyText đồng",
            ".",
          ],
        ),
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
