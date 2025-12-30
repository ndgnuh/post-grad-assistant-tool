import 'dart:typed_data';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../file_content_database.dart';
import '../db_v2_providers.dart';

const String pathKey = 'database-path';

/// Provide the main databsae of the app
final nullableMainDatabaseProvider = FutureProvider(
  (ref) async {
    final databasePath = await ref.watch(mainDatabasePathProvider.future);
    if (databasePath == null) return null;
    final db = AppDatabase.intialize(databasePath);
    return db;
  },
);

/// Provide the file content database of the app
/// It does not throw errors so that we can handle uninitialized state
final nullableFileDatabaseProvider = FutureProvider(
  (ref) async {
    final databasePath = await ref.watch(
      fileDatabasePathProvider.future,
    );
    if (databasePath == null) return null;
    return FileContentDatabase.initialize(databasePath);
  },
);

/// Provide the main databsae of the app, ensure it is initialized
final mainDatabaseProvider = FutureProvider<AppDatabase>(
  (ref) async {
    final db = await ref.watch(nullableMainDatabaseProvider.future);
    assert(db != null, 'Main database is not initialized!');
    return db!;
  },
);

/// Provide the file databsae of the app, ensure it is initialized
final fileDatabaseProvider = FutureProvider<FileContentDatabase>(
  (ref) async {
    final db = await ref.watch(nullableFileDatabaseProvider.future);
    assert(db != null, 'File content database is not initialized!');
    return db!;
  },
);

/// This is for convenience of working with database
/// We dont want to check and throw the database not initialized error
/// every time we want to access the database
class DatabasePathNotifier extends AsyncNotifier<String?> {
  final String name;
  DatabasePathNotifier(this.name);

  String get key => "database-path/$name";

  @override
  Future<String?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final databasePath = prefs.getString(key);
    return databasePath;
  }

  Future<void> setDatabasePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, path);
    ref.invalidateSelf();
  }
}
