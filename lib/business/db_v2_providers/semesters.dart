import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final semesterIdsProvider = AsyncNotifierProvider(
  SemesterIdsNotifier.new,
);

final semesterByIdProvider = AsyncNotifierProvider.family(
  SemesterByIdNotifier.new,
);

final previousSemesterProvider =
    FutureProvider.family<SemesterData?, SemesterData>(
      (ref, SemesterData semester) async {
        final db = await ref.watch(mainDatabaseProvider.future);
        final prev = await db.previousSemester(semester).getSingleOrNull();
        return prev;
      },
    );

class SemesterIdsNotifier extends AsyncNotifier<List<String>> {
  @override
  FutureOr<List<String>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final semesters = await db.managers.semester.map((h) => h.id).get();
    return semesters;
  }

  Future<void> addSemester({
    required String id,
    required DateTime registrationBeginDate,
    required DateTime registrationEndDate,
    required DateTime classBeginDate,
    required DateTime classEndDate,
    required DateTime gradeSubmissionDeadline,
  }) async {
    final db = await ref.read(mainDatabaseProvider.future);
    final sequences = await db.semester.select().map((c) => c.sequence).get();
    final maxSequence = sequences.isEmpty
        ? 0
        : sequences.reduce((a, b) => a > b ? a : b);

    final companion = SemesterCompanion.insert(
      id: id,
      registrationBeginDate: registrationBeginDate,
      registrationEndDate: registrationEndDate,
      classBeginDate: classBeginDate,
      classEndDate: classEndDate,
      gradeSubmissionDeadline: gradeSubmissionDeadline,
      sequence: Value(maxSequence + 1),
    );

    db.semester.insertReturning(companion);
    state = AsyncValue.data([...state.value!, id]);
  }
}

class SemesterByIdNotifier extends AsyncNotifier<SemesterData> {
  final String semesterId;
  SemesterByIdNotifier(this.semesterId);

  @override
  FutureOr<SemesterData> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.semester.select();
    stmt.where((s) => s.id.equals(semesterId));
    final semester = await stmt.getSingleOrNull();
    assert(semester != null, "Semester with ID $semesterId not found");
    return semester as SemesterData;
  }
}
