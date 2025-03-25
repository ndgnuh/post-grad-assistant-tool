import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import '../datamodels.dart' show databasePath, NienKhoa;

typedef _Row<T> = ({T? value, String label});

class _State extends ChangeNotifier {
  String query;
  _State({required this.query});

  static final Map<String, List<_Row>> _cache = {};
  static final Map<String, Future<List<_Row>>> _running = {};

  Future<List<_Row>> get data async {
    switch (_cache[query]) {
      case List<_Row> data:
        return data;
      case null:
        Future<List<_Row>>? future;
        switch (_running[query]) {
          case Future<List<_Row>> future_:
            future = future_;
          default:
            _running[query] = future = dataUncached();
        }
        List<_Row> data = await future;
        _cache[query] = data;
        return data;
    }
  }

  Future<List<_Row>> dataUncached() async {
    final db = await openDatabase(
      databasePath,
      readOnly: true,
    );
    final rrows = await db.rawQuery(query);
    final rows = [
      for (final row in rrows)
        (
          value: row['value'],
          label: row['label'] as String,
        ),
    ];
    await db.close();
    return rows;
  }
}

class DropdownFromSql<T> extends StatelessWidget {
  final String sql;
  final T? selectedId;
  final ValueChanged<T?> onSelected;
  final bool allowEmpty;
  final String? emptyLabel;

  factory DropdownFromSql.giangVien({required onSelected, selectedId, key}) {
    return DropdownFromSql(
      sql: "SELECT ID AS value, HOTEN AS label FROM GIANGVIEN",
      onSelected: onSelected,
      selectedId: selectedId,
      key: key,
    );
  }

  factory DropdownFromSql.nienKhoa({required onSelected, selectedId}) {
    return DropdownFromSql(
      sql: "SELECT nienKhoa AS value, nienKhoa AS label FROM NienKhoa",
      onSelected: onSelected,
      selectedId: selectedId,
    );
  }

  const DropdownFromSql({
    super.key,
    this.selectedId,
    required this.sql,
    required this.onSelected,
    this.allowEmpty = true,
    this.emptyLabel,
  });

  Widget doneBuilder(context, List<_Row> data) {
    return DropdownMenu<T?>(
      key: key,
      onSelected: onSelected,
      initialSelection: selectedId,
      enableSearch: true,
      enableFilter: true,
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: null,
          label: emptyLabel ?? "--",
        ),
        for (final row in data)
          DropdownMenuEntry(
            value: row.value,
            label: row.label,
          ),
      ],
    );
  }

  Widget builder(context, model, child) {
    return FutureBuilder(
      future: model.data,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            switch (snapshot.data) {
              case List<_Row> data:
                return doneBuilder(context, data);
              default:
                return Text("Unexpected error");
            }
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _State(query: sql),
      child: Consumer<_State>(builder: builder),
    );
  }
}
