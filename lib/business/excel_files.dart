import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'excel_files/msc_teaching_assignment.dart' as msc_xlsx;
import 'excel_files/payment_atm_table.dart' as payment_xlsx;

class ExcelFile {
  final String name;
  final Uint8List bytes;

  String get fileName => name.endsWith(".xlsx") ? name : "$name.xlsx";

  static const msc = (
    teachingAssignment: msc_xlsx.buildTeachingAssignmentXlsx,
  );

  static const payment = (
    atmTable: payment_xlsx.paymentTableExcel,
  );

  Future<void> save({required String directory}) {
    final file = File(p.join(directory, fileName));
    return file.writeAsBytes(bytes);
  }

  ExcelFile({
    required this.name,
    required this.bytes,
  });
}
