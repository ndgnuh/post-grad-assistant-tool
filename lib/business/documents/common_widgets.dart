import 'pdf_utils.dart';

class TitleRule extends StatelessWidget {
  @override
  Widget build(Context context) {
    final style = context.defaultTextStyle;
    late final double width;
    switch (style.fontSize?.toInt()) {
      case int n when (n <= 10):
        width = 2.9 * cm;
      case 11:
        width = 3.2 * cm;
      case 12:
        width = 3.5 * cm;
      default:
        width = 3.5 * cm;
    }
    return Container(
      width: width,
      height: 1 * pt,
      color: PdfColors.black,
    );
  }
}

class FormalTitle extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final TextStyle? firstStyle;
  final TextStyle? secondStyle;

  FormalTitle({
    required this.firstTitle,
    required this.secondTitle,
    this.firstStyle,
    this.secondStyle,
  });
  @override
  Widget build(Context context) {
    final style1 = context.defaultTextStyle.bold.heading2;
    final style2 = context.defaultTextStyle.heading1;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: firstTitle, style: firstStyle ?? style1),
          TextSpan(text: '\n'),
          TextSpan(text: secondTitle, style: secondStyle ?? style2),
          TextSpan(text: '\n'),
          WidgetSpan(child: TitleRule()),
        ],
      ),
    );
  }
}

class VietnamTitle extends StatelessWidget {
  @override
  Widget build(Context context) {
    return FormalTitle(
      firstTitle: 'CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM',
      secondTitle: 'Độc lập - Tự do - Hạnh phúc',
    );
  }
}

class HustTitle extends StatelessWidget {
  @override
  Widget build(Context context) {
    return FormalTitle(
      firstTitle: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
      secondTitle: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
    );
  }
}

class FamiTitle extends StatelessWidget {
  @override
  Widget build(Context context) {
    return FormalTitle(
      firstTitle: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
      secondTitle: "KHOA TOÁN - TIN",
    );
  }
}
