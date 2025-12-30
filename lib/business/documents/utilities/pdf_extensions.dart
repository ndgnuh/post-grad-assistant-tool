import 'package:pdf/pdf.dart';
import 'dart:math';
import 'package:pdf/widgets.dart';

const multiplier = 1.05;

extension TextStyleHelper on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get strikeThrough =>
      copyWith(decoration: TextDecoration.lineThrough);

  TextStyle size(double newSize) => copyWith(fontSize: newSize);

  TextStyle color(PdfColor newColor) => copyWith(color: newColor);

  TextStyle letterSpacing(double spacing) => copyWith(letterSpacing: spacing);

  TextStyle wordSpacing(double spacing) => copyWith(wordSpacing: spacing);

  TextStyle backgroundColor(PdfColor bgColor) =>
      copyWith(background: BoxDecoration(color: bgColor));

  double get fontSizeValue => fontSize ?? 12.0;
  double get smallSkip => fontSizeValue * 0.25;
  double get medSkip => fontSizeValue * 0.5;
  double get bigSkip => fontSizeValue * 0.75;

  TextStyle get heading0 =>
      copyWith(fontSize: fontSizeValue * pow(multiplier, 4));
  TextStyle get heading1 =>
      copyWith(fontSize: fontSizeValue * pow(multiplier, 3));
  TextStyle get heading2 =>
      copyWith(fontSize: fontSizeValue * pow(multiplier, 2));
  TextStyle get heading3 =>
      copyWith(fontSize: fontSizeValue * pow(multiplier, 1));
}
