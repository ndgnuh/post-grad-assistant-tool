// Provide wrapper around pdf widgets

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
export 'package:pdf/widgets.dart';

const double pt = PdfPageFormat.point;
const double inch = PdfPageFormat.inch;
const double mm = PdfPageFormat.mm;
const double cm = PdfPageFormat.cm;

enum IsoPageFormat {
  horizontalA4(),
  verticalA4(),
  horizontalA5(),
  verticalA5();

  PdfPageFormat get pdfPageFormat {
    final a4Width = 21.0 * PdfPageFormat.cm;
    final a4Height = 29.7 * PdfPageFormat.cm;
    final a5Width = 14.8 * PdfPageFormat.cm;
    final a5Height = 21.0 * PdfPageFormat.cm;
    switch (this) {
      case IsoPageFormat.horizontalA4:
        return PdfPageFormat(a4Height, a4Width);
      case IsoPageFormat.verticalA4:
        return PdfPageFormat(a4Width, a4Height);
      case IsoPageFormat.horizontalA5:
        return PdfPageFormat(a5Height, a5Width);
      case IsoPageFormat.verticalA5:
        return PdfPageFormat(a5Width, a5Height);
    }
  }
}

// class EzMultiPage extends StatelessWidget {
//   final List<Widget> children;
//   final IsoPageFormat pageFormat;
//   final double baseFontSize;
//
//   EzMultiPage({
//     required this.children,
//     this.pageFormat = IsoPageFormat.horizontalA4,
//     this.baseFontSize = 11.0,
//   });
//
//   @override
//   Widget build(Context context) {
//     final pageFormat_ = switch (pageFormat) {
//       IsoPageFormat.horizontalA4 => PdfPageFormat.a4.landscape,
//       IsoPageFormat.verticalA4 => PdfPageFormat.a4,
//       IsoPageFormat.horizontalA5 => PdfPageFormat.a5.landscape,
//       IsoPageFormat.verticalA5 => PdfPageFormat.a5,
//     };
//
//     // return MultiPage(
//     //   pageFormat: pageFormat_,
//     //   build: (Context context) => children,
//     // );
//   }
// }

class EzTextModifier extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign textAlign;

  EzTextModifier(
    this.text, {
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textAlign = TextAlign.justify,
  });

  @override
  Widget build(context) {
    final theme = Theme.of(context);
    final style = theme.defaultTextStyle.copyWith(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
    );
    return Text(
      text,
      textAlign: textAlign,
      style: style,
    );
  }
}

class EzBold extends EzTextModifier {
  EzBold(
    super.text, {
    super.fontSize,
    super.textAlign,
  }) : super(fontWeight: FontWeight.bold);
}

class EzItalic extends EzTextModifier {
  EzItalic(super.text, {super.fontSize}) : super(fontStyle: FontStyle.italic);
}

class EzBoldItalic extends EzTextModifier {
  EzBoldItalic(super.text, {super.fontSize})
    : super(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
}

/// Provide vertical skip
class EzSkip extends Divider {
  EzSkip({required super.height}) : super(borderStyle: BorderStyle.none);
  factory EzSkip.smallskip() => EzSkip(height: 3 * PdfPageFormat.point);
  factory EzSkip.medskip() => EzSkip(height: 6 * PdfPageFormat.point);
  factory EzSkip.bigskip() => EzSkip(height: 14 * PdfPageFormat.point);

  // This is the newer "interface"
  // why bother creating new instances every time
  static final smallSkip = EzSkip.smallskip();
  static final medSkip = EzSkip.medskip();
  static final bigSkip = EzSkip.bigskip();
}

/// Provide a tile with dotfill
/// Experimental...
class EzDotfillTile extends StatelessWidget {
  final Widget leading;

  EzDotfillTile({required this.leading});

  @override
  Widget build(Context context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        leading,
        Expanded(
          child: Divider(
            height: (theme.defaultTextStyle.fontSize ?? 10) * 0.5,
            borderStyle: BorderStyle.dotted,
          ),
        ),
      ],
    );
  }
}

/// Create an empty checkbox, this must be
/// implemented because the original [CheckBox] is
/// for creating pdf forms.
class EzCheckbox extends StatelessWidget {
  @override
  Widget build(Context context) {
    final theme = Theme.of(context);
    final fontSize = theme.defaultTextStyle.fontSize ?? 10;
    return Container(
      width: fontSize,
      height: fontSize,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(0.15 * fontSize),
      ),
    );
  }
}

/// Create a footer just like fancyhdr
/// TODO: use Widget instead of String?
class EzFancyFoot extends StatelessWidget {
  final String left;
  final String center;
  final String right;
  final double rule;
  EzFancyFoot({
    this.left = "",
    this.right = "",
    this.center = "",
    this.rule = 1,
  });

  @override
  Widget build(Context context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: rule),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left),
          Text(center),
          Text(right),
        ],
      ),
    );
  }
}

class EzTable<T> extends StatelessWidget {
  final List<Object?> headers;
  final TableBorder? border;
  final EdgeInsetsGeometry padding;
  final bool dataWrap;
  final bool headerWrap;
  final List<T> data;
  final List<Object?> Function(int, T) rowBuilder;
  final PdfColor? headerForeground;
  final Map<int, TableColumnWidth>? columnWidths;
  final Map<int, Alignment>? alignments;
  final Map<int, TextAlign>? textAligns;

  EzTable({
    required this.data,
    required this.rowBuilder,
    required this.headers,
    this.textAligns,
    this.border,
    this.padding = const EdgeInsetsDirectional.symmetric(
      vertical: 2 * pt,
      horizontal: 3 * pt,
    ),
    this.dataWrap = false,
    this.headerWrap = false,
    this.headerForeground,
    this.columnWidths,
    this.alignments,
  });

  List<Widget> _headers(Context context) {
    final theme = Theme.of(context);
    return [
      for (final (i, header) in headers.indexed)
        (header is Widget)
            ? header
            : Container(
                padding: padding,
                alignment: Alignment.center,
                child: Text(
                  header?.toString() ?? "",
                  textAlign: textAligns?[i] ?? TextAlign.center,
                  softWrap: headerWrap,
                  style: theme.defaultTextStyle.copyWith(
                    color: headerForeground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
    ];
  }

  @override
  Widget build(Context context) {
    final theme = Theme.of(context);

    return Table(
      columnWidths: columnWidths,
      border: border ?? TableBorder.all(),
      children: [
        // Headers
        TableRow(
          repeat: true,
          verticalAlignment: TableCellVerticalAlignment.middle,
          children: _headers(context),
        ),
        // Data rows
        for (final (rowCount, row) in data.indexed)
          TableRow(
            verticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              for (final (colCount, data) in rowBuilder(rowCount, row).indexed)
                (data is Widget)
                    ? data
                    : Container(
                        padding: padding,
                        alignment: alignments?[colCount] ?? Alignment.center,
                        child: Text(
                          data?.toString() ?? "",
                          softWrap: dataWrap,
                          textAlign: textAligns?[colCount] ?? TextAlign.center,
                          style: theme.defaultTextStyle.copyWith(),
                        ),
                      ),
            ],
          ),
      ],
    );
  }
}

extension MoneyFormatter on num {
  String formatMoney() {
    final String formatted = toString();
    final characters = formatted.split('');

    final outputChars = <String>[];

    for (final (i, c) in characters.reversed.indexed) {
      if (i != 0 && i % 3 == 0) {
        outputChars.add('.');
      }
      outputChars.add(c);
    }

    return outputChars.reversed.join('');
  }
}
