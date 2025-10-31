import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final phdCohortsProvider = AsyncNotifierProvider(
  PhdCohorts.new,
);

final phdStudentsMutationProvider = NotifierProvider(
  PhdStudentsMutationNotifier.new,
);

final phdStudentByIdProvider = AsyncNotifierProvider.family(
  PhdStudentByIdNotifier.new,
);

final phdStudentIdsProvider = AsyncNotifierProvider(
  PhdStudentIdsNotifier.new,
);

final phdStudentIdsByCohortProvider = AsyncNotifierProvider.family(
  (String cohort) => PhdStudentIdsNotifier(cohort: cohort),
);

class PhdCohorts extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.phdCohort.select()
      ..orderBy([
        (x) => OrderingTerm(expression: x.cohort, mode: OrderingMode.desc),
      ]);
    final result = await stmt.map((c) => c.cohort).get();
    return result;
  }
}

class PhdStudentByIdNotifier extends AsyncNotifier<PhdStudentData> {
  final int studentId;
  PhdStudentByIdNotifier(this.studentId);

  @override
  Future<PhdStudentData> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final student = await db.managers.phdStudent
        .filter((student) => student.id.equals(studentId))
        .getSingleOrNull();
    assert(student != null, 'PhD Student with ID $studentId not found');
    return student!;
  }

  Future<void> _update(PhdStudentCompanion companion) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.phdStudent.update()
      ..where((student) => student.id.equals(studentId));
    final updated = await stmt.writeReturning(companion);
    state = AsyncData(updated.first);
  }

  Future<void> setAdmissionCouncil({
    int? presidentId,
    int? secretaryId,
    int? member1Id,
    int? member2Id,
    int? member3Id,
  }) async {
    absentIfNull(int? value) =>
        value == null ? Value<int?>.absent() : Value(value);

    _update(
      PhdStudentCompanion(
        admissionPresidentId: absentIfNull(presidentId),
        admissionSecretaryId: absentIfNull(secretaryId),
        admission1stMemberId: absentIfNull(member1Id),
        admission2ndMemberId: absentIfNull(member2Id),
        admission3rdMemberId: absentIfNull(member3Id),
      ),
    );
  }
}

class PhdStudentIdsNotifier extends AsyncNotifier<List<int>> {
  final String? cohort;

  PhdStudentIdsNotifier({this.cohort});

  @override
  Future<List<int>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.phdStudent.select();

    switch (cohort) {
      case String cohort:
        stmt.where((p) => p.cohort.equals(cohort));
    }

    stmt.orderBy([
      (s) => OrderingTerm(expression: s.cohort, mode: OrderingMode.desc),
      (s) => OrderingTerm(expression: s.status, mode: OrderingMode.asc),
      (s) => OrderingTerm(expression: s.admissionId, mode: OrderingMode.asc),
    ]);

    final ids = await stmt.map((p) => p.id).get();

    return ids.whereType<int>().toList();
  }
}

class PhdStudentsMutationNotifier extends Notifier<void> {
  Future<void> addPhdStudent({
    // Admisison information
    required String admissionId,
    required String cohort,

    // Basic information
    required String name,
    required Gender gender,
    required DateTime dateOfBirth,
    required String placeOfBirth,

    // Contact information
    required String phone,
    required String personalEmail,

    // Academic information
    required String thesis,
    required int supervisorId,
    required int? secondarySupervisorId,
    required PhdSpecialization majorSpecialization,
  }) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final companion = PhdStudentCompanion.insert(
      // Admission information
      admissionId: admissionId,
      cohort: cohort,
      status: StudentStatus.admission,

      // Basic information
      name: name,
      gender: Value(gender),
      dateOfBirth: Value(dateOfBirth),
      placeOfBirth: Value(placeOfBirth),
      phone: phone,
      personalEmail: personalEmail,

      // Academic information
      thesis: thesis,
      supervisorId: supervisorId,
      secondarySupervisorId: Value(secondarySupervisorId),
      majorSpecialization: majorSpecialization,
    );

    final stmt = db.phdStudent.insert();
    await stmt.insert(companion);

    ref.invalidate(phdStudentIdsByCohortProvider);
  }

  @override
  build() {}
}
