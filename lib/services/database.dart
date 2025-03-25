import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';

export 'sqlbuilder/sqlbuilder.dart'
    show Query, SelectQuery, UpdateQuery, InsertQuery, DeleteQuery;

final databasePath = path.join(path.current, "fami.sqlite3");

Future initSqlite() async {
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }
}

Future<T> dbSession<T>(Future<T> Function(Database) callback) async {
  final db = await openDatabase(databasePath, singleInstance: false);
  final ret = await callback(db);
  await db.close();
  return ret;
}
