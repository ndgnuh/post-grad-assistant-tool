import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import '../../../gen/assets.gen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdfrx_engine/pdfrx_engine.dart' as pdfrx;

import 'pdf_widgets.dart';

const defaultBaseFontSize = 12.0 * pt;
const defaultMargin = EdgeInsets.all(1.0 * inch);
const defaultPageFormat = PdfPageFormat.a4;

Future<Uint8List> combinePdfPages({required List<Uint8List> pdfBytes}) async {
  final allPages = <pdfrx.PdfPage>[];
  for (final pageBytes in pdfBytes) {
    final document = await pdfrx.PdfDocument.openData(pageBytes);
    allPages.addAll(document.pages);
  }

  final now = DateTime.now().toIso8601String();
  final outputDocument = await pdfrx.PdfDocument.createNew(sourceName: now);
  outputDocument.pages = allPages;
  final pdfData = await outputDocument.encodePdf();
  return pdfData;
}

/// A function for quickly load up default settings
/// and create a multi-page document, the build function
/// must returns a list of widgets
Future<Uint8List> buildMultiPageDocument({
  required List<Widget> Function(Context) build,
  PdfPageFormat pageFormat = defaultPageFormat,
  EdgeInsetsGeometry margin = defaultMargin,
  double baseFontSize = defaultBaseFontSize,
  Widget Function(Context)? header,
  Widget Function(Context)? footer,
}) async {
  final theme = ThemeData(
    defaultTextStyle: await getPdfDefaultTextStyle(
      fontSize: baseFontSize,
    ),
  );

  /// Build the PDF document in a separate isolate
  final bytes = await Isolate.run(
    () {
      final document = Document(theme: theme);
      final page = MultiPage(
        theme: theme,
        pageFormat: pageFormat,
        margin: margin,
        build: build,
        header: header,
        footer: footer,
      );
      document.addPage(page);
      return document.save();
    },
  );

  return bytes;
}

/// A function for quickly load up default settings
/// and create a single-page document, the build function
/// must returns a widget
Future<Uint8List> buildSinglePageDocument({
  required Widget Function(Context) build,
  PdfPageFormat pageFormat = defaultPageFormat,
  EdgeInsetsGeometry? margin = defaultMargin,
  double baseFontSize = defaultBaseFontSize,
}) async {
  final defaultTextStyle = await getPdfDefaultTextStyle(
    fontSize: baseFontSize,
  );

  return Isolate.run(() {
    final bold = defaultTextStyle.copyWith(
      fontWeight: FontWeight.bold,
    );
    final theme = ThemeData(
      defaultTextStyle: defaultTextStyle,
      header0: bold.copyWith(fontSize: baseFontSize * 1.4),
      header1: bold.copyWith(fontSize: baseFontSize * 1.3),
      header2: bold.copyWith(fontSize: baseFontSize * 1.2),
      header3: bold.copyWith(fontSize: baseFontSize * 1.1),
      header4: bold.copyWith(fontSize: baseFontSize * 1.05),
    );
    final document = Document(theme: theme);

    document.addPage(
      Page(
        pageFormat: pageFormat,
        margin: margin,
        build: build,
      ),
    );

    return document.save();
  });
}

/// Load default font settings
/// Use by [buildMultiPageDocument] and [buildSinglePageDocument]
Future<TextStyle> getPdfDefaultTextStyle({
  double fontSize = defaultBaseFontSize,
}) async {
  final serifFonts = (
    base: loadFont(Assets.fonts.texGyreTermesRegular),
    bold: loadFont(Assets.fonts.texGyreTermesBold),
    italic: loadFont(Assets.fonts.texGyreTermesItalic),
    boldItalic: loadFont(Assets.fonts.texGyreTermesBoldItalic),
  );
  // final serifFonts = (
  //   base: loadFont(Assets.fonts.timesNewRoman),
  //   bold: loadFont(Assets.fonts.timesNewRomanBold),
  //   italic: loadFont(Assets.fonts.timesNewRomanItalic),
  //   boldItalic: loadFont(Assets.fonts.timesNewRomanBoldItalic),
  // );

  final defaultTextStyle = TextStyle(
    font: await serifFonts.base,
    fontItalic: await serifFonts.italic,
    fontBoldItalic: await serifFonts.boldItalic,
    fontBold: await serifFonts.bold,
    fontSize: fontSize,
  );

  return defaultTextStyle;
}

/// Load a TTF font from asset path
Future<Font> loadFont(String assetPath) async {
  final fontData = await rootBundle.load(assetPath);
  return Font.ttf(fontData);
}
