/// Ultilies for building Excel files using the 'excel' package.
library;

import 'dart:typed_data';
import 'package:excel/excel.dart';
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
  CellIndex jumpToColumn(int column) {
    index = CellIndex.indexByColumnRow(
      columnIndex: column,
      rowIndex: index.rowIndex,
    );
    return index;
  }
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
    CellStyle Function(int row, int col, Object? value, CellStyle defaultStyle)?
    cellStyleBuilder,
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

        if (cellStyleBuilder != null) {
          final style = cellStyleBuilder(
            0,
            colOffset,
            value,
            tableHeaderStyle,
          );
          setCell(
            cellIndex: cellIndex,
            value: value,
            style: style,
          );
        } else {
          setCell(
            cellIndex: cellIndex,
            value: value,
            style: tableHeaderStyle,
          );
        }
      }
    }

    for (var rowOffset = 0; rowOffset < data.length; rowOffset++) {
      final row = data[rowOffset];
      for (var colOffset = 0; colOffset < row.length; colOffset++) {
        final cellIndex = CellIndex.indexByColumnRow(
          columnIndex: topLeftIndex.columnIndex + colOffset,
          rowIndex:
              topLeftIndex.rowIndex + rowOffset + (header != null ? 1 : 0),
        );
        final value = row[colOffset];
        if (cellStyleBuilder != null) {
          final style = cellStyleBuilder(
            rowOffset + 1,
            colOffset,
            value,
            tableCellStyle,
          );
          setCell(
            cellIndex: cellIndex,
            value: value,
            style: style,
          );
        } else {
          setCell(cellIndex: cellIndex, value: value, style: tableCellStyle);
        }
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
