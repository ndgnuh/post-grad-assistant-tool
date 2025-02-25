import 'dart:io';
import 'package:excel/excel.dart';

extension SheetIndex on Sheet {
  Data operator []((int i, int j) ij) {
    final (i, j) = ij;
    return cell(CellIndex.indexByColumnRow(rowIndex: i, columnIndex: j));
  }

  CellIndex ezid({int? row, int? col, String? cell}) {
    return switch ((row, col, cell)) {
      (int r, int c, _) =>
        CellIndex.indexByColumnRow(columnIndex: c, rowIndex: r),
      (_, _, String cell) => CellIndex.indexByString(cell),
      _ => throw "Invalid cell index",
    };
  }
}
