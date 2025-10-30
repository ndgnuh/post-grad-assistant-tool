import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

final appDataDirectoryProvider = AsyncNotifierProvider(
  () => StringPreferenceNotifier("app-data-directory-path"),
);

final mainDatabasePathProvider = AsyncNotifierProvider(
  () => StringPreferenceNotifier("main-database-path"),
);

final fileDatabasePathProvider = AsyncNotifierProvider(
  () => StringPreferenceNotifier("file-database-path"),
);

final isDarkModeProvider = AsyncNotifierProvider(
  () => BoolPreferenceNotifier("is-dark-mode", defaultValue: false),
);

final storagePermissionGrantedProvider = AsyncNotifierProvider(
  StoragePermissionGrantedNotifier.new,
);

sealed class PreferenceNotifier<T> extends AsyncNotifier<T?> {
  final String key;
  final T? defaultValue;
  PreferenceNotifier(this.key, {this.defaultValue});

  void setFunction(SharedPreferences prefs, T value);
  void clearFunction(SharedPreferences prefs);

  @override
  Future<T?> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? prefs.get(key) as T : defaultValue;
  }

  Future<void> set(T value) async {
    final prefs = await SharedPreferences.getInstance();
    setFunction(prefs, value);
    state = AsyncValue.data(value);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    clearFunction(prefs);
    state = AsyncValue.data(null);
  }
}

class StringPreferenceNotifier extends PreferenceNotifier<String> {
  StringPreferenceNotifier(super.key, {super.defaultValue});

  @override
  void setFunction(SharedPreferences prefs, String value) {
    prefs.setString(key, value);
  }

  @override
  void clearFunction(SharedPreferences prefs) {
    prefs.remove(key);
  }
}

class BoolPreferenceNotifier extends PreferenceNotifier<bool> {
  BoolPreferenceNotifier(super.key, {super.defaultValue});

  @override
  void setFunction(SharedPreferences prefs, bool value) {
    prefs.setBool(key, value);
  }

  @override
  void clearFunction(SharedPreferences prefs) {
    prefs.remove(key);
  }
}

class StoragePermissionGrantedNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    // Invalid on desktop platforms
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return true;
    }

    final status1 = await Permission.storage.status;
    final status2 = await Permission.manageExternalStorage.status;
    return status1.isGranted || status2.isGranted;
  }

  Future<void> requestPermission() async {
    // Invalid on desktop platforms
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return;
    }

    final status = await Permission.storage.request();
    if (status.isDenied) {
      final manageStatus = await Permission.manageExternalStorage.request();
      if (manageStatus.isGranted) {
        state = AsyncValue.data(true);
      } else {
        state = AsyncValue.data(false);
      }
    }
    state = AsyncValue.data(true);
  }
}
