import 'package:drift/drift.dart';

import '../../../business/db_v2_providers.dart';

extension AdmissionStudentDao on AppDatabase {
  /// List students
  Stream<List<StudentData>> listAdmissionStudents({
    required final StudentStatus? status,
  }) {
    final stmt = select(student);

    // Filter in admission
    stmt.where(
      (r) => r.status.isInValues([
        StudentStatus.admission,
        StudentStatus.delayedAdmission,
        StudentStatus.admissionFailed,
      ]),
    );

    if (status != null) {
      stmt.where((s) => s.status.equals(status.value));
    }

    return stmt.watch();
  }
}

extension AdmissionTeacherDao on AppDatabase {
  /// Watch the list of admission council
  Stream<List<AdmissionCouncilData>> watchAdmissionCouncils() {
    final stmt = select(admissionCouncil);
    stmt.orderBy(
      [(r) => OrderingTerm.desc(r.year)],
    );
    return stmt.watch();
  }

  /// Add or update new council in the admission council
  /// If [councilId] is present, update the council, otherwise,
  /// pass [null] to create new council.
  Future<void> updateAdmissionCouncil({
    required final int? councilId,
    required final String year,
    required final TeacherData president,
    required final TeacherData secretary,
    required final TeacherData member1,
    required final TeacherData member2,
    required final TeacherData member3,
    required final String decisionId,
    required final DateTime decisionDate,
  }) async {
    final companion = AdmissionCouncilCompanion.insert(
      id: switch (councilId) {
        int id => Value(id),
        null => Value.absent(),
      },
      year: year,
      presidentId: president.id,
      secretaryId: secretary.id,
      member1Id: member1.id,
      member2Id: member2.id,
      member3Id: member3.id,
      establishmentDecisionId: decisionId,
      establishmentDecisionDate: decisionDate,
    );
    await into(admissionCouncil).insertOnConflictUpdate(companion);
  }
}
