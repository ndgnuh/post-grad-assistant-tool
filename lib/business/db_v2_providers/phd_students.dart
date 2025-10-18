import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final phdCohortsProvider = AsyncNotifierProvider(
  PhdCohorts.new,
);
final phdStudentByIdProvider = AsyncNotifierProvider.family(
  PhdStudentById.new,
);
final phdStudentIdsByCohortProvider = AsyncNotifierProvider.family(
  (String cohort) => PhdStudentIds(cohort: cohort),
);

class PhdCohorts extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final stmt = db.phdCohort.select();
    final result = await stmt.map((c) => c.cohort).get();
    return result;
  }
}

class PhdStudentById extends AsyncNotifier<PhdStudentData?> {
  final int studentId;
  PhdStudentById(this.studentId);

  @override
  Future<PhdStudentData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    return await db.managers.phdStudent
        .filter((student) => student.id.equals(studentId))
        .getSingleOrNull();
  }
}

class PhdStudentIds extends AsyncNotifier<List<int>> {
  final String? cohort;

  PhdStudentIds({this.cohort});

  @override
  Future<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final stmt = db.managers.phdStudent;

    if (cohort != null) {
      stmt.filter((p) => p.cohort.equals(cohort!));
    }

    final ids = await stmt.map((p) => p.id).get();

    return ids.whereType<int>().toList();
  }
}

class PhdStudentIdsByCohortNotifier extends AsyncNotifier<List<int>> {
  final String cohort;
  PhdStudentIdsByCohortNotifier(this.cohort);

  @override
  Future<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.managers.phdStudent
        .filter((p) => p.cohort.equals(cohort))
        .map((p) => p.id);
    final result = await query.get();
    return result.whereType<int>().toList()..sort();
  }
}

class PhdStudentMutationNotifier extends Notifier<void> {
  Future<void> addPhdStudent({
    // Admisison information
    required String admissionId,
    required String cohort,

    // Basic information
    required String name,
    required Gender gender,
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
    final db = await ref.watch(driftDatabaseProvider.future);
    final companion = PhdStudentCompanion.insert(
      // Admission information
      admissionId: admissionId,
      cohort: cohort,

      // Basic information
      name: name,
      gender: Value(gender),
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

    ref.invalidate(phdStudentIdsByCohortProvider(cohort));
  }

  @override
  build() {}
}

class PhdStudentsByCohort extends AsyncNotifier<List<PhdStudentData>> {
  final String cohort;
  PhdStudentsByCohort(this.cohort);

  @override
  Future<List<PhdStudentData>> build() async {
    final ids = await ref.watch(phdStudentIdsByCohortProvider(cohort).future);
    final students = <PhdStudentData>[];
    for (final id in ids) {
      final student = await ref.watch(phdStudentByIdProvider(id).future);
      if (student != null) {
        students.add(student);
      }
    }
    return students;
  }
}
