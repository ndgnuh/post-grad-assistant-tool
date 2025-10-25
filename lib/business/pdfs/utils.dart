import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class ItalicText extends StatelessWidget {
  final double? fontSize;
  final String text;
  ItalicText(this.text, {this.fontSize});
  @override
  Widget build(context) {
    final theme = Theme.of(context);
    final style = theme.defaultTextStyle.copyWith(
      fontStyle: FontStyle.italic,
      fontSize: fontSize,
    );
    return Text(text, style: style);
  }
}

class BoldText extends StatelessWidget {
  final double? fontSize;
  final String text;
  BoldText(this.text, {this.fontSize});
  @override
  Widget build(context) {
    final theme = Theme.of(context);
    final style = theme.defaultTextStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
    return Text(text, style: style);
  }
}
