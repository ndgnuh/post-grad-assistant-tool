import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final courseByIdProvider = AsyncNotifierProvider.family(
  CourseByIdNotifier.new,
);

final coursesProvider = AsyncNotifierProvider(
  CoursesNotifier.new,
);

class CourseByIdNotifier extends AsyncNotifier<CourseData?> {
  final String courseId;
  CourseByIdNotifier(this.courseId);

  @override
  Future<CourseData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    return db.managers.hocphan
        .filter((c) => c.id.equals(courseId))
        .getSingleOrNull();
  }
}

class CoursesNotifier extends AsyncNotifier<List<CourseData>> {
  @override
  FutureOr<List<CourseData>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final courses = await db.managers.hocphan.get();
    return courses;
  }
}
