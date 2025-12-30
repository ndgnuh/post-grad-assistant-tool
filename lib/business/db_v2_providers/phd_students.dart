import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final phdAdmissionPaymentPolicyByIdProvider = FutureProvider.family((
  ref,
  int policyId,
) async {
  final db = await ref.watch(mainDatabaseProvider.future);
  final stmt = db.phdAdmissionPaymentPolicy.select()
    ..where((p) => p.id.equals(policyId));
  final policy = stmt.getSingle();
  return policy;
});

final phdCohortsProvider = FutureProvider<List<PhdCohortData>>(
  (Ref ref) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.phdCohort.select()
      ..orderBy([
        (x) => OrderingTerm(expression: x.cohort, mode: OrderingMode.desc),
      ]);

    if (ref.isFirstBuild) {
      stmt.watch().listen((_) {
        ref.invalidateSelf();
      });
    }

    final result = await stmt.get();
    return result;
  },
);

final phdCohortByIdProvider = FutureProvider.family((
  ref,
  String cohortId,
) async {
  final db = await ref.watch(mainDatabaseProvider.future);
  final stmt = db.phdCohort.select()..where((c) => c.cohort.equals(cohortId));

  if (ref.isFirstBuild) {
    stmt.watchSingleOrNull().listen((_) {
      ref.invalidateSelf();
    });
  }

  final cohort = await stmt.getSingleOrNull();
  assert(cohort != null, 'PhD Cohort with ID $cohortId not found');
  return cohort;
});

final phdStudentByIdProvider = AsyncNotifierProvider.family(
  PhdStudentByIdNotifier.new,
);

final phdStudentIdsProvider = AsyncNotifierProvider(
  PhdStudentIdsNotifier.new,
);

final phdStudentIdsByCohortProvider = AsyncNotifierProvider.family(
  (PhdCohortData cohort) => PhdStudentIdsNotifier(cohort: cohort),
);

class PhdStudentByIdNotifier extends AsyncNotifier<PhdStudentData> {
  final int studentId;
  PhdStudentByIdNotifier(this.studentId);

  @override
  Future<PhdStudentData> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.managers.phdStudent.filter(
      (student) => student.id.equals(studentId),
    );

    if (ref.isFirstBuild) {
      stmt.watch().listen((_) {
        ref.invalidateSelf();
      });
    }

    final student = await stmt.getSingleOrNull();
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
  final String? searchText;
  final PhdCohortData? cohort;
  final PaymentStatus? paymentStatus;
  final List<OrderingTerm Function(PhdStudent)>? orderBy;

  PhdStudentIdsNotifier({
    this.searchText,
    this.cohort,
    this.paymentStatus,
    this.orderBy,
  });

  @override
  Future<List<int>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.searchPhdStudents(
      searchText: searchText,
      cohort: cohort,
      admissionPaymentStatus: paymentStatus,
      orderBy: orderBy,
    );

    if (ref.isFirstBuild) {
      stmt.watch().listen((_) {
        ref.invalidateSelf();
      });
    }

    final ids = await stmt.map((s) => s.id).get();
    return ids;
  }
}

// class PhdStudentsMutationNotifier extends Notifier<void> {
//   Future<void> addPhdStudent({
//     // Admisison information
//     required String admissionId,
//     required String cohort,
//
//     // Basic information
//     required String name,
//     required Gender gender,
//     required DateTime dateOfBirth,
//     required String placeOfBirth,
//
//     // Contact information
//     required String phone,
//     required String personalEmail,
//
//     // Academic information
//     required String thesis,
//     required int supervisorId,
//     required int? secondarySupervisorId,
//     required PhdSpecialization majorSpecialization,
//   }) async {
//     final db = await ref.watch(mainDatabaseProvider.future);
//     final companion = PhdStudentCompanion.insert(
//       // Admission information
//       admissionId: admissionId,
//       cohort: cohort,
//       status: StudentStatus.admission,
//
//       // Basic information
//       name: name,
//       gender: Value(gender),
//       dateOfBirth: Value(dateOfBirth),
//       placeOfBirth: Value(placeOfBirth),
//       phone: phone,
//       personalEmail: personalEmail,
//
//       // Academic information
//       thesis: thesis,
//       supervisorId: supervisorId,
//       secondarySupervisorId: Value(secondarySupervisorId),
//       majorSpecialization: majorSpecialization,
//     );
//
//     final stmt = db.phdStudent.insert();
//     await stmt.insert(companion);
//
//     ref.invalidate(phdStudentIdsByCohortProvider);
//   }
//
//   @override
//   build() {}
// }
