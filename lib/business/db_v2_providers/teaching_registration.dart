import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final _byTeacherProvider = AsyncNotifierProvider.family(
  (int teacherId) => TeachingRegistrationNotifier(teacherId: teacherId),
);

final _byCourseProvider = AsyncNotifierProvider.family(
  (String courseId) => TeachingRegistrationNotifier(coureId: courseId),
);

final teacherIdsByCourseProvider = AsyncNotifierProvider.family(
  TeacherIdsByCourseNotifier.new,
);

final courseIdsByTeacherProvider = AsyncNotifierProvider.family(
  CourseIdsByTeacherNotifier.new,
);

class TeachingRegistrationNotifier
    extends AsyncNotifier<List<TeachingRegistrationData>> {
  final int? teacherId;
  final String? coureId;

  TeachingRegistrationNotifier({this.teacherId, this.coureId});

  @override
  FutureOr<List<TeachingRegistrationData>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final stmt = db.teachingRegistration.select();
    stmt.orderBy([(r) => OrderingTerm(expression: r.courseId)]);

    // Filter teacher ID if provided
    switch (teacherId) {
      case int teacherId:
        stmt.where((tr) => tr.teacherId.equals(teacherId));
        break;
    }

    // Fitler course ID if provided
    switch (coureId) {
      case String coureId:
        stmt.where((tr) => tr.courseId.equals(coureId));
        break;
    }

    final registrations = await stmt.get();
    return registrations;
  }

  Future<void> removeRegistration({
    required int teacherId,
    required String courseId,
  }) async {
    final db = await ref.read(appDatabaseProvider.future);
    db.teachingRegistration.deleteWhere(
      (tr) => tr.teacherId.equals(teacherId) & tr.courseId.equals(courseId),
    );
    ref.invalidateSelf();
  }

  Future<void> addRegistration({
    required int teacherId,
    required String courseId,
  }) async {
    final db = await ref.read(appDatabaseProvider.future);
    final entry = TeachingRegistrationCompanion.insert(
      teacherId: teacherId,
      courseId: courseId,
    );
    await db.into(db.teachingRegistration).insertOnConflictUpdate(entry);
    ref.invalidateSelf();
  }
}

/// Ids of teachers that teach a given course
class TeacherIdsByCourseNotifier extends AsyncNotifier<List<int>> {
  final String courseId;
  TeacherIdsByCourseNotifier(this.courseId);

  AsyncNotifierProvider<
    TeachingRegistrationNotifier,
    List<TeachingRegistrationData>
  >
  get _provider => _byCourseProvider(courseId);

  @override
  Future<List<int>> build() async {
    final registrations = await ref.watch(_provider.future);
    final teacherIds = registrations.map((r) => r.teacherId).toList();
    return teacherIds;
  }

  Future<void> addTeacher(int teacherId) async {
    final notifier = ref.read(_provider.notifier);
    await notifier.addRegistration(
      teacherId: teacherId,
      courseId: courseId,
    );
  }

  Future<void> removeTeacher(int teacherId) async {
    final notifier = ref.read(_provider.notifier);
    await notifier.removeRegistration(
      teacherId: teacherId,
      courseId: courseId,
    );
  }
}

class CourseIdsByTeacherNotifier extends AsyncNotifier<List<String>> {
  final int teacherId;
  CourseIdsByTeacherNotifier(this.teacherId);

  AsyncNotifierProvider<
    TeachingRegistrationNotifier,
    List<TeachingRegistrationData>
  >
  get _provider => _byTeacherProvider(teacherId);

  @override
  Future<List<String>> build() async {
    final registrations = await ref.watch(_provider.future);
    final courseIds = registrations.map((r) => r.courseId).toList();
    return courseIds;
  }

  Future<void> addCourse(String courseId) async {
    final notifier = ref.read(_provider.notifier);
    await notifier.addRegistration(
      teacherId: teacherId,
      courseId: courseId,
    );
  }

  Future<void> removeCourse(String courseId) async {
    final notifier = ref.read(_provider.notifier);
    await notifier.removeRegistration(
      teacherId: teacherId,
      courseId: courseId,
    );
  }
}
