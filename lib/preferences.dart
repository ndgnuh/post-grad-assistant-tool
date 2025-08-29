import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

part 'preferences.g.dart';

const dbPreferenceTable = "preference";

const prefKeys = (
  databasePath: 'database/path',
  databaseDirectory: 'database/directory',
  darkMode: 'theme/dark-mode',
  textScaleFactor: 'ui/text-scale-factor',
);

final textScaleFactorProvider = FutureProvider<double>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(prefKeys.textScaleFactor) ?? 1.0;
});

final isDarkModeProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(prefKeys.darkMode) ?? false;
});

final databasePathProvider = FutureProvider<String?>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(prefKeys.databasePath);
});

Future<String?> _loadPreferenceFromDatabase(String? dbPath, String key) async {
  if (dbPath == null) return null;

  final db = await openDatabase(dbPath, readOnly: true, singleInstance: false);
  final rows = await db.query(
    dbPreferenceTable,
    columns: ["value"],
    where: "key = ?",
    whereArgs: [key],
  );

  if (rows.isEmpty) {
    return null;
  } else {
    return rows.first["value"] as String;
  }
}

FutureOr<void> _savePreferenceToDatabase(
  String? dbPath,
  String key,
  String value,
) async {
  if (dbPath == null) throw Exception("Database path is not set");

  final db = await openDatabase(dbPath);
  await db.insert(
    dbPreferenceTable,
    {"key": key, "value": value},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

@riverpod
class MyDivision extends _$MyDivision {
  static const key = "my-division";
  @override
  Future<String> build() async {
    final dbPath = await ref.watch(databasePathProvider.future);
    return (await _loadPreferenceFromDatabase(dbPath, key)) ??
        "Khoa Toán - Tin";
  }

  Future setDivision(String division) async {
    final dbPath = await ref.watch(databasePathProvider.future);
    await _savePreferenceToDatabase(dbPath, key, division);
    state = AsyncData(division);
    ref.invalidateSelf();
  }
}

@riverpod
class MyName extends _$MyName {
  static const dbKey = "my-name";
  @override
  Future<String?> build() async {
    final dbPath = await ref.watch(databasePathProvider.future);
    return _loadPreferenceFromDatabase(dbPath, dbKey);
  }

  Future setName(String name) async {
    final dbPath = await ref.watch(databasePathProvider.future);
    await _savePreferenceToDatabase(dbPath, dbKey, name);
    state = AsyncData(name);
    ref.invalidateSelf();
  }
}

Future<bool> getDarkMode() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(prefKeys.darkMode) ?? false;
}

Future<void> setDarkMode(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(prefKeys.darkMode, value);
}

Future<String?> getDatabaseDirectory() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(prefKeys.databaseDirectory);
}

Future<String?> getDatabasePath() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(prefKeys.databasePath);
}

Future<String?> selectDatabaseDirectory() async {
  final directory = await FilePicker.platform.getDirectoryPath(
    dialogTitle: "Chọn thư mục cơ sở dữ liệu",
  );

  // Find first file with name .sqlite3, .db, or .sqlite in the directory
  if (directory != null) {
    final dir = Directory(directory);
    final files = dir.listSync();
    for (final file in files) {
      // Check if the file is a file
      if (file is! File) continue;

      // Check if the file is a database file
      final filePath = file.path;
      final isValidDatabaseFile =
          filePath.endsWith('.sqlite3') ||
          filePath.endsWith('.db') ||
          filePath.endsWith('.sqlite');

      // Assign the first valid database file found
      if (isValidDatabaseFile) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(prefKeys.databasePath, file.path);
        await prefs.setString(prefKeys.databaseDirectory, directory);
        return file.path;
      }
    }
  }

  // If no valid database file is found, return null
  return null;
}

Future<bool> getHealthCheck() async {
  // Check if the database path is set and permissions are granted
  if (await getDatabasePath() == null) {
    return false;
  }

  // Check if the manage external storage permission is granted
  // Only on Android and iOS
  if (Platform.isAndroid || Platform.isIOS) {
    final granted = await Permission.manageExternalStorage.isGranted;
    if (!granted) {
      return false;
    }
  }

  return true;
}
