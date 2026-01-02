import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../../custom_widgets.dart' show UserFacingException;
import '../db_v2_providers.dart';
import '../business_enums.dart';

// "Free" providers
// ================
// These providers do not depend on other providers

final myIdProvider = AsyncNotifierProvider(
  IntDatabasePreferenceNotifier.myId,
);

/// Quản lý trực tiếp
final mySupervisorIdProvider = AsyncNotifierProvider(
  IntDatabasePreferenceNotifier.mySupervisorId,
);

/// Chuyên viên xử lý học tập
final mscStudySpecialistIdProvider = AsyncNotifierProvider(
  IntDatabasePreferenceNotifier.mscStudySpecialistId,
);

/// Chuyên viên xử lý tuyển sinh
final mscAdmissionSpecialistIdProvider = AsyncNotifierProvider(
  IntDatabasePreferenceNotifier.mscAdmissionSpecialistId,
);

/// Chuyên viên xử lý tác vụ khóa lẻ
final mscOddCohortSpecialistIdProvider = AsyncNotifierProvider(
  IntDatabasePreferenceNotifier.mscOddCohortSpecialistId,
);

/// Chuyên viên xử lý tác vụ khóa chẵn
final mscEvenCohortSpecialistIdProvider = AsyncNotifierProvider(
  IntDatabasePreferenceNotifier.mscEvenCohortSpecialistId,
);

/// Quy chế đào tạo
final regulationIdProvider = AsyncNotifierProvider.family(
  (DocumentArchetype archetype) {
    return IntDatabasePreferenceNotifier.regulation(archetype);
  },
);

class UnsetPreference implements Exception {
  String cause;
  UnsetPreference(this.cause);
}

// Dependent providers
// ===================

/// Provide the regulation document for a given archetype
final regulationProvider = StreamProvider.family(
  (Ref ref, DocumentArchetype archetype) async* {
    final id = await ref.watch(regulationIdProvider(archetype).future);
    if (id == null) {
      throw UserFacingException(
        "Chưa cài đặt quy chế cho loại văn bản ${archetype.label}",
      );
    }
    final document = await ref.watch(documentStreamProvider(id).future);
    yield document;
  },
);

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

  /// Chuyên viên xử lý học tập
  static IntDatabasePreferenceNotifier mscStudySpecialistId() =>
      .new("msc-study-specialist");

  /// Chuyên viên xử lý tuyển sinh
  static IntDatabasePreferenceNotifier mscAdmissionSpecialistId() =>
      .new("msc-admission-specialist");

  /// Chuyên viên xử lý tác vụ khóa lẻ
  static IntDatabasePreferenceNotifier mscOddCohortSpecialistId() =>
      .new("msc-odd-cohort-specialist");

  /// Chuyên viên xử lý tác vụ khóa chẵn
  factory IntDatabasePreferenceNotifier.mscEvenCohortSpecialistId() =>
      .new("msc-even-cohort-specialist");

  /// Các loại quy chế, văn bản mang tính chất quy định
  static IntDatabasePreferenceNotifier regulation(
    DocumentArchetype archetype,
  ) => .new("regulation-${archetype.value}");

  @override
  String? toSql(int value) => value.toString();

  @override
  int? fromSql(String? value) => int.tryParse(value ?? '');
}

class MscStudySpecialistNotifier extends StringDatabasePreferenceNotifier {
  MscStudySpecialistNotifier() : super("msc-study-specialist-email");
}
