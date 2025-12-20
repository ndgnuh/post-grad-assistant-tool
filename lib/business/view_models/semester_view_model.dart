import 'package:riverpod/riverpod.dart';
import 'package:drift/drift.dart';

import '../main_database.dart';
import '../db_v2_providers.dart';

class SemesterViewModel {
  final SemesterData semester;
  final List<CourseData> limittedCourses;
  final List<CourseClassData> courseClasses;

  const SemesterViewModel({
    required this.semester,
    required this.limittedCourses,
    required this.courseClasses,
  });
}

final _byId = FutureProvider.family((ref, String id) async {
  final semester = await ref.watch(semesterByIdProvider(id).future);
  final db = await ref.watch(mainDatabaseProvider.future);

  final stmt = db.courseLimiting.select();
  stmt.where((tbl) => tbl.semesterId.equals(id));

  final courseClassIds = ref.watch(courseClassIdsBySemesterProvider(id).future);
  final coursesClasses = <CourseClassData>[];
  for (final courseClassId in await courseClassIds) {
    final courseClass = await ref.watch(
      courseClassByIdProvider(courseClassId).future,
    );
    coursesClasses.add(courseClass);
  }

  return SemesterViewModel(
    semester: semester,
    limittedCourses: [],
    courseClasses: coursesClasses,
  );
});
