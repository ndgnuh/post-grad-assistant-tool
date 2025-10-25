import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final myNameProvider = FutureProvider<String?>((ref) async {
  final db = await ref.watch(appDatabaseProvider.future);
  return _getPreference(db, _PreferenceKey.myName);
});

final myFalcutyProvider = FutureProvider<String>((ref) async {
  final db = await ref.watch(appDatabaseProvider.future);
  final falcuty = await _getPreference(db, _PreferenceKey.myFalcuty);
  return falcuty as String; // has fallback value
});

Future<String?> _getPreference<T>(AppDatabase db, _PreferenceKey key) async {
  final stmt = db.preference.select();
  stmt.where((p) => p.key.equals(key.key));
  final storedValue = await stmt.map((p) => p.value).getSingleOrNull();
  return storedValue ?? key.defaultValue;
}

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
