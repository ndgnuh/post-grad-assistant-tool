/// Ultilies for building Excel files using the 'excel' package.
library;

import 'dart:typed_data';
import 'package:excel/excel.dart';
export 'package:excel/excel.dart';

Uint8List buildSingleSheetExcel({
  required Function(Sheet) builder,
}) {
  final excel = Excel.createExcel();
  final sheet = excel.sheets.values.first;

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
    CellStyle Function(CellIndex index, Object? value, CellStyle defaultStyle)?
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
        setCell(
          cellIndex: cellIndex,
          value: value,
          style: tableHeaderStyle,
        );
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
        setCell(cellIndex: cellIndex, value: value, style: tableCellStyle);
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
