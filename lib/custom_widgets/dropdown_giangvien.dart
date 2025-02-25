import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../datamodels.dart' show databasePath;

typedef _GiangVien = Map<String, Object?>;
Future<List<_GiangVien>> _getGiangVien() async {
  var db = await openDatabase(databasePath);
  var rows = await db.rawQuery("""SELECT
id,
CONCAT(hoTen, char(10), donVi, char(10), sdt, char(10), email) as label
from GiangVien
""");
  await db.close();
  return rows;
}

class DropdownGiangVien extends StatelessWidget {
  final int? selectedId;
  final ValueChanged<int?> onSelected;

  static var futureGiangVien = _getGiangVien();

  const DropdownGiangVien({
    super.key,
    this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureGiangVien,
      builder: (context, snapshot) {
        List<DropdownMenuEntry<int>> entries = [];
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            List<_GiangVien> data = snapshot.data ?? <_GiangVien>[];
            entries = [
              for (final gv in data)
                DropdownMenuEntry(
                  value: gv["id"] as int,
                  label: gv["label"] as String,
                )
            ];
          default:
        }

        return DropdownMenu<int>(
          width: 300,
          onSelected: onSelected,
          dropdownMenuEntries: entries,
          initialSelection: selectedId,
          enableFilter: true,
        );
      },
    );
  }
}
