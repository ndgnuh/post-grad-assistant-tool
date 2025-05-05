import 'package:excel/excel.dart';
export 'package:excel/excel.dart';

extension EzIndex on Sheet {
  Data operator [](Object index) {
    switch (index) {
      case String cellIndex:
        return cell(CellIndex.indexByString(cellIndex));
      case (int row, int col):
        final index = CellIndex.indexByColumnRow(
          columnIndex: col,
          rowIndex: row,
        );
        return cell(index);
      case CellIndex cellIndex:
        return cell(cellIndex);
      default:
        throw "Invalid cell index";
    }
  }
}
