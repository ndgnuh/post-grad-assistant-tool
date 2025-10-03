import 'dart:async';

import 'package:riverpod/riverpod.dart';
import '../drift_orm.dart';

final coursesProvider = AsyncNotifierProvider(
  CoursesNotifier.new,
);

final courseByIdProvider = AsyncNotifierProvider.family(
  CourseByIdNotifier.new,
);

class CoursesNotifier extends AsyncNotifier<List<CourseData>> {
  @override
  FutureOr<List<CourseData>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final courses = await db.managers.hocphan.get();
    return courses;
  }
}

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
