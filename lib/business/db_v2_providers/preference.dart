import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

// "Free" providers
// ================
// These providers do not depend on other providers

final myIdProvider = AsyncNotifierProvider(
  IntDatabasePreferenceNotifier.myId,
);

final mySupervisorIdProvider = AsyncNotifierProvider(
  IntDatabasePreferenceNotifier.mySupervisorId,
);

class UnsetPreference implements Exception {
  String cause;
  UnsetPreference(this.cause);
}

// Dependent providers
// ===================

/// Provide my data, just in case we need more than just my ID
final myDataProvider = _makeTeacherProvider(
  exceptionText: "Chưa cài định danh bản thân",
  provider: myIdProvider,
);

/// Provide my name directly
/// used a lot in emails and documents
final myNameProvider = FutureProvider((Ref ref) async {
  final myData = await ref.watch(myDataProvider.future);
  return myData.name;
});

/// Provide my faculty directly
/// used a lot in emails and documents
final myFacultyProvider = FutureProvider((Ref ref) async {
  final myData = await ref.watch(myDataProvider.future);
  return myData.falcuty;
});

/// Provide my supervisor's data
/// used in various places
final mySupervisorProvider = _makeTeacherProvider(
  exceptionText: "Chưa cài đặt ID quản lý trực tiếp",
  provider: mySupervisorIdProvider,
);

// Preferences implementation
// ==========================

/// Create provider for [TeacherData] from a id provider.
FutureProvider<TeacherData> _makeTeacherProvider({
  required String exceptionText,
  required AsyncNotifierProvider<AsyncNotifier<int?>, int?> provider,
}) {
  return FutureProvider((Ref ref) async {
    final id = await ref.watch(provider.future);
    if (id == null) {
      throw UnsetPreference(exceptionText);
    }
    final teacher = await ref.watch(teacherByIdProvider(id).future);
    return teacher;
  });
}

sealed class DbPreferenceNotifier<T> extends AsyncNotifier<T?> {
  final String key;
  DbPreferenceNotifier(this.key);

  String? toSql(T value);
  T? fromSql(String? value);

  @override
  FutureOr<T?> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.preference.select();
    stmt.where((p) => p.key.equals(key));

    if (ref.isFirstBuild) {
      stmt.watch().listen((event) {
        ref.invalidateSelf();
      });
    }

    final rawValue = await stmt.map((p) => p.value).getSingleOrNull();
    return fromSql(rawValue);
  }

  Future<void> set(T value) async {
    final sqlValue = toSql(value);
    final db = await ref.watch(mainDatabaseProvider.future);
    final companion = PreferenceCompanion(
      key: Value(key),
      value: Value(sqlValue),
    );
    db.preference.insertOnConflictUpdate(companion);
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

  static IntDatabasePreferenceNotifier myId() => .new("my-id");
  static IntDatabasePreferenceNotifier mySupervisorId() =>
      .new("my-supervisor-id");
  static IntDatabasePreferenceNotifier mscStudySpecialistId() =>
      .new("msc-study-specialist");
  static IntDatabasePreferenceNotifier mscAdmissionSpecialistId() =>
      .new("msc-admission-specialist");
  static IntDatabasePreferenceNotifier mscOddCohortSpecialistId() =>
      .new("msc-odd-cohort-specialist");
  static IntDatabasePreferenceNotifier mscEvenCohortSpecialistId() =>
      .new("msc-even-cohort-specialist");

  @override
  String? toSql(int value) => value.toString();

  @override
  int? fromSql(String? value) => int.tryParse(value ?? '');
}

class MscStudySpecialistNotifier extends StringDatabasePreferenceNotifier {
  MscStudySpecialistNotifier() : super("msc-study-specialist-email");
}
