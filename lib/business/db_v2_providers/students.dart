import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final admissionStudentIdsProvider = AsyncNotifierProvider(
  AdmissionStudentIdsNotifier.new,
);

final delayedAdmissionStudentIdsProvider = AsyncNotifierProvider(
  DelayedAdmissionStudentIdsNotifier.new,
);

final integratedAdmissionIdsProvider = AsyncNotifierProvider(
  () => FilteredAdmissionIdsNotifier(AdmissionType.integrated),
);

final interviewAdmissionIdsProvider = AsyncNotifierProvider(
  () => FilteredAdmissionIdsNotifier(AdmissionType.interview),
);

final studentByIdProvider = AsyncNotifierProvider.family(
  StudentByIdNotifier.new,
);

final studentIdsByCohortProvider = AsyncNotifierProvider.family(
  (CohortData cohort) => StudentIdsNotifier(cohort: cohort),
);

final studentIdsBySearch = AsyncNotifierProvider.family(
  (CohortData cohort) => StudentIdsNotifier(cohort: cohort),
);

final studentMutationProvider = NotifierProvider.family(
  StudentMutationNotifier.new,
);

class AdmissionStudentIdsNotifier extends AsyncNotifier<List<int>> {
  @override
  FutureOr<List<int>> build() async {
    final interviewIds = await ref.watch(
      interviewAdmissionIdsProvider.future,
    );
    final integratedIds = await ref.watch(
      integratedAdmissionIdsProvider.future,
    );
    return interviewIds + integratedIds;
  }
}

class DelayedAdmissionStudentIdsNotifier extends AsyncNotifier<List<int>> {
  @override
  FutureOr<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.hocVien.select()
      ..where((tbl) => tbl.status.equals(StudentStatus.delayedAdmission.value));
    final students = await query.get();
    return students.map((e) => e.id).toList();
  }
}

class FilteredAdmissionIdsNotifier extends AsyncNotifier<List<int>> {
  final AdmissionType admissionType;
  FilteredAdmissionIdsNotifier(this.admissionType);

  @override
  FutureOr<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.hocVien.select()
      ..orderBy([
        (tbl) => OrderingTerm(
          expression: tbl.admissionId,
          mode: OrderingMode.asc,
        ),
      ])
      ..where(
        (tbl) =>
            tbl.status.equals(StudentStatus.admission.value) &
            tbl.admissionType.equals(admissionType.value),
      );
    final students = await query.get();
    return students.map((e) => e.id).toList();
  }
}

class StudentByIdNotifier extends AsyncNotifier<StudentData?> {
  final int studentId;
  StudentByIdNotifier(this.studentId);

  @override
  FutureOr<StudentData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.hocVien.select()..where((tbl) => tbl.id.equals(studentId));
    return await query.getSingleOrNull();
  }

  Future<void> updateStudent({
    String? personalEmail,
    String? schoolEmail,
    String? managementId,
    String? phoneNumber,
    StudentStatus? status,
  }) async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final stmt = db.hocVien.update()..where((tbl) => tbl.id.equals(studentId));
    await stmt.write(
      StudentCompanion(
        personalEmail: personalEmail != null
            ? Value(personalEmail)
            : Value.absent(),
        schoolEmail: schoolEmail != null ? Value(schoolEmail) : Value.absent(),
        studentId: managementId != null ? Value(managementId) : Value.absent(),
        status: status != null ? Value(status) : Value.absent(),
        phone: phoneNumber != null ? Value(phoneNumber) : Value.absent(),
      ),
    );
    ref.invalidateSelf();
  }

  Future<void> updateSchoolEmail(String? email) => updateStudent(
    schoolEmail: email,
  );

  Future<void> updatePersonalEmail(String? email) => updateStudent(
    personalEmail: email,
  );

  Future<void> updateManagementId(String? id) => updateStudent(
    managementId: id,
  );

  Future<void> updatePhoneNumber(String? phone) => updateStudent(
    phoneNumber: phone,
  );

  Future<void> updateStatus(StudentStatus? status) => updateStudent(
    status: status,
  );

  Future<void> markAsGraduated() => updateStudent(
    status: StudentStatus.graduated,
  );

  Future<void> markAsDroppedOut() => updateStudent(
    status: StudentStatus.quit,
  );

  Future<void> markAsNormal() => updateStudent(
    status: StudentStatus.studying,
  );
}

