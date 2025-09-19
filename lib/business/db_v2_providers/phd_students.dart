import 'package:riverpod/riverpod.dart';

import '../drift_orm.dart';
// import './../db_v2_providers.dart';

final phdCohortsProvider = AsyncNotifierProvider(
  PhdCohorts.new,
);
final phdStudentByIdProvider = AsyncNotifierProvider.family(
  PhdStudentById.new,
);
final phdStudentsByCohortProvider = AsyncNotifierProvider.family(
  PhdStudentsByCohort.new,
);
final phdStudentIdsByCohortProvider = AsyncNotifierProvider.family(
  PhdStudentIdsByCohortNotifier.new,
);

class PhdCohorts extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.managers.phdStudent.map((p) => p.cohort);
    final result = await query.get();
    return result.toSet().toList()..sort();
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
