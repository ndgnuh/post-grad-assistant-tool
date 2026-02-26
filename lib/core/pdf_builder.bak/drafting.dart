// Drafting ultilities, do not load in production
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import './pdf_widgets.dart';

export './pdf_widgets.dart';

Future<Font> loadFont(String assetPath) async {
  final file = File(assetPath);
  final fontData = await file.readAsBytes();
  return Font.ttf(fontData.buffer.asByteData());
}

Future<TextStyle> loadDefaultTextStyle({
  double fontSize = 11.0,
}) async {
  return TextStyle(
    font: await loadFont("./assets/fonts/Times_New_Roman.ttf"),
    fontBold: await loadFont("assets/fonts/Times_New_Roman_Bold.ttf"),
    fontItalic: await loadFont("assets/fonts/Times_New_Roman_Italic.ttf"),
    fontBoldItalic: await loadFont(
      "assets/fonts/Times_New_Roman_Bold_Italic.ttf",
    ),
    fontSize: fontSize * PdfPageFormat.point,
    lineSpacing: 1.3 * PdfPageFormat.point,
  );
}

Future<Uint8List> createSinglePageDocument({
  required Widget Function(Context) build,
  IsoPageFormat pageFormat = IsoPageFormat.verticalA4,
  EdgeInsetsGeometry margin = const EdgeInsets.all(1.0 * PdfPageFormat.cm),
  double baseFontSize = 11.0,
}) async {
  final theme = ThemeData(
    defaultTextStyle: await loadDefaultTextStyle(
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

Future<Uint8List> createMultiPageDocument({
  required List<Widget> Function(Context) build,
  IsoPageFormat pageFormat = IsoPageFormat.verticalA4,
  EdgeInsetsGeometry margin = const EdgeInsets.all(1.0 * PdfPageFormat.cm),
  double baseFontSize = 11.0,
}) async {
  final theme = ThemeData(
    defaultTextStyle: await loadDefaultTextStyle(
      fontSize: baseFontSize,
    ),
  );
  final document = Document(theme: theme);

  document.addPage(
    MultiPage(
      pageFormat: pageFormat.pdfPageFormat,
      margin: margin,
      build: build,
    ),
  );

  return await document.save();
}
