import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common/sqflite_logger.dart';

export 'package:sqflite/sqflite.dart' show Database, Transaction;
export 'sqlbuilder/sqlbuilder.dart'
    show Query, SelectQuery, UpdateQuery, InsertQuery, DeleteQuery;

import '../preferences.dart' as preferences;

Future initSqlite() async {
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }
}

final defaultDatabasePath = path.join(path.current, "fami.sqlite3");

Future<T> transaction<T>(Future<T> Function(Transaction) callback) async {
  final databasePath = await preferences.getDatabasePath();
  final db = await openDatabase(databasePath!, singleInstance: false);
  final ret = await db.transaction(callback);
  await db.close();
  return ret;
}

Future<T> dbSession<T>(Future<T> Function(Database) callback) async {
  final databasePath = await preferences.getDatabasePath();
  var factoryWithLogs = SqfliteDatabaseFactoryLogger(
    databaseFactory,
    options: SqfliteLoggerOptions(type: SqfliteDatabaseFactoryLoggerType.all),
  );
  final db = await factoryWithLogs.openDatabase(databasePath!);

  final ret = await callback(db);
  await db.close();
  return ret;
}

Future<T> dbSessionReadOnly<T>(Future<T> Function(Database) callback) async {
  final databasePath = await preferences.getDatabasePath();
  final db = await openDatabase(
    databasePath!,
    readOnly: true,
    singleInstance: false,
  );
  final ret = await callback(db);
  await db.close();
  return ret;
}
