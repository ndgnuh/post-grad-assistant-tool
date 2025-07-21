import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

const prefKeys = (
  databasePath: 'database/path',
  databaseDirectory: 'database/directory',
);

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
      final isValidDatabaseFile = filePath.endsWith('.sqlite3') ||
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
