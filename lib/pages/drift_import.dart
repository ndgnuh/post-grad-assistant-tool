//// A page that import data to my drift database
/// using CSV files
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:drift/drift.dart';

import '../business/drift_orm.dart';

Future<List<Map<String, Object?>>> readCsvAsRecords(String csvFile) async {
  final input = await File(csvFile).readAsString();
  final fields = const CsvToListConverter(eol: '\n').convert(input);
  final headers = fields.first.map((e) => e.toString()).toList();
  return [for (final row in fields.skip(1)) Map.fromIterables(headers, row)];
}

class PageImportHocPhan extends StatelessWidget {
  const PageImportHocPhan({super.key});
  static const routeName = '/drift/import-hoc-phan';

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context, listen: false);
    final messenger = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Import Học Phần")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _importHocPhan(database, messenger),
          child: const Text("Chọn file CSV để import"),
        ),
      ),
    );
  }

  Future<void> _importHocPhan(AppDatabase database, messenger) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result == null || result.files.isEmpty) return;

    final filePath = result.files.first.path;
    if (filePath == null) {
      messenger.showSnackBar(
        const SnackBar(content: Text("Không tìm thấy file!")),
      );
      return;
    }

    final records = await readCsvAsRecords(filePath);

    for (final row in records) {
      // Skip header row
      final hocPhan = HocPhanCompanion.insert(
        maHocPhan: row['maHocPhan'] as String,
        tenTiengViet: row['tenTiengViet'] as String,
        tenTiengAnh: row['tenTiengAnh'] as String,
        soTinChi: row['soTinChi'] as int,
        khoiLuong: row['khoiLuong'] as String,
        khoiKienThuc:
            Value(KhoiKienThuc.fromString(row['khoiKienThuc'] as String)),
      );
      await database.into(database.hocPhan).insert(hocPhan);
    }

    messenger.showSnackBar(
      const SnackBar(content: Text("Import thành công!")),
    );
  }
}
