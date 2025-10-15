import 'package:drift_flutter/drift_flutter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../drift_orm.dart';

const String pathKey = 'database-path';

final databasePathProvider = AsyncNotifierProvider(
  DatabasePathNotifier.new,
);

final driftDatabaseProvider = AsyncNotifierProvider(
  DatabaseNotifier.new,
);

final nullableDatabaseProvider = AsyncNotifierProvider(
  NullableDatabaseNotifier.new,
);

class DatabaseNotifier extends AsyncNotifier<MyDriftDatabase> {
  @override
  Future<MyDriftDatabase> build() async {
    final db = await ref.watch(nullableDatabaseProvider.future);
    if (db == null) {
      throw Exception('Database is not initialized!');
    }
    return db;
  }
}

/// This is for convenience of working with database
/// We dont want to check and throw the database not initialized error
/// every time we want to access the database
class DatabasePathNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final databasePath = prefs.getString(pathKey);
    return databasePath;
  }

  Future<void> setDatabasePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(pathKey, path);
    ref.invalidateSelf();
  }
}

class NullableDatabaseNotifier extends AsyncNotifier<MyDriftDatabase?> {
  @override
  Future<MyDriftDatabase?> build() async {
    final dbPath = await ref.watch(databasePathProvider.future);
    if (dbPath == null) return null;

    final executor = driftDatabase(
      name: 'fami-caohoc-drift',
      native: DriftNativeOptions(
        databasePath: () => Future.value(dbPath),
      ),
    );
    return MyDriftDatabase(executor);
  }
}
