import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

/// Find the position of the table start on the text at the corner
/// Return the position of the [(row, column)]
(int, int) findTablePosition(Sheet sheet, {cornerText = "STT"}) {
  for (var rowIndex = 0; rowIndex < sheet.maxRows; rowIndex++) {
    for (var colIndex = 0; colIndex < sheet.maxColumns; colIndex++) {
      final cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: colIndex, rowIndex: rowIndex),
      );
      if (cell.value.toString() == cornerText) {
        return (rowIndex, colIndex);
      }
    }
  }
  throw Exception("Table header $cornerText not found");
}

/// Extract table data from the sheet starting from specified row and column
/// Optionally, you can specify the corner text to identify the table start
Map<String, List<String>> extractTable(
  Sheet sheet, {
  int startRow = 0,
  int startCol = 0,
  String? cornerText,
  bool hasHeaders = true,
}) {
  // Find table position based on corner text if provided
  if (cornerText != null) {
    final (row, col) = findTablePosition(sheet, cornerText: cornerText);
    startRow = row;
    startCol = col;
  }

  // Get the column headers
  final headers = <String>[];
  if (hasHeaders) {
    for (int c = startCol; c < sheet.maxColumns; c++) {
      final cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: c, rowIndex: startRow),
      );
      final header = cell.value.toString();
      headers.add(header);
    }

    startRow = startRow + 1; // Exclude the header row
  } else {
    // If no headers, create default headers
    for (int c = startCol; c < sheet.maxColumns; c++) {
      final header = 'column_${c - startCol}';
      headers.add(header);
    }
  }

  // Initialize table columns
  final table = <String, List<String>>{};
  for (final header in headers) {
    table[header] = <String>[];
  }

  // Lấy dữ liệu
  for (int c = startCol; c < sheet.maxColumns; c++) {
    final header = headers[c];
    final column = table[header] as List;
    for (int r = startRow; r < sheet.maxRows; r++) {
      final Data cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: c, rowIndex: r),
      );
      final value = cell.value.toString().trim();
      column.add(value);
    }
  }

  // Check column lengths consistency
  final lengths = [for (final header in headers) table[header]!.length];
  for (final len in lengths) {
    if (len != lengths.first) {
      throw Exception(
        "Inconsistent column lengths in extracted table:\n$lengths",
      );
    }
  }

  return table;
}

/// A convenience function to import table from an Excel file
Future<Map<String, List<String>>?> importTableFromExcelFile({
  int startRow = 0,
  int startCol = 0,
  String? cornerText,
  bool hasHeaders = true,
}) async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['xlsx'],
  );
  if (result == null) return null;

  final path = result.files.single.path;
  if (path == null) return null;

  final file = File(path);
  final bytes = await file.readAsBytes();
  final excel = Excel.decodeBytes(bytes);
  final sheet = excel.sheets.values.single;

  final extracted = extractTable(
    sheet,
    startRow: startRow,
    startCol: startCol,
    cornerText: cornerText,
    hasHeaders: hasHeaders,
  );
  return extracted;
}