class StudentIdsNotifier extends AsyncNotifier<List<int>> {
  final CohortData? cohort;
  final String? searchQuery;
  final AdmissionCouncilData? admissionCouncil;

  StudentIdsNotifier({
    this.cohort,
    this.searchQuery,
    this.admissionCouncil,
  });

  @override
  FutureOr<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final stmt = db.student.select();

    switch (admissionCouncil) {
      case AdmissionCouncilData council:
        stmt.where(
          (t) =>
              t.admissionCouncilId.equals(council.id) &
              t.admissionType.equals(AdmissionType.interview.value) &
              t.status.isNotValue(StudentStatus.delayedAdmission.value),
        );
    }

    switch (cohort) {
      case CohortData cohort:
        stmt.where((t) => t.cohort.equals(cohort.cohort));
    }

    switch (searchQuery) {
      case String searchQuery:
        stmt.where(
          (t) =>
              t.name.contains(searchQuery) |
              t.studentId.contains(searchQuery) |
              t.cohort.contains(searchQuery) |
              t.personalEmail.contains(searchQuery),
        );
    }

    stmt.orderBy(
      [
        (Student s) => OrderingTerm(
          expression: s.status,
          mode: OrderingMode.asc,
        ),
      ],
    );

    return await stmt.map((t) => t.id).get();
  }
}

class StudentMutationNotifier extends Notifier<void> {
  final int studentId;
  StudentMutationNotifier(this.studentId);

  @override
  void build() {}

  Future<void> enroll({
    required String cohortId,
    required String studentId,
    required String schoolEmail,
    required int admissionCouncilId,
  }) async {
    final student = await ref.watch(studentByIdProvider(this.studentId).future);
    if (student == null) {
      throw Exception('Student not found');
    }

    final db = await ref.watch(driftDatabaseProvider.future);
    final stmt = db.hocVien.update()..where((t) => t.id.equals(this.studentId));
    await stmt.write(
      StudentCompanion(
        cohort: Value(cohortId),
        studentId: Value(studentId),
        schoolEmail: Value(schoolEmail),
        admissionCouncilId: Value(admissionCouncilId),
        status: Value(StudentStatus.normal),
      ),
    );

    ref.invalidate(studentByIdProvider(this.studentId));
    switch (student.admissionType) {
      case AdmissionType.integrated:
        ref.invalidate(integratedAdmissionIdsProvider);
      case AdmissionType.interview:
        ref.invalidate(interviewAdmissionIdsProvider);
      default:
    }
  }

  Future<void> playPauseAdmission() async {
    final student = await ref.read(studentByIdProvider(studentId).future);
    if (student == null) {
      throw Exception('Student not found');
    }

    final nextStatus = switch (student.status) {
      StudentStatus.admission => StudentStatus.delayedAdmission,
      StudentStatus.delayedAdmission => StudentStatus.admission,
      _ => throw Exception('Invalid student status for toggling admission'),
    };

    final db = await ref.read(driftDatabaseProvider.future);
    final stmt = db.student.update()
      ..where((student) => student.id.equals(studentId));
    await stmt.write(
      HocVienCompanion(
        status: Value(nextStatus),
      ),
    );

    ref.invalidate(studentByIdProvider(studentId));
    ref.invalidate(delayedAdmissionStudentIdsProvider);
    switch (student.admissionType) {
      case AdmissionType.integrated:
        ref.invalidate(integratedAdmissionIdsProvider);
      case AdmissionType.interview:
        ref.invalidate(interviewAdmissionIdsProvider);
      default:
    }
  }
}
