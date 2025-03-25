import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart' show Widget, Context, StatelessWidget;
import 'package:flutter/services.dart' show rootBundle;

// Export so that other packages only need to use one namespace
export 'package:pdf/widgets.dart';
export 'package:pdf/pdf.dart' show PdfPageFormat;

const double pt = PdfPageFormat.point;
const double inch = PdfPageFormat.inch;
const double mm = PdfPageFormat.mm;

Future<pw.Font> loadFont(String assetPath) async {
  final fontData = await rootBundle.load(assetPath);
  return pw.Font.ttf(fontData);
}

PdfPageFormat a4Landscape({
  double vMargin = 1 * PdfPageFormat.inch,
  double hMargin = 1 * PdfPageFormat.inch,
  double marginAll = 1 * PdfPageFormat.inch,
}) {
  return PdfPageFormat(
    297 * PdfPageFormat.mm,
    210 * PdfPageFormat.mm,
    marginAll: marginAll,
    marginTop: vMargin,
    marginBottom: vMargin,
    marginLeft: hMargin,
    marginRight: hMargin,
  );
}

final serifFonts = (
  base: loadFont("assets/fonts/Times_New_Roman.ttf"),
  bold: loadFont("assets/fonts/Times_New_Roman_Bold.ttf"),
  italic: loadFont("assets/fonts/Times_New_Roman_Italic.ttf"),
  boldItalic: loadFont("assets/fonts/Times_New_Roman_Bold_Italic.ttf"),
);

Future<pw.ThemeData> defaultTheme({double baseSize = 9.0}) async {
  final defaultTextStyle = pw.TextStyle(
    font: await serifFonts.base,
    fontItalic: await serifFonts.italic,
    fontBoldItalic: await serifFonts.boldItalic,
    fontBold: await serifFonts.bold,
    fontSize: baseSize,
  );
  final boldTextStyle = defaultTextStyle.copyWith(
    fontWeight: pw.FontWeight.bold,
  );

  final theme = pw.ThemeData(
    defaultTextStyle: defaultTextStyle,
    header0: boldTextStyle.copyWith(fontSize: baseSize + 10),
    header1: boldTextStyle.copyWith(fontSize: baseSize + 8),
    header2: boldTextStyle.copyWith(fontSize: baseSize + 6),
    header3: boldTextStyle.copyWith(fontSize: baseSize + 4),
    header4: boldTextStyle.copyWith(fontSize: baseSize + 2),
    header5: boldTextStyle.copyWith(fontSize: baseSize),
    paragraphStyle: defaultTextStyle,
  );

  return theme;
}

PdfPageFormat transpose(PdfPageFormat pageFormat) {
  final height = pageFormat.height;
  final width = pageFormat.width;
  return PdfPageFormat(
    height,
    width,
    marginTop: pageFormat.marginTop,
    marginBottom: pageFormat.marginBottom,
    marginLeft: pageFormat.marginLeft,
    marginRight: pageFormat.marginRight,
  );
}

pw.PageTheme defaultPageTheme({
  orientation = pw.PageOrientation.portrait,
  pageFormat = PdfPageFormat.a4,
}) {
  return pw.PageTheme(
    pageFormat: pageFormat,
    orientation: orientation,
    clip: true,
    margin: pw.EdgeInsets.symmetric(
      vertical: 1 * PdfPageFormat.inch,
      horizontal: 1 * PdfPageFormat.inch,
    ),
  );
}

Widget BoldText(String text, {dynamic? theme, double? fontSize}) {
  return pw.Builder(
    builder: (context) {
      final theme = pw.Theme.of(context);
      final style = theme.defaultTextStyle.copyWith(
        fontWeight: pw.FontWeight.bold,
        fontSize: fontSize,
      );
      return pw.Text(text, style: style);
    },
  );
}

class ItalicText extends StatelessWidget {
  final double? fontSize;
  final String text;
  ItalicText(this.text, {this.fontSize});
  @override
  Widget build(context) {
    final theme = pw.Theme.of(context);
    final style = theme.defaultTextStyle.copyWith(
      fontStyle: pw.FontStyle.italic,
      fontSize: fontSize,
    );
    return pw.Text(text, style: style);
  }
}

pw.Text BoldItalicText(String text) {
  final style = pw.TextStyle.defaultStyle().copyWith(
    fontWeight: pw.FontWeight.bold,
    fontStyle: pw.FontStyle.italic,
  );
  return pw.Text(text, style: style);
}

pw.Text Heading0(String text) {
  final style = pw.ThemeData.base().header0;
  return pw.Text(text, style: style);
}

pw.Text Heading1(String text) {
  final style = pw.ThemeData.base().header1;
  return pw.Text(text, style: style);
}

pw.Text Heading2(String text) {
  final style = pw.ThemeData.base().header2;
  return pw.Text(text, style: style);
}

pw.Text Heading3(String text) {
  final style = pw.ThemeData.base().header3;
  return pw.Text(text, style: style);
}

pw.Text Heading4(String text) {
  final style = pw.ThemeData.base().header4;
  return pw.Text(text, style: style);
}

