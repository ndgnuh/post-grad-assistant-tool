part of '../main_database.dart';

extension ThesisDao on AppDatabase {
  /// Search theses by title, teacher and student name
  SimpleSelectStatement<Thesis, ThesisData> searchTheses({
    String? searchText,
  }) {
    final stmt = thesis.select();

    switch (searchText?.trim()) {
      case String searchText:
        final stmtTeacher = selectOnly(teacher)
          ..where(teacher.name.contains(searchText))
          ..addColumns([teacher.id]);

        final stmtStudent = selectOnly(student)
          ..where(student.name.contains(searchText))
          ..addColumns([student.id]);

        stmt.where(
          (t) =>
              t.vietnameseTitle.contains(searchText) |
              t.englishTitle.contains(searchText) |
              t.studentId.isInQuery(stmtStudent) |
              t.supervisorId.isInQuery(stmtTeacher),
        );
    }

    return stmt;
  }

  Future<void> updateThesis({
    required int id,
    String? vietnameseTitle,
    String? englishTitle,
    int? secondarySupervisorId,
    int? supervisorId,
    int? presidentId,
    int? firstReviewerId,
    int? secondReviewerId,
    int? secretaryId,
    int? memberId,
  }) async {
    final companion = ThesisCompanion(
      vietnameseTitle: valueOrAbsent(vietnameseTitle),
      englishTitle: valueOrAbsent(englishTitle),
      secondarySupervisorId: valueOrAbsent(secondarySupervisorId),
      supervisorId: valueOrAbsent(supervisorId),
      presidentId: valueOrAbsent(presidentId),
      firstReviewerId: valueOrAbsent(firstReviewerId),
      secondReviewerId: valueOrAbsent(secondReviewerId),
      secretaryId: valueOrAbsent(secretaryId),
      memberId: valueOrAbsent(memberId),
    );
    await (update(thesis)..where((t) => t.id.equals(id))).write(companion);
  }

  /// Craete new thesis
  void createThesis({
    required String vietnameseTitle,
    required String englishTitle,
    required TeacherData supervisor,
    StudentData? student,
    TeacherData? secondarySupervisor,
    String description = '',
  }) {
    final studentId = switch (student?.id) {
      null => Value<int>.absent(),
      int id => Value(id),
    };

    final secondarySupervisorId = switch (secondarySupervisor?.id) {
      null => Value<int>.absent(),
      int id => Value(id),
    };

    // final descriptionValue = description.trim().isEmpty
    //     ? const Value.absent()
    //     : Value(description.trim());

    final thesisStatus = switch (student?.id) {
      null => ThesisStatus.unofficial,
      int _ => ThesisStatus.assigned,
    };
    thesis.insertOne(
      ThesisCompanion.insert(
        vietnameseTitle: vietnameseTitle,
        englishTitle: englishTitle,
        supervisorId: supervisor.id,
        studentId: studentId,
        defenseStatus: thesisStatus,
        paymentStatus: PaymentStatus.unpaid,
        secondarySupervisorId: secondarySupervisorId,
      ),
    );
  }
}
