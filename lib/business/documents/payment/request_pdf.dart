import '../pdf_utils.dart';
import '../../../gen/assets.gen.dart';
import '../../../utilities/strings.dart';
import 'package:flutter/services.dart';

import '../common_widgets.dart';
import '../../documents.dart';
import '../utilities/docx_template.dart';

class PaymentRequestModel {
  final String requesterName;
  final String requesterFalcuty;
  final String paymentReason;
  final int paymentAmount;

  const PaymentRequestModel({
    required this.requesterName,
    required this.requesterFalcuty,
    required this.paymentReason,
    required this.paymentAmount,
  });

  Future<PdfFile> get pdf => paymentRequestPdf(model: this);
  Future<DocxFile> get docx => buildPaymentRequestDocx(model: this);

  String get paymentAmountFormatted => paymentAmount.formatMoney();

  String get paymentAmountInWords => paymentAmount.toVietnameseWords();

  String get name => "Đề nghị thanh toán $paymentReason";

  Map<String, String> get docxContext => {
    'requester_name': requesterName,
    'requester_falcuty': requesterFalcuty,
    'payment_reason': paymentReason,
    'payment_amount': paymentAmountFormatted,
    'payment_amount_text': paymentAmountInWords,
    'current_year': DateTime.now().year.toString(),
  };
}

Future<PdfFile> paymentRequestPdf({
  required PaymentRequestModel model,
}) async {
  final bytes = await buildSinglePageDocument(
    baseFontSize: 12,
    pageFormat: PdfPageFormat.a5.landscape,
    margin: EdgeInsets.symmetric(
      vertical: 0.5 * inch,
      horizontal: 1 * inch,
    ),
    build: (context) => PaymentRequestPdf(
      requesterName: model.requesterName,
      requesterFalcuty: model.requesterFalcuty,
      paymentReason: model.paymentReason,
      paymentAmount: model.paymentAmount,
    ),
  );

  final name = model.name;
  return PdfFile(name: name, bytes: bytes);
}

Future<DocxFile> buildPaymentRequestDocx({
  required PaymentRequestModel model,
}) async {
  final templatePath = Assets.templates.paymentRequest;
  final templateBytes = await rootBundle.load(templatePath);
  final docxBytes = fillDocxTemplate(
    templateBytes.buffer.asUint8List(),
    model.docxContext,
  );

  return DocxFile(
    name: model.name,
    bytes: await docxBytes,
  );
}

class PaymentRequestPdf extends StatelessWidget {
  final String requesterName;
  final String requesterFalcuty;
  final String paymentReason;
  final int paymentAmount;

  PaymentRequestPdf({
    required this.requesterName,
    required this.requesterFalcuty,
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
        Footer(leading: HustTitle()),

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
            requesterFalcuty,
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
