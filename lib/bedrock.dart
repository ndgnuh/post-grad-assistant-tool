import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'datamodels.dart';

typedef DropdownRecord<T> = ({T? value, String label});
typedef _LDR<T> = List<DropdownRecord<T>>;

Future<_LDR> _fetch(String sql) async {
  final db = await openDatabase(databasePath, readOnly: true);
  final rows = await db.rawQuery(sql);

  await db.close();
  return [
    for (final row in rows)
      (
        value: row["value"],
        label: row["label"] as String,
      )
  ];
}

class AppState extends ChangeNotifier {
  bool initialized;
  List<DropdownRecord>? listGiangVien;
  List<DropdownRecord>? listTrangThai;
  List<DropdownRecord>? listNienKhoa;

  AppState({
    this.initialized = false,
    this.listGiangVien = const [],
    this.listTrangThai = const [],
    this.listNienKhoa = const [],
  });

  Future<void> init() async {
    listGiangVien = await _fetch(
      "SELECT ID AS value, HOTEN AS label FROM GIANGVIEN",
    );
    listNienKhoa = await _fetch(
      "SELECT nienKhoa AS value, nienKhoa AS label FROM NienKhoa",
    );

    // await Future.delayed(Duration(seconds: 5));
    initialized = true;
  }
}

class DropdownData {
  final List<DropdownRecord> listGiangVien;
  final List<DropdownRecord> listTrangThai;
  final List<DropdownRecord> listNienKhoa;

  const DropdownData({
    required this.listGiangVien,
    required this.listNienKhoa,
    required this.listTrangThai,
  });

  factory DropdownData.empty() => DropdownData(
        listGiangVien: [],
        listNienKhoa: [],
        listTrangThai: [],
      );

  static Future<DropdownData> init() async {
    return DropdownData(
      listGiangVien:
          await _fetch("SELECT ID AS value, HOTEN AS label FROM GIANGVIEN"),
      listNienKhoa: await _fetch(
          "SELECT nienKhoa AS value, nienKhoa AS label FROM NienKhoa ORDER BY nienKhoa DESC"),
      listTrangThai: [],
    );
  }
}

class Helper {
  final BuildContext context;
  const Helper(this.context);

  notify(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}

void ezNotify(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
