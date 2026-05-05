import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../business/main_database.dart';
import '../../../core/sqlbuilder/_query.dart';

class CourseClassListViewModel {
  final List<CourseClassData> courseClassList;
  final List<SemesterData> semesterList;
  final List<CourseData> courseList;
  final List<TeachingAssignmentData> assignmentData;
  final List<TeacherData> teacherData;

  CourseClassListViewModel({
    required this.courseClassList,
    required this.semesterList,
    required this.courseList,
    required this.assignmentData,
    required this.teacherData,
  });
}

class CourseClassViewModel {
  final SemesterData semester;
  final CourseClassData courseClass;
  final List<TeacherData> teachers;
  final List<double> teacherWeights;
  final CourseData course;
  final int registrationCount;

  const CourseClassViewModel({
    required this.semester,
    required this.courseClass,
    required this.teachers,
    required this.course,
    this.registrationCount = 0,
    required this.teacherWeights,
  });

  String get className {
    return courseClass.classId.replaceFirst(course.id, course.vietnameseName);
  }

  String get studyTime =>
      switch ((courseClass.startPeriod, courseClass.endPeriod)) {
        (int i, int j) => "T$i-T$j",
        _ => "Chưa gán",
      };

  String get teacherAssignmentString {
    final ret = teachers.indexed
        .map((e) {
          final (i, teacher) = e;
          final weight = teacherWeights[i];

          return "${teacher.nameWithTitle} ($weight)";
        })
        .join("\n");

    return ret.isEmpty ? "Chưa gán" : ret;
  }
}

class CourseClassDao {
  final AppDatabase db;
  const CourseClassDao(this.db);

  Stream<List<CourseClassData>> watchCourseClassBySemester({
    required final SemesterData semester,
  }) {
    final stmt = db.select(db.courseClass);
    stmt.where((r) => r.semester.equals(semester.id));
    return stmt.watch();
  }

  Stream<List<CourseClassViewModel>> watchClassListBySemester({
    required final SemesterData semester,
  }) async* {
    /// Perform a join
    final stmt = db.select(db.courseClass).join([
      innerJoin(db.semester, db.courseClass.semester.equalsExp(db.semester.id)),
      innerJoin(db.course, db.course.id.equalsExp(db.courseClass.courseId)),
      leftOuterJoin(
        db.teachingAssignment,
        db.courseClass.id.equalsExp(db.teachingAssignment.classId),
      ),
      leftOuterJoin(
        db.teacher,
        db.teachingAssignment.teacherId.equalsExp(db.teacher.id),
      ),
    ]);

    stmt.where(db.semester.id.equals(semester.id));
    stmt.orderBy([
      OrderingTerm.asc(db.courseClass.status),
      OrderingTerm.asc(
        db.courseClass.id,
      ), // We relies on this to keep the classes  contigous
      OrderingTerm.asc(db.teachingAssignment.sortOrder),
    ]);

    final mapped = stmt.map((row) {
      final courseClass = row.readTable(db.courseClass);
      final course = row.readTable(db.course);
      final semester = row.readTable(db.semester);
      final assignment = row.readTableOrNull(db.teachingAssignment);
      final teacher = row.readTableOrNull(db.teacher);
      return (courseClass, course, semester, assignment, teacher);
    });
    final rowStream = mapped.watch();

    await for (final rows in rowStream) {
      /// Current state
      List<TeacherData> teachers = [];
      List<double> teacherWeights = [];
      final viewModels = <CourseClassViewModel>[];
      for (final (i, row) in rows.indexed) {
        final (courseClass, course, semester, assignment, teacher) = row;

        if (teacher != null && assignment != null) {
          teachers.add(teacher);
          teacherWeights.add(assignment.weight);
        }

        if (i == rows.length - 1 || rows[i + 1].$1 != courseClass) {
          final viewModel = CourseClassViewModel(
            semester: semester,
            course: course,
            courseClass: courseClass,
            teachers: teachers,
            teacherWeights: teacherWeights,
          );
          viewModels.add(viewModel);

          teachers = [];
          teacherWeights = [];
        }
      }

      yield viewModels;
    }
  }

  void updateClassroom({required int classId, required String room}) {
    room = room.trim();
    final updatedValue = room.isEmpty ? Value<String>.absent() : Value(room);
    final companion = CourseClassCompanion(classroom: updatedValue);
    final stmt = db.update(db.courseClass);
    stmt.where((r) => r.id.equals(classId));
    stmt.write(companion);
  }

  void updateDayOfWeek({required int classId, required DayOfWeek? value}) {
    final companion = CourseClassCompanion(dayOfWeek: Value(value));
    final stmt = db.update(db.courseClass);
    stmt.where((r) => r.id.equals(classId));
    stmt.write(companion);
  }

  void updateClassPeriods({
    required int classId,
    required PeriodOfDay? startPeriod,
    required PeriodOfDay? finishPeriod,
  }) {
    final startValue = Value(startPeriod?.value);
    final finishValue = Value(finishPeriod?.value);

    final companion = CourseClassCompanion(
      startPeriod: startValue,
      endPeriod: finishValue,
    );

    final stmt = db.update(db.courseClass);
    stmt.where((r) => r.id.equals(classId));
    stmt.write(companion);
  }

  void updateAccessUrl({required int classId, required String value}) async {
    value = value.trim();
    final updatedValue = value.isEmpty ? Value<String>.absent() : Value(value);
    final companion = CourseClassCompanion(accessUrl: updatedValue);
    final stmt = db.update(db.courseClass);
    stmt.where((r) => r.id.equals(classId));
    stmt.write(companion);
  }

  void updateClassStatus({
    required int classId,
    required CourseClassStatus value,
  }) {
    final companion = CourseClassCompanion(status: Value(value));
    final stmt = db.update(db.courseClass);
    stmt.where((r) => r.id.equals(classId));
    stmt.write(companion);
  }
}
