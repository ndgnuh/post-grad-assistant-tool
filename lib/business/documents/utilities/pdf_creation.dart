import 'dart:io';
import 'dart:typed_data';

import 'package:fami_tools/gen/assets.gen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf_combiner/pdf_combiner.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_combiner/responses/pdf_combiner_status.dart';

import 'pdf_widgets.dart';

const defaultBaseFontSize = 12.0 * pt;
const defaultMargin = EdgeInsets.all(1.0 * inch);
const defaultPageFormat = PdfPageFormat.a4;

/// Combine in-memory PDF pages into a single PDF document
Future<Uint8List> combinePdfPages({required List<Uint8List> pdfPages}) async {
  final tmpDir = await getTemporaryDirectory();
  final names = [
    for (var i = 0; i < pdfPages.length; i++) 'part_${i + 1}.pdf',
  ];

  for (var i = 0; i < pdfPages.length; i++) {
    final file = File(p.join(tmpDir.path, names[i]));
    await file.writeAsBytes(pdfPages[i]);
  }

  final inputPaths = [for (final name in names) p.join(tmpDir.path, name)];
  final outputPath = p.join(tmpDir.path, 'combined.pdf');
  final response = await PdfCombiner.generatePDFFromDocuments(
    inputPaths: inputPaths,
    outputPath: outputPath,
  );
  switch (response.status) {
    case PdfCombinerStatus.success:
      // Clean up individual files
      for (final path in inputPaths) {
        final file = File(path);
        if (await file.exists()) {
          await file.delete();
        }
      }
      final outputFile = File(outputPath);
      final bytes = await outputFile.readAsBytes();
      return bytes;

    case PdfCombinerStatus.error:
      throw Exception("Failed to merge PDFs: ${response.message}");
  }
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
  final document = Document(theme: theme);

  document.addPage(
    MultiPage(
      theme: theme,
      pageFormat: pageFormat,
      margin: margin,
      build: build,
      header: header,
      footer: footer,
    ),
  );

  return await document.save();
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

  return await document.save();
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
