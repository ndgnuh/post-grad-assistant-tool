import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart' show rootBundle;

import './pdf_widgets.dart';
export './pdf_widgets.dart';

Future<Font> loadFont(String assetPath) async {
  final fontData = await rootBundle.load(assetPath);
  return Font.ttf(fontData);
}

/// This function is for injecting at the main
Future<TextStyle> getPdfDefaultTextStyle({
  double fontSize = 12.0,
}) async {
  final serifFonts = (
    base: loadFont("assets/fonts/Times_New_Roman.ttf"),
    bold: loadFont("assets/fonts/Times_New_Roman_Bold.ttf"),
    italic: loadFont("assets/fonts/Times_New_Roman_Italic.ttf"),
    boldItalic: loadFont("assets/fonts/Times_New_Roman_Bold_Italic.ttf"),
  );

  final defaultTextStyle = TextStyle(
    font: await serifFonts.base,
    fontItalic: await serifFonts.italic,
    fontBoldItalic: await serifFonts.boldItalic,
    fontBold: await serifFonts.bold,
    fontSize: fontSize,
  );

  return defaultTextStyle;
}

Future<Uint8List> buildSinglePageDocument({
  required Widget Function(Context) build,
  IsoPageFormat pageFormat = IsoPageFormat.verticalA4,
  EdgeInsetsGeometry? margin = const EdgeInsets.all(1.0 * PdfPageFormat.cm),
  double baseFontSize = 11.0,
}) async {
  final theme = ThemeData(
    defaultTextStyle: await getPdfDefaultTextStyle(
      fontSize: baseFontSize,
    ),
  );
  final document = Document(theme: theme);

  document.addPage(
    Page(
      pageFormat: pageFormat.pdfPageFormat,
      margin: margin,
      build: build,
    ),
  );

  return await document.save();
}

Future<Uint8List> buildMultiPageDocument({
  required List<Widget> Function(Context) build,
  IsoPageFormat pageFormat = IsoPageFormat.verticalA4,
  EdgeInsetsGeometry margin = const EdgeInsets.all(1.0 * PdfPageFormat.cm),
  double baseFontSize = 11.0,
}) async {
  final theme = ThemeData(
    defaultTextStyle: await getPdfDefaultTextStyle(
      fontSize: baseFontSize,
    ),
  );
  final document = Document(theme: theme);

  document.addPage(
    MultiPage(
      theme: theme,
      pageFormat: pageFormat.pdfPageFormat,
      margin: margin,
      build: build,
    ),
  );

  return await document.save();
}

class InfoField extends StatelessWidget {
  final List<String> texts;
  final TextStyle? highlightStyle;

  InfoField({
    required this.texts,
    this.highlightStyle,
  });

  @override
  Widget build(Context context) {
    final highlightStyle =
        this.highlightStyle ?? TextStyle(fontWeight: FontWeight.bold);
    final widgets = [
      for (final (i, child) in texts.indexed)
        if (i % 2 == 0)
          TextSpan(text: child)
        else
          TextSpan(text: child, style: highlightStyle),
    ];
    return RichText(
      text: TextSpan(children: widgets),
    );
  }
}
