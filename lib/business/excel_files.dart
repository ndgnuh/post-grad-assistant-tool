import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'excel_files/msc_teaching_assignment.dart' as msc_xlsx;

class ExcelFile {
  final String name;
  final Uint8List bytes;

  String get fileName => name.endsWith(".xlsx") ? name : "$name.xlsx";

  static const msc = (
    teachingAssignment: msc_xlsx.buildTeachingAssignmentXlsx,
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
