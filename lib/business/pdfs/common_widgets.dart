import 'package:fami_tools/utilities/pdf_building.dart';

class TitleRule extends StatelessWidget {
  @override
  Widget build(Context context) {
    final style = Theme.of(context).defaultTextStyle;
    late final double width;
    switch (style.fontSize?.toInt()) {
      case 10:
        width = 2.9 * cm;
      case 11:
        width = 3.2 * cm;
      case 12:
        width = 3.5 * cm;
      default:
        3.5 * cm;
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
    final defaultStyle = TextStyle(fontWeight: FontWeight.bold);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(firstTitle, style: firstStyle ?? defaultStyle),
        SizedBox(height: 1.5 * pt),
        Text(secondTitle, style: secondStyle ?? defaultStyle),
        SizedBox(height: 1.5 * pt),
        TitleRule(),
      ],
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
