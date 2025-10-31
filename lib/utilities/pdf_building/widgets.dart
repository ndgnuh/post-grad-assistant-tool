import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// Export everything
// -----------------
export 'package:pdf/pdf.dart';
export 'package:pdf/widgets.dart';

// Helpful constants for units
// ---------------------------
const double cm = PdfPageFormat.cm;
const double inch = PdfPageFormat.inch;
const double mm = PdfPageFormat.mm;
const double pt = PdfPageFormat.point;

/// Create an empty checkbox, this must be
/// implemented because the original [CheckBox] is
/// for creating pdf forms.
class PrintedCheckBox extends StatelessWidget {
  final String? title;
  PrintedCheckBox(this.title);

  @override
  Widget build(Context context) {
    final theme = Theme.of(context);
    final fontSize = theme.defaultTextStyle.fontSize ?? 12 * pt;
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Container(
              width: fontSize,
              height: fontSize,
              decoration: BoxDecoration(
                border: Border.all(width: 1 * pt),
                borderRadius: BorderRadius.circular(3 * pt),
              ),
            ),
            baseline: -2 * pt,
          ),
          if (title != null) ...[
            TextSpan(text: " "),
            TextSpan(text: title),
          ],
        ],
      ),
    );
  }
}

/// Create a footer just like fancyhdr
/// Should I use [Widget] instead of [String?]
class FancyFoot extends StatelessWidget {
  final String left;
  final String center;
  final String right;
  final double rule;
  FancyFoot({
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

/// Create tables from data iterables
/// Headers and cells can be [Widget]s or any [Object]
/// which will be converted to [String]s automatically.
/// if the cell is not a widget, it will follows the rules such as alignment, padding, etc.
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

  @override
  Widget build(Context context) {
    return Table(
      columnWidths: columnWidths,
      border: border ?? TableBorder.all(),
      children: [
        // Headers
        TableRow(
          verticalAlignment: TableCellVerticalAlignment.middle,
          children: _headerWidgets(context),
        ),
        // Data rows
        ..._dataRows(context),
      ],
    );
  }

  List<TableRow> _dataRows(Context context) {
    final rows = <TableRow>[];

    for (final (rowCount, row) in data.indexed) {
      final cells = <Widget>[];
      for (final (colCount, data) in rowBuilder(rowCount, row).indexed) {
        if (data is Widget) {
          cells.add(data);
        } else {
          cells.add(
            Container(
              padding: padding,
              alignment: alignments?[colCount] ?? Alignment.center,
              child: Text(
                data?.toString() ?? "",
                softWrap: dataWrap,
                textAlign: textAligns?[colCount] ?? TextAlign.center,
                style: Theme.of(context).defaultTextStyle.copyWith(),
              ),
            ),
          );
        }
      }
      rows.add(
        TableRow(
          verticalAlignment: TableCellVerticalAlignment.middle,
          children: cells,
        ),
      );
    }

    return rows;
  }

  /// Create header widgets
  List<Widget> _headerWidgets(Context context) {
    final theme = Theme.of(context);
    final headerWidgets = <Widget>[];

    for (final (i, header) in headers.indexed) {
      if (header is Widget) {
        headers.add(header);
        continue;
      }

      final headerWidget = Container(
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
      );
      headerWidgets.add(headerWidget);
    }

    return headerWidgets;
  }
}

/// A widget that display text with certain parts highlighted
/// The [texts] parameter is a list of strings where
/// even indices are normal text and odd indices are highlighted text.
///
/// This is useful in forms, where the odd strings are labels
/// and the even strings are the values. (the values are highlighted)
/// If no [highlightStyle] is provided, the default is bold text.
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

// Pdf context helper
// ------------------
extension PdfContextHelpers on Context {
  TextStyle get defaultTextStyle => theme.defaultTextStyle;
  ThemeData get theme => Theme.of(this);
}

// Page size helper
// ----------------
extension PdfPageFormatHelpers on PdfPageFormat {
  static PdfPageFormat a4Vertical = PdfPageFormat(210 * mm, 297 * mm);
  static PdfPageFormat a4Horizontal = PdfPageFormat(297 * mm, 210 * mm);

  static PdfPageFormat a5Vertical = PdfPageFormat(148 * mm, 210 * mm);
  static PdfPageFormat a5Horizontal = PdfPageFormat(210 * mm, 148 * mm);

  bool get isHorizontal => width > height;

  bool get isVertical => height >= width;
  PdfPageFormat get transpose => copyWith(height: width, width: height);
}

// Helpful text styles
// -------------------
extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get boldItalic =>
      copyWith(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

/// Create dot fill pattern like "Name: ............"
class Dotfill extends StatelessWidget {
  final Widget leading;
  Dotfill({required this.leading});

  @override
  Widget build(Context context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        leading,
        Expanded(
          child: Divider(
            height: (theme.defaultTextStyle.fontSize ?? 12) * 0.5,
            borderStyle: BorderStyle.dotted,
            color: PdfColors.grey,
          ),
        ),
      ],
    );
  }
}
