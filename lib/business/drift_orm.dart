import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'business_enums.dart' as enums;
import 'business_enums.dart';

export './business_enums.dart';

part 'drift_orm.g.dart';

extension AnyEmail on TeacherData {
  String? get email => workEmail ?? personalEmail;

  List<String> get emails => [
    if (workEmail != null) workEmail as String,
    if (personalEmail != null) personalEmail as String,
  ];
}

extension TeacherTitles on TeacherData {
  String get nameWithTitle {
    print((academicRank, academicDegree));
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
}
