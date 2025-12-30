import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final courseByIdProvider = FutureProvider.family((
  Ref ref,
  String courseId,
) async {
  final db = await ref.watch(mainDatabaseProvider.future);
  final stmt = db.managers.course.filter((c) => c.id.equals(courseId));
  if (ref.isFirstBuild) {
    stmt.watchSingleOrNull().listen((course) {
      ref.invalidateSelf();
    });
  }

  final course = await stmt.getSingleOrNull();
  assert(course != null, "Course with ID $courseId not found");
  return course as CourseData;
});

// final coursesProvider = AsyncNotifierProvider(
//   CoursesNotifier.new,
// );

// class CoursesNotifier extends AsyncNotifier<List<CourseData>> {
//   @override
//   FutureOr<List<CourseData>> build() async {
//     final db = await ref.watch(mainDatabaseProvider.future);
//     final courses = await db.managers.course.get();
//     return courses;
//   }
// }
