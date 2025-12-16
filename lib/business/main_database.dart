import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'business_enums.dart' as enums;
import 'business_enums.dart';

export './business_enums.dart';

part 'main_database.g.dart';

extension AnyEmail on TeacherData {
  String? get email => workEmail ?? personalEmail;

  List<String> get emails => [
    if (workEmail != null) workEmail as String,
    if (personalEmail != null) personalEmail as String,
  ];
}

extension SemesterHelp on SemesterData {
  DateTime get softGradeSubmissionDeadline {
    final a = classEndDate;
    final b = gradeSubmissionDeadline;
    final diff = b.difference(a).inDays / 2;
    return a.add(Duration(days: diff.floor()));
  }
}

extension TeacherTitles on TeacherData {
  /// Similar to [toJson] but includes extra computed fields
  Map<String, Object?> toJsonExt() {
    return {
      ...toJson(),
      "name_with_title": nameWithTitle,
      "title": title,
    };
  }

  String get title {
    switch ((academicRank, academicDegree)) {
      case (AcademicRank rank, AcademicDegree degree):
        return '${rank.short} ${degree.short}';
      case (AcademicRank rank, null):
        return rank.short;
      case (null, AcademicDegree degree):
        return degree.short;
      case (null, null):
        return '';
    }
  }

  String get nameWithTitle {
    switch ((academicRank, academicDegree)) {
      case (AcademicRank rank, AcademicDegree degree):
        return '${rank.short} ${degree.short} $name';
      case (AcademicRank rank, null):
        return '${rank.short} $name';
      case (null, AcademicDegree degree):
        return '${degree.short} $name';
      case (null, null):
        return name;
    }
  }
}

@DriftDatabase(
  include: {"database_v1.drift"},
  queries: {
    'searchTeacherIdsFts':
        'SELECT id FROM teacher_fts WHERE teacher_fts MATCH ?;',
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 2;

  static AppDatabase intialize(String databasePath) {
    final executor = driftDatabase(
      name: 'fami-caohoc-drift',
      native: DriftNativeOptions(
        databasePath: () => Future.value(databasePath),
        // isolateDebugLog: true,
      ),
    );
    final db = AppDatabase(executor);
    return db;
  }

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

  Future<List<String>> searchCourses({
    String? searchText,
    CourseCategory? category,
  }) async {
    final emptySearchText = searchText == null || searchText.isEmpty;
    // Return all course IDs if no filter is provided
    if (emptySearchText && category == null) {
      final allCourses = await select(course).map((c) => c.id).get();
      return allCourses;
    }

    // If only category is provided, filter by category
    if (emptySearchText && category != null) {
      final stmt = select(course)
        ..where((c) => c.category.equals(category.value));
      final results = await stmt.map((c) => c.id).get();
      return results;
    }

    // Try searching with FTS, if fails, fall back to normal search
    try {
      final stmt = customSelect(
        'SELECT courseId FROM course_fts WHERE course_fts MATCH ?',
        variables: [Variable<String>(searchText)],
      );
      return await stmt.map((row) => row.read<String>('courseId')).get();
    } catch (e) {
      final stmt = select(course);
      stmt.where(
        (c) =>
            c.vietnameseName.contains(searchText!) |
            c.englishName.contains(searchText) |
            c.id.contains(searchText),
      );
      final results = await stmt.map((c) => c.id).get();
      return results;
    }
  }

  SimpleSelectStatement<Thesis, ThesisData> thesisByStudentId({
    required int studentId,
  }) {
    final stmt = select(thesis)..where((t) => t.studentId.equals(studentId));
    return stmt;
  }

  SimpleSelectStatement<Teacher, TeacherData> teacherById({
    required int teacherId,
  }) {
    final stmt = select(teacher)..where((t) => t.id.equals(teacherId));
    return stmt;
  }

  SimpleSelectStatement<Student, StudentData> searchStudents({
    String searchText = "",
    enums.StudentStatus? status,
  }) {
    final stmt = select(student);

    if (status != null) {
      stmt.where((s) => s.status.equals(status.value));
    }

    if (searchText.isNotEmpty) {
      final st = searchText.trim();

      final idsFts = selectOnly(student);
      idsFts.addColumns([student.id]);
      idsFts.where(
        CustomExpression(
          "id in (select id from student_fts where student_fts MATCH '$st')",
        ),
      );

      stmt.where(
        (s) =>
            s.name.contains(st) |
            s.studentId.contains(st) |
            s.personalEmail.contains(st) |
            s.cohort.contains(st) |
            s.phone.contains(st),
      );
    }

    return stmt;
  }

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

  /// Craete new thesis
  void createThesis({
    required String vietnameseTitle,
    required String englishTitle,
    required TeacherData supervisor,
    required StudentData? student,
  }) {
    final studentId = switch (student?.id) {
      null => Value<int>.absent(),
      int id => Value(id),
    };

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
      ),
    );
  }

  SimpleSelectStatement<PhdStudent, PhdStudentData> searchPhdStudents({
    int? id,
    String? searchText,
    PhdCohortData? cohort,
    PaymentStatus? admissionPaymentStatus,
  }) {
    final stmt = select(phdStudent);

    if (id != null) {
      stmt.where((p) => p.id.equals(id));
    }

    switch (searchText?.trim()) {
      case String searchText when searchText.trim().isNotEmpty:
        stmt.where(
          (p) =>
              p.name.contains(searchText) |
              p.admissionId.contains(searchText) |
              p.personalEmail.contains(searchText) |
              p.phone.contains(searchText) |
              p.cohort.contains(searchText),
        );
      default:
    }

    if (cohort != null) {
      stmt.where((p) => p.cohort.equals(cohort.cohort));
    }

    switch (admissionPaymentStatus) {
      case PaymentStatus status:
        stmt.where((p) => p.admissionPaymentStatus.equals(status.value));
      default:
    }

    return stmt;
  }
}
