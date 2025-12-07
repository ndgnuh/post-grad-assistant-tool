import 'package:fami_tools/utilities/strings.dart';

import '../../documents.dart';
import 'package:fami_tools/utilities/excel_builder.dart';

import '../models/payment_atm.dart';

ExcelFile paymentTableExcel({required PaymentAtmModel model}) {
  final builder = _PaymentAtmExcelBuilder(model);
  final bytes = buildSingleSheetExcel(builder: builder.call);
  final file = ExcelFile(name: model.fileName, bytes: bytes);
  return file;
}

class _PaymentAtmExcelBuilder {
  final PaymentAtmModel model;

  _PaymentAtmExcelBuilder(this.model);

  void call(Sheet sheet) {
    final style = sheet.defaultCellStyle
        .copyWith(fontSizeVal: 12)
        .centerVertically;

    sheet.setCell(
      cellIndex: CellIndex.indexByString("A1"),
      mergeTo: CellIndex.indexByString("C1"),
      value: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
      style: style.center,
    );

    sheet.setCell(
      cellIndex: CellIndex.indexByString("A2"),
      mergeTo: CellIndex.indexByString("C2"),
      value: "ĐẠI HỌC BÁCH KHOA HÀ NỘI",
      style: style.bold.center,
    );

    sheet.setCell(
      cellIndex: CellIndex.indexByString("A4"),
      mergeTo: CellIndex.indexByString("H4"),
      value: "BẢNG TỔNG HỢP THANH TOÁN TIỀN",
      style: style.bold.center,
    );

    sheet.setCell(
      cellIndex: CellIndex.indexByString("A5"),
      mergeTo: CellIndex.indexByString("H5"),
      value: model.reason.toUpperCase(),
      style: style.bold.center,
    );

    sheet.addTable(
      topLeftIndex: CellIndex.indexByString("A7"),
      data: model.dataRows,
      header: model.dataHeaders,
      headerStyle: style.bold.center,
      cellStyle: style.center,
      cellStyleBuilder: (row, col, value, defaultStyle) {
        // Keep heading styles
        if (row == 0) {
          return defaultStyle.bold.center;
        }

        /// Summary row style
        if (row == model.entries.length + 1) {
          switch (col) {
            case 1:
              return defaultStyle.bold.flushLeft;
            case 2:
            case 3:
            case 4:
              return defaultStyle.bold.flushRight.centerVertically;
            default:
              return defaultStyle;
          }
        }

        // Other cells
        switch (col) {
          case 1:
            return defaultStyle.flushLeft;
          case 2:
          case 3:
          case 4:
            return defaultStyle.flushRight.centerVertically;
          default:
            return defaultStyle;
        }
      },
    );

    final pt = CellPointer(
      CellIndex.indexByColumnRow(
        columnIndex: 0,
        rowIndex: sheet.maxRows + 1,
      ),
    );
    sheet.setCell(
      cellIndex: pt.current,
      mergeTo: pt.peek(advanceColumn: sheet.maxColumns - 1),
      value: [
        "Tổng số còn lĩnh: ",
        "${model.totalAfterTax.formatMoney()}đ",
        ". Bằng chữ: ",
        "${model.totalAfterTax.toVietnameseWords()} đồng",
        ".",
      ].join(""),
      style: style.bold.center,
    );

    sheet.setCell(
      cellIndex: pt.advanceRow(3),
      mergeTo: pt.advanceColumn(2),
      value: "DUYỆT CỦA BAN GIÁM ĐỐC",
      style: style.bold.center,
    );

    sheet.setCell(
      cellIndex: pt.advanceColumn(1),
      mergeTo: pt.advanceColumn(2),
      value: "BAN TÀI CHÍNH - KẾ HOẠCH",
      style: style.bold.center,
    );

    final numCol = 1;
    sheet.setCell(
      cellIndex: pt.advanceColumn(1),
      mergeTo: pt.peek(advanceColumn: numCol),
      value: "TRƯỞNG KHOA KHOA TOÁN-TIN",
      style: style.bold.center,
    );
    sheet.setCell(
      cellIndex: pt.advanceRow(-1),
      mergeTo: pt.peek(advanceColumn: numCol),
      style: style.italic.center,
      value: "Hà Nội, ngày ${'.' * 6} tháng ${'.' * 6} năm ${'.' * 12}",
    );

    sheet.setColumnWidth(0, 5);
    sheet.setColumnWidth(1, 25);
    sheet.setColumnWidth(2, 15);
    sheet.setColumnWidth(3, 15);
    sheet.setColumnWidth(4, 15);
    sheet.setColumnWidth(5, 25);
    sheet.setColumnWidth(6, 25);
    sheet.setColumnWidth(7, 20);
  }
}
