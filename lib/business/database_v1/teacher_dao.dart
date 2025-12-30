part of '../main_database.dart';

extension TeacherDao on AppDatabase {
  /// Search teachers by name and outsider status
  /// Returns only the ids of the teachers
  SimpleSelectStatement<Teacher, TeacherData> searchTeachers({
    String searchText = "",
    bool? isOutsider,
  }) {
    final stmt = select(teacher);

    if (isOutsider != null) {
      stmt.where((t) => t.isOutsider.equals(isOutsider));
    }

    if (searchText.isNotEmpty) {
      final st = searchText.trim();

      final idsFts = selectOnly(teacher);
      idsFts.addColumns([teacher.id]);
      idsFts.where(
        CustomExpression(
          "id in (select id from teacher_fts where teacher_fts MATCH '$st')",
        ),
      );

      stmt.where(
        (t) =>
            t.name.contains(st) |
            t.staffId.contains(st) |
            t.workEmail.contains(st) |
            t.citizenId.contains(st) |
            t.bankAccount.contains(st) |
            t.personalEmail.contains(st) |
            t.phoneNumber.contains(st),
        // t.id.isInQuery(idsFts),
        // t.isInQuery(idsFtsQuery as BaseSelectStatement<IntColumn>),
      );
    }

    return stmt;
  }

  /// Update teacher information
  /// Null values will be ignored and marked as absent
  Future<void> updateTeacher({
    required int id,
    String? name,
    String? staffId,
    String? phoneNumber,
    String? email,
    Gender? gender,
    String? specialization,
    String? bankAccount,
    String? bankName,
    String? deprecatedTaxCode,
    String? citizenId,
    String? falcuty,
    String? university,
    int? startTeachingYear,
    Pronoun? pronoun,
    AcademicRank? academicRank,
    AcademicDegree? academicDegree,
    DateTime? dateOfBirth,
  }) async {
    Value<String> toStringValue(String? input) {
      if (input == null) {
        return const Value.absent();
      } else if (input.trim().isEmpty) {
        return const Value.absent();
      } else {
        return Value(input);
      }
    }

    final companion = TeacherCompanion(
      name: name != null ? Value(name) : const Value.absent(),
      staffId: toStringValue(staffId),
      gender: switch (gender) {
        null => const Value.absent(),
        Gender g => Value(g),
      },
      university: toStringValue(university),
      phoneNumber: toStringValue(phoneNumber),
      falcuty: toStringValue(falcuty),
      specialization: toStringValue(specialization),
      personalEmail: toStringValue(email),
      bankAccount: toStringValue(bankAccount),
      bankName: toStringValue(bankName),
      deprecatedTaxCode: toStringValue(deprecatedTaxCode),
      citizenId: toStringValue(citizenId),
      pronoun: switch (pronoun) {
        null => const Value.absent(),
        Pronoun p => Value(p),
      },
      startTeachingYear: switch (startTeachingYear) {
        null => const Value.absent(),
        int y => Value(y),
      },
      dateOfBirth: switch (dateOfBirth) {
        null => const Value.absent(),
        DateTime d => Value(d),
      },
      academicRank: switch (academicRank) {
        null => const Value.absent(),
        AcademicRank r => Value(r),
      },
      academicDegree: switch (academicDegree) {
        null => const Value.absent(),
        AcademicDegree d => Value(d),
      },
    );

    final stmt = teacher.update();
    stmt.where((t) => t.id.equals(id));
    await stmt.write(companion);
  }
}
