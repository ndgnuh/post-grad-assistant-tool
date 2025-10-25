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
    final db = await ref.watch(appDatabaseProvider.future);
    final stmt = db.phdCohort.select()
      ..orderBy([
        (x) => OrderingTerm(expression: x.cohort, mode: OrderingMode.desc),
      ]);
    final result = await stmt.map((c) => c.cohort).get();
    return result;
  }
}

class PhdStudentByIdNotifier extends AsyncNotifier<PhdStudentData?> {
  final int studentId;
  PhdStudentByIdNotifier(this.studentId);

  @override
  Future<PhdStudentData?> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    return await db.managers.phdStudent
        .filter((student) => student.id.equals(studentId))
        .getSingleOrNull();
  }
}

class PhdStudentIdsNotifier extends AsyncNotifier<List<int>> {
  final String? cohort;

  PhdStudentIdsNotifier({this.cohort});

  @override
  Future<List<int>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final stmt = db.phdStudent.select();

    switch (cohort) {
      case String cohort:
        stmt.where((p) => p.cohort.equals(cohort));
    }

    stmt.orderBy([
      (s) => OrderingTerm(expression: s.cohort, mode: OrderingMode.desc),
      (s) => OrderingTerm(expression: s.admissionId, mode: OrderingMode.asc),
    ]);

    final ids = await stmt.map((p) => p.id).get();

    return ids.whereType<int>().toList();
  }
}

class PhdStudentIdsByCohortNotifier extends AsyncNotifier<List<int>> {
  final String cohort;
  PhdStudentIdsByCohortNotifier(this.cohort);

  @override
  Future<List<int>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final query = db.managers.phdStudent
        .filter((p) => p.cohort.equals(cohort))
        .map((p) => p.id);
    final result = await query.get();
    return result.whereType<int>().toList()..sort();
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
    required String majorSpecialization,
  }) async {
    final db = await ref.watch(appDatabaseProvider.future);
    final companion = PhdStudentCompanion.insert(
      // Admission information
      admissionId: admissionId,
      cohort: cohort,

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
      majorSpecialization: Value(majorSpecialization),
    );

    final stmt = db.phdStudent.insert();
    await stmt.insert(companion);

    ref.invalidate(phdStudentIdsByCohortProvider);
  }

  @override
  build() {}
}
