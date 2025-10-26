import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../drift_orm.dart';
import '../db_v2_providers.dart';

final myNameProvider = AsyncNotifierProvider(MyNameNotifier.new);
final myFalcutyProvider = AsyncNotifierProvider(MyFalcutyNotifier.new);
final isDarkModeProvider = AsyncNotifierProvider(IsDarkModeNotifier.new);

Future<String?> _getPreference<T>(AppDatabase db, _PreferenceKey key) async {
  final stmt = db.preference.select();
  stmt.where((p) => p.key.equals(key.key));
  final storedValue = await stmt.map((p) => p.value).getSingleOrNull();
  return storedValue ?? key.defaultValue;
}

sealed class _DbPreferenceNotifier<T> extends AsyncNotifier<T> {
  final _PreferenceKey key;
  _DbPreferenceNotifier(this.key);

  String? toSql(T value);
  T fromSql(String? value);

  @override
  FutureOr<T> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    return fromSql(await _getPreference(db, key));
  }

  Future<void> set(T value) async {
    final sqlValue = toSql(value);
    final db = await ref.watch(appDatabaseProvider.future);
    final stmt = db.preference.update();
    stmt.where((t) => t.key.equals(key.key));
    await stmt.write(
      PreferenceCompanion(value: Value(sqlValue)),
    );
    state = AsyncData(value);
  }
}

class MyNameNotifier extends _DbPreferenceNotifier<String?> {
  MyNameNotifier() : super(_PreferenceKey.myName);

  @override
  String? toSql(String? value) => value;

  @override
  String? fromSql(String? value) => value;
}

class MyFalcutyNotifier extends _DbPreferenceNotifier<String> {
  MyFalcutyNotifier() : super(_PreferenceKey.myFalcuty);

  @override
  String? toSql(String value) => value;

  @override
  String fromSql(String? value) => value ?? "Khoa Toán - Tin";
}

///  This is for database preference only...
enum _PreferenceKey {
  myName(key: 'my-name'),
  myFalcuty(key: 'my-falcuty', defaultValue: 'Khoa Toán - Tin'),
  currentPaymentPolicy(key: 'current-payment-policy');

  final String key;
  final String? defaultValue;
  const _PreferenceKey({
    required this.key,
    this.defaultValue,
  });
}

class IsDarkModeNotifier extends AsyncNotifier<bool> {
  final String key = 'is-dark-mode';
  @override
  FutureOr<bool> build() async {
    final pref = await SharedPreferences.getInstance();
    final value = pref.getBool(key);
    return value ?? false;
  }

  Future<void> set(bool newValue) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(key, newValue);
    state = AsyncData(newValue);
  }
}
