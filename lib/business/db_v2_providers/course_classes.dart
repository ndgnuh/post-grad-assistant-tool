import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final courseClassByIdProvider = AsyncNotifierProvider.family(
  CourseClassByIdNotifier.new,
);

final courseClassIdsBySemesterProvider = AsyncNotifierProvider.family(
  CourseClassIdsBySemesterNotifier.new,
);

/// Provide ids and contibution weights of teachers assigned to a course class
final teachingAssignmentsProvider = AsyncNotifierProvider.family(
  TeachingAssignmentsNotifier.new,
);

/// Provide the teachers assigned to
/// teach a course class, along with their contribution percentage
final teachingTeachersProvider = AsyncNotifierProvider.family(
  TeachingTeachersNotifier.new,
);

final courseClassSemestersProvider = AsyncNotifierProvider(
  CourseClassSemestersNotifier.new,
);

final studentIdsByCourseClassProvider = AsyncNotifierProvider.family(
  StudentIdsByCourseClassNotifier.new,
);

final registrationCountProvider = AsyncNotifierProvider.family(
  RegistrationCountNotifier.new,
);

class CourseClassIdsBySemesterNotifier extends AsyncNotifier<List<int>> {
  final String semester;
  CourseClassIdsBySemesterNotifier(this.semester);

  @override
  FutureOr<List<int>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final query = db.select(db.lopTinChi)
      ..orderBy([
        (t) => OrderingTerm(expression: t.status),
        (t) => OrderingTerm(expression: t.courseId),
      ])
      ..where(
        (cc) => cc.semester.equals(semester),
      );
    final courseClassIds = await query.map((c) => c.id).get();
    return courseClassIds;
  }

  Future<void> importClasses(List<CourseClassCompanion> classes) async {
    final db = await ref.read(appDatabaseProvider.future);
    await db.lopTinChi.insertAll(classes);
    ref.invalidateSelf();
  }
}

class TeachingAssignmentsNotifier
    extends AsyncNotifier<List<TeachingAssignmentData>> {
  final int courseClassId;
  TeachingAssignmentsNotifier(this.courseClassId);

  @override
  FutureOr<List<TeachingAssignmentData>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final query = db.teachingAssignment.select()
      ..where((t) => t.classId.equals(courseClassId))
      ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]);
    final assignments = await query.get();
    return assignments;
  }
}

class CourseClassByIdNotifier extends AsyncNotifier<CourseClassData?> {
  final int courseClassId;
  CourseClassByIdNotifier(this.courseClassId);

  @override
  FutureOr<CourseClassData?> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final query = db.managers.lopTinChi.filter(
      (cc) => cc.id.equals(courseClassId),
    );
    final courseClass = await query.getSingleOrNull();
    return courseClass;
  }
}

class CourseClassSemestersNotifier extends AsyncNotifier<List<String>> {
  @override
  FutureOr<List<String>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final semesters = await db.getAllSemesters().get();
    return semesters;
  }
}

class TeachingTeachersNotifier extends AsyncNotifier<Map<TeacherData, double>> {
  final int courseClassId;
  TeachingTeachersNotifier(this.courseClassId);

  @override
  FutureOr<Map<TeacherData, double>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);

    final query = db.teachingAssignment.select()
      ..where((t) => t.classId.equals(courseClassId))
      ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]);
    final assignments = await query.get();

    final teachings = <TeacherData, double>{};
    for (final assignment in assignments) {
      final teacherId = assignment.teacherId;
      final contribution = assignment.weight;
      final teacher = await ref.watch(teacherByIdProvider(teacherId).future);
      if (teacher != null) {
        teachings[teacher] = contribution;
      }
    }

    return teachings;
  }

  /// Remove all the teaching assignments for the course class
  /// and then update with the new assignments
  Future<void> set(Map<TeacherData, double> assignment) async {
    final db = await ref.read(appDatabaseProvider.future);

    // Delete existing assignments
    await db.teachingAssignment.deleteWhere(
      (t) => t.classId.equals(courseClassId),
    );

    // Add new assignments
    var order = 1;
    await db.teachingAssignment.insertAll(
      assignment.entries.map(
        (entry) => TeachingAssignmentCompanion.insert(
          classId: courseClassId,
          teacherId: entry.key.id,
          weight: Value(entry.value),
          sortOrder: Value(order++),
        ),
      ),
    );

    // Refetch the data
    ref.invalidateSelf();
    return;
  }
}

/// Provide the number of registered students for a course class, if the detailed list is not available, use the count provided from the university.
/// Here's the messy details:
/// When the student register for a course class,
/// we are not sent the detailed list of the students.
/// The only information available is the number of registered students.
/// After the registration period is over, the detailed list of students is available to us.
/// However, we still need the number of registered students during the registration period for certain tasks (cancel or not, inform the teacher, etc).
class RegistrationCountNotifier extends AsyncNotifier<int> {
  final int courseClassId;
  RegistrationCountNotifier(this.courseClassId);

  @override
  FutureOr<int> build() async {
    // First, try to get the detailed list of students
    final studentIds = await ref.watch(
      studentIdsByCourseClassProvider(courseClassId).future,
    );
    if (studentIds.isNotEmpty) {
      return studentIds.length;
    }

    // If the detailed list is not available, use the count from the course class record
    final db = await ref.watch(appDatabaseProvider.future);
    final stmt = db.lopTinChi.select()
      ..where((cc) => cc.id.equals(courseClassId));
    final count = await stmt
        .map((cc) => cc.registrationCount)
        .getSingleOrNull();
    return count ?? 0;
  }
}

class StudentIdsByCourseClassNotifier extends AsyncNotifier<List<int>> {
  final int courseClassId;
  StudentIdsByCourseClassNotifier(this.courseClassId);

  @override
  FutureOr<List<int>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final query = db.dangKyHoc.select()
      ..where((record) => record.courseClassId.equals(courseClassId))
      ..orderBy([(t) => OrderingTerm(expression: t.studentId)]);
    final studentIds = await query.map((scc) => scc.studentId).get();
    return studentIds;
  }
}
