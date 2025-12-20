/// Ultilies for building Excel files using the 'excel' package.
library;

import 'dart:typed_data';
import 'package:excel/excel.dart';

import '../../../utilities/strings.dart';
export 'package:excel/excel.dart';

class CellPointer {
  late CellIndex index;
  CellPointer(this.index);

  CellIndex get current => index;

  CellIndex peek({int advanceRow = 0, int advanceColumn = 0}) {
    return CellIndex.indexByColumnRow(
      columnIndex: index.columnIndex + advanceColumn,
      rowIndex: index.rowIndex + advanceRow,
    );
  }

  /// Jump to next row, return new index
  /// Can specify how many row to advance
  CellIndex advanceRow([int advance = 1]) {
    index = CellIndex.indexByColumnRow(
      columnIndex: index.columnIndex,
      rowIndex: index.rowIndex + advance,
    );
    return index;
  }

  /// Jump to next column, return new index
  /// Can specify how many column to advance
  CellIndex advanceColumn([int advance = 1]) {
    index = CellIndex.indexByColumnRow(
      columnIndex: index.columnIndex + advance,
      rowIndex: index.rowIndex,
    );
    return index;
  }

  /// Jump to specific row, return new index
  CellIndex jumpToRow(int row) {
    index = CellIndex.indexByColumnRow(
      columnIndex: index.columnIndex,
      rowIndex: row,
    );
    return index;
  }

  /// Jump to specific column, return new index
  CellIndex jumpToColumn(Object column) {
    switch (column) {
      case String colStr:
        final columnIndex = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".indexOf(
          colStr.toUpperCase(),
        );
        index = CellIndex.indexByColumnRow(
          columnIndex: columnIndex,
          rowIndex: index.rowIndex,
        );
        return index;
      case int colInt:
        index = CellIndex.indexByColumnRow(
          columnIndex: colInt,
          rowIndex: index.rowIndex,
        );
        return index;
      default:
        throw ArgumentError(
          'Column must be String (column name) or int (column index)',
        );
    }
  }
}

Uint8List buildExcel({
  required Map<String, Function(Sheet)> builders,
}) {
  final excel = Excel.createExcel();

  // Build sheets
  for (final entry in builders.entries) {
    final sheetName = entry.key;
    final builder = entry.value;

    final sheet = excel[sheetName];
    builder(sheet);
  }

  // Remove default sheet
  final previousDefaultSheetName = excel.sheets.keys.first;
  excel.setDefaultSheet(builders.keys.first);
  excel.delete(previousDefaultSheetName);

  return excel.encode() as Uint8List;
}

Uint8List buildSingleSheetExcel({
  required Function(Sheet) builder,
}) {
  final excel = Excel.createExcel();
  final sheet = excel.sheets.values.first;

  // Ok, so the library does not allow setting pages

  // Add headers
  builder(sheet);

  return excel.encode() as Uint8List;
}

extension CellStyleHelper on CellStyle {
  CellStyle withBorders({
    BorderStyle borderStyle = BorderStyle.Thin,
    ExcelColor? color,
  }) {
    final border = Border(borderStyle: borderStyle, borderColorHex: color);
    return copyWith(
      leftBorderVal: border,
      rightBorderVal: border,
      topBorderVal: border,
      bottomBorderVal: border,
    );
  }

  CellStyle adjustFontSize({int? fontSize, int increment = 0}) {
    fontSize ??= this.fontSize ?? 12;
    return copyWith(fontSizeVal: fontSize + increment);
  }

  CellStyle get wrapText => copyWith(textWrappingVal: TextWrapping.WrapText);

  CellStyle get bold => copyWith(boldVal: true);

  CellStyle get italic => copyWith(italicVal: true);

  CellStyle get underline => copyWith(underlineVal: Underline.Single);

  CellStyle get centerVertically =>
      copyWith(verticalAlignVal: VerticalAlign.Center);

  CellStyle get centerHorizontally =>
      copyWith(horizontalAlignVal: HorizontalAlign.Center);

  CellStyle get flushLeft => copyWith(horizontalAlignVal: HorizontalAlign.Left);

  CellStyle get flushRight =>
      copyWith(horizontalAlignVal: HorizontalAlign.Right);

