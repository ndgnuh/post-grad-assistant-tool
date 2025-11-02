import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final myNameProvider = AsyncNotifierProvider(
  MyNameNotifier.new,
);

final myFalcutyProvider = AsyncNotifierProvider(
  MyFalcutyNotifier.new,
);

final mySupervisorIdProvider = AsyncNotifierProvider(
  MySupervisorIdNotifier.new,
);

Future<String?> _getPreference<T>(AppDatabase db, String key) async {
  final stmt = db.preference.select();
  stmt.where((p) => p.key.equals(key));
  final storedValue = await stmt.map((p) => p.value).getSingleOrNull();
  return storedValue;
}

sealed class DbPreferenceNotifier<T> extends AsyncNotifier<T?> {
  final String key;
  DbPreferenceNotifier(this.key);

  String? toSql(T value);
  T? fromSql(String? value);

  @override
  FutureOr<T?> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final rawValue = await _getPreference(db, key);
    return fromSql(rawValue);
  }

  Future<void> set(T value) async {
    final sqlValue = toSql(value);
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.preference.update();
    stmt.where((t) => t.key.equals(key));
    await stmt.write(
      PreferenceCompanion(value: Value(sqlValue)),
    );
    state = AsyncData(value);
  }
}

class StringDatabasePreferenceNotifier extends DbPreferenceNotifier<String> {
  StringDatabasePreferenceNotifier(super.key);

  @override
  String? toSql(String value) => value;

  @override
  String? fromSql(String? value) => value;
}

class IntDatabasePreferenceNotifier extends DbPreferenceNotifier<int> {
  IntDatabasePreferenceNotifier(super.key);

  @override
  String? toSql(int value) => value.toString();

  @override
  int? fromSql(String? value) => int.tryParse(value ?? '');
}

class MyNameNotifier extends StringDatabasePreferenceNotifier {
  MyNameNotifier() : super("my-name");
}

class MyFalcutyNotifier extends StringDatabasePreferenceNotifier {
  MyFalcutyNotifier() : super("my-falcuty");
}

class MscStudySpecialistNotifier extends StringDatabasePreferenceNotifier {
  MscStudySpecialistNotifier() : super("msc-study-specialist-email");
}

class MySupervisorIdNotifier extends IntDatabasePreferenceNotifier {
  MySupervisorIdNotifier() : super("my-supervisor-id");
}
