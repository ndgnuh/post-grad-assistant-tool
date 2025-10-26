import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final courseByIdProvider = AsyncNotifierProvider.family(
  CourseByIdNotifier.new,
);

final coursesProvider = AsyncNotifierProvider(
  CoursesNotifier.new,
);

class CourseByIdNotifier extends AsyncNotifier<CourseData> {
  final String courseId;
  CourseByIdNotifier(this.courseId);

  @override
  Future<CourseData> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final course = await db.managers.course
        .filter((c) => c.id.equals(courseId))
        .getSingleOrNull();
    assert(course != null, "Course with ID $courseId not found");
    return course as CourseData;
  }
}

class CoursesNotifier extends AsyncNotifier<List<CourseData>> {
  @override
  FutureOr<List<CourseData>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final courses = await db.managers.course.get();
    return courses;
  }
}