pw.Text Heading5(String text) {
  final style = pw.ThemeData.base().header5;
  return pw.Text(text, style: style);
}

class EzSkip extends pw.StatelessWidget {
  late double height;

  EzSkip({
    required this.height,
  });

  factory EzSkip.smallskip() => EzSkip(height: 3 * pt);
  factory EzSkip.medskip() => EzSkip(height: 6 * pt);
  factory EzSkip.bigskip() => EzSkip(height: 14 * pt);

  @override
  pw.Widget build(context) {
    return pw.Divider(
      height: height,
      borderStyle: pw.BorderStyle.none,
    );
  }
}

class EzTitle extends pw.StatelessWidget {
  final String text;
  final double fontSize;

  EzTitle(
    this.text, {
    this.fontSize = 14,
  });

  @override
  Widget build(context) {
    final theme = pw.Theme.of(context);
    return pw.Center(
      child: pw.Text(
        text,
        style: theme.defaultTextStyle.copyWith(
          fontSize: fontSize,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }
}

class EzTopHeader extends StatelessWidget {
  final double? fontSize;
  final bool underline;
  final String firstLine;
  final String secondLine;
  final double firstFontSize;
  final double secondFontSize;
  EzTopHeader({
    this.fontSize,
    this.underline = false,
    required this.firstLine,
    required this.secondLine,
    this.firstFontSize = 12,
    this.secondFontSize = 13,
  });

  factory EzTopHeader.fami({double fontSize = 13}) {
    return EzTopHeader(
      firstFontSize: fontSize,
      secondFontSize: fontSize,
      firstLine: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
      secondLine: "KHOA TOÁN - TIN",
    );
  }

  factory EzTopHeader.chxhcnvn() {
    return EzTopHeader(
      firstLine: "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM",
      secondLine: "Độc lập - Tự do - Hạnh phúc",
    );
  }

  Widget flushLeft() {
    return pw.Row(children: [
      this,
      pw.Expanded(child: pw.SizedBox.shrink()),
    ]);
  }

  Widget flushRight() {
    return pw.Row(children: [
      pw.Expanded(child: pw.SizedBox.shrink()),
      this,
    ]);
  }

  @override
  Widget build(Context context) {
    final theme = pw.Theme.of(context);
    final firstStyle = theme.defaultTextStyle.copyWith(
      fontSize: 12.5,
      fontWeight: pw.FontWeight.bold,
    );
    final secondStyle = theme.defaultTextStyle.copyWith(
      fontSize: 13.5,
    );
    return pw.Column(
      children: [
        pw.Text(firstLine, style: firstStyle),
        pw.Text(secondLine, style: secondStyle),
      ],
    );
  }
}

class EzTable<T> extends StatelessWidget {
  final List<Object?> headers;
  final pw.TableBorder? border;
  final pw.EdgeInsetsGeometry padding;
  final bool dataWrap;
  final bool headerWrap;
  final List<T> data;
  final List<Object?> Function(int, T) rowBuilder;
  final PdfColor? headerForeground;
  final Map<int, pw.TableColumnWidth>? columnWidths;
  final Map<int, pw.Alignment>? alignments;
  final Map<int, pw.TextAlign>? textAligns;

  EzTable({
    required this.data,
    required this.rowBuilder,
    required this.headers,
    this.textAligns,
    this.border,
    this.padding = const pw.EdgeInsetsDirectional.symmetric(
      vertical: 5,
      horizontal: 3,
    ),
    this.dataWrap = false,
    this.headerWrap = false,
    this.headerForeground,
    this.columnWidths,
    this.alignments,
  });

  List<Widget> _headers(Context context) {
    final theme = pw.Theme.of(context);
    return [
      for (final (i, header) in headers.indexed)
        (header is Widget)
            ? header
            : pw.Container(
                padding: padding,
                alignment: pw.Alignment.center,
                child: pw.Text(
                  header?.toString() ?? "",
                  textAlign: textAligns?[i] ?? pw.TextAlign.center,
                  softWrap: headerWrap,
                  style: theme.defaultTextStyle.copyWith(
                    color: headerForeground,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              )
    ];
  }

  @override
  Widget build(Context context) {
    final theme = pw.Theme.of(context);

    return pw.Table(
      columnWidths: columnWidths,
      border: border ?? pw.TableBorder.all(),
      children: [
        // Headers
        pw.TableRow(
          verticalAlignment: pw.TableCellVerticalAlignment.middle,
          children: _headers(context),
        ),
        // Data rows
        for (final (rowCount, row) in data.indexed)
          pw.TableRow(
            verticalAlignment: pw.TableCellVerticalAlignment.middle,
            children: [
              for (final (colCount, data) in rowBuilder(rowCount, row).indexed)
                (data is Widget)
                    ? data
                    : pw.Container(
                        padding: padding,
                        alignment: alignments?[colCount] ?? pw.Alignment.center,
                        child: pw.Text(
                          data?.toString() ?? "",
                          softWrap: dataWrap,
                          textAlign:
                              textAligns?[colCount] ?? pw.TextAlign.center,
                          style: theme.defaultTextStyle.copyWith(),
                        ),
                      )
            ],
          ),
      ],
    );
  }
}