  CellStyle get center => centerVertically.centerHorizontally;

  CellStyle get formatMoney => copyWith(
    numberFormat: NumFormat.custom(
      formatCode: "###,###,###,###,###,###,###,###,###",
    ),
  );
}

extension SheetHelpers on Sheet {
  void setAllColumnAutoFit() {
    for (var colIndex = 0; colIndex < maxColumns; colIndex++) {
      setColumnAutoFit(colIndex);
    }
  }

  void addTable({
    required CellIndex topLeftIndex,
    required List<List<Object?>> data,
    List<String>? header,
    CellStyle? headerStyle,
    CellStyle? cellStyle,
    BorderStyle borderStyle = BorderStyle.Thin,
    CellStyle Function(int col, Object? value, CellStyle defaultStyle)?
    headerStyleBuilder,
    CellStyle Function(int row, int col, Object? value, CellStyle defaultStyle)?
    cellStyleBuilder,
    Object? Function(int row, int col, Object? value)? cellValueBuilder,
  }) {
    final border = Border(borderStyle: borderStyle);

    final tableCellStyle = (cellStyle ?? defaultCellStyle).copyWith(
      leftBorderVal: border,
      rightBorderVal: border,
      topBorderVal: border,
      bottomBorderVal: border,
    );

    final tableHeaderStyle = (headerStyle ?? defaultCellStyle).copyWith(
      boldVal: true,
      leftBorderVal: border,
      rightBorderVal: border,
      topBorderVal: border,
      bottomBorderVal: border,
    );

    if (header != null) {
      for (var colOffset = 0; colOffset < header.length; colOffset++) {
        final cellIndex = CellIndex.indexByColumnRow(
          columnIndex: topLeftIndex.columnIndex + colOffset,
          rowIndex: topLeftIndex.rowIndex,
        );
        final value = header[colOffset];
        final style = headerStyleBuilder?.call(
          colOffset,
          value,
          tableHeaderStyle,
        );
        setCell(
          cellIndex: cellIndex,
          value: value,
          style: style ?? tableHeaderStyle,
        );
      }
    }

    final rowIndexOffset = header != null ? 1 : 0;
    for (var rowIndex = 0; rowIndex < data.length; rowIndex++) {
      final row = data[rowIndex];
      for (var colIndex = 0; colIndex < row.length; colIndex++) {
        final cellIndex = CellIndex.indexByColumnRow(
          columnIndex: topLeftIndex.columnIndex + colIndex,
          rowIndex: topLeftIndex.rowIndex + rowIndex + rowIndexOffset,
        );

        /// Custom value transformation
        final rawValue = row[colIndex];

        final value = cellValueBuilder?.call(
          rowIndex,
          colIndex,
          rawValue,
        );

        final style = cellStyleBuilder?.call(
          rowIndex,
          colIndex,
          value,
          tableCellStyle,
        );

        setCell(
          cellIndex: cellIndex,
          value: value ?? rawValue,
          style: style ?? tableCellStyle,
        );
      }
    }
  }

  CellStyle get defaultCellStyle => CellStyle(
    fontFamily: "Times New Roman",
    fontSize: 12,
  );

  CellValue toCellValue(Object? value) {
    switch (value) {
      case CellValue cv:
        return cv;
      case null:
        return TextCellValue('');
      case String text:
        return TextCellValue(text);
      case int number:
        return IntCellValue(number);
      case double number:
        return DoubleCellValue(number);
      case DateTime dt:
        return DateCellValue.fromDateTime(dt);
      case bool boolean:
        return BoolCellValue(boolean);
      default:
        throw ArgumentError('Unsupported value type: ${value.runtimeType}');
    }
  }

  void setCell({
    required CellIndex cellIndex,
    required Object? value,
    CellIndex? mergeTo,
    CellStyle? style,
  }) {
    final cellValue = toCellValue(value);
    if (mergeTo != null) {
      merge(
        cellIndex,
        mergeTo,
        customValue: cellValue,
      );
    } else {
      final cell = this.cell(cellIndex);
      cell.value = cellValue;
    }

    if (style != null) {
      final cell = this.cell(cellIndex);
      cell.cellStyle = style;
    }
  }
}
