import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common/sqflite_logger.dart';

// for DatabaseProvider
import 'package:riverpod/riverpod.dart';

export 'package:sqflite/sqflite.dart' show Database, Transaction;
export 'sqlbuilder/sqlbuilder.dart'
    show Query, SelectQuery, UpdateQuery, InsertQuery, DeleteQuery;

import '../business/db_v2_providers.dart';

Future initSqlite() async {
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }
}

class CompatDatabasePathInjection {
  String? dbPath;
  void inject(String? path) {
    dbPath = path;
  }

  static final instance = CompatDatabasePathInjection();
}

final defaultDatabasePath = path.join(path.current, "fami.sqlite3");

final databaseProvider = FutureProvider<Database>((ref) async {
  final databasePath = await ref.watch(appDatabasePathProvider.future);
  final db = await openDatabase(databasePath ?? defaultDatabasePath);
  return db;
});

final readOnlyDatabaseProvider = FutureProvider<Database>((ref) async {
  final databasePath = CompatDatabasePathInjection.instance.dbPath;
  final db = await openDatabase(
    databasePath ?? defaultDatabasePath,
    readOnly: true,
    singleInstance: false,
  );
  return db;
});

Future<T> transaction<T>(Future<T> Function(Transaction) callback) async {
  final databasePath = CompatDatabasePathInjection.instance.dbPath;
  final db = await openDatabase(databasePath!, singleInstance: false);
  final ret = await db.transaction(callback);
  await db.close();
  return ret;
}

Future<T> dbSession<T>(Future<T> Function(Database) callback) async {
  final databasePath = CompatDatabasePathInjection.instance.dbPath;
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
  final databasePath = CompatDatabasePathInjection.instance.dbPath;
  final db = await openDatabase(
    databasePath!,
    readOnly: true,
    singleInstance: false,
  );
  final ret = await callback(db);
  await db.close();
  return ret;
}
