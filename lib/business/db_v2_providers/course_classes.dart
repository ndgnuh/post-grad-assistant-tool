import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../drift_orm.dart';
import '../db_v2_providers.dart';

final courseClassByIdProvider = AsyncNotifierProvider.family(
  CourseClassByIdNotifier.new,
);

final courseClassIdsBySemesterProvider = AsyncNotifierProvider.family(
  CourseClassIdsBySemesterNotifier.new,
);

final teachingTeachersProvider = AsyncNotifierProvider.family(
  TeachingTeachersNotifier.new,
);

final courseClassSemestersProvider = AsyncNotifierProvider(
  CourseClassSemestersNotifier.new,
);

class CourseClassIdsBySemesterNotifier extends AsyncNotifier<List<int>> {
  final String semester;
  CourseClassIdsBySemesterNotifier(this.semester);

  @override
  FutureOr<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
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
}

class CourseClassByIdNotifier extends AsyncNotifier<CourseClassData?> {
  final int courseClassId;
  CourseClassByIdNotifier(this.courseClassId);

  @override
  FutureOr<CourseClassData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
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
    final db = await ref.watch(driftDatabaseProvider.future);
    final semesters = await db.getAllSemesters().get();
    return semesters;
  }
}

class TeachingTeachersNotifier extends AsyncNotifier<Map<TeacherData, double>> {
  final int courseClassId;
  TeachingTeachersNotifier(this.courseClassId);

  @override
  FutureOr<Map<TeacherData, double>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);

    final query = db.teachingAssignment.select()
      ..where((t) => t.classId.equals(courseClassId))
      ..orderBy([(t) => OrderingTerm(expression: t.order)]);
    final assignments = await query.get();

    final teachings = <TeacherData, double>{};
    for (final assignment in assignments) {
      final teacherId = assignment.teacherId;
      final contribution = assignment.contribution;
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
    final db = await ref.read(driftDatabaseProvider.future);

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
          contribution: Value(entry.value),
          order: Value(order++),
        ),
      ),
    );

    // Refetch the data
    ref.invalidateSelf();
    return;
  }
}
