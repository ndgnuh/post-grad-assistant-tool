import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'business_enums.dart' as enums;
import 'business_enums.dart';

export './business_enums.dart';
export 'package:drift/drift.dart' show Value;
export 'package:drift/drift.dart' show TableStatements;

part 'database_v1/thesis_dao.dart';
part 'database_v1/phd_student_dao.dart';
part 'database_v1/teacher_dao.dart';
part 'main_database.g.dart';

extension AnyEmail on TeacherData {
  String? get email => workEmail ?? personalEmail;
  String get requireEmail {
    if (workEmail != null) return workEmail as String;
    if (personalEmail != null) return personalEmail as String;
    throw AssertionError('Giảng viên $name không có');
  }

  // String get nameWithTitle {
  //   switch ((academicRank, academicDegree)) {
  //     case (AcademicRank rank, AcademicDegree degree):
  //       return '${rank.short} ${degree.short} $name';
  //     case (AcademicRank rank, null):
  //       return '${rank.short} $name';
  //     case (null, AcademicDegree degree):
  //       return '${degree.short} $name';
  //     case (null, null):
  //       return name;
  //   }
  // }

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

  SimpleSelectStatement<Semester, SemesterData> previousSemester(
    SemesterData semester,
  ) {
    final stmt = this.semester.select();
    stmt.where((s) => s.sequence.equals(semester.sequence - 1));
    return stmt;
  }

  SimpleSelectStatement<Document, DocumentData> searchDocuments({
    String? searchText,
  }) {
    final stmt = document.select();

    switch (searchText?.trim()) {
      case String text when text.isNotEmpty:
        stmt.where(
          (d) =>
              d.title.contains(text) |
              d.officialCode.cast<String>().contains(text),
        );
    }

    return stmt;
  }
}

Value<T> valueOrAbsent<T>(T? value) {
  return value != null ? Value(value) : const Value.absent();
}
