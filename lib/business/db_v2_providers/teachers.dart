import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../drift_orm.dart';
import '../db_v2_providers.dart';

final insiderTeacherIdsProvider = AsyncNotifierProvider(InsiderTeacherIds.new);
final insiderTeachersProvider = AsyncNotifierProvider(InsiderTeachers.new);
final teacherByIdProvider = AsyncNotifierProvider.family(TeacherById.new);
final teachingCoursesProvider = AsyncNotifierProvider.family(
  TeachingCoursesNotifier.new,
);

class InsiderTeacherIds extends AsyncNotifier<List<int>> {
  @override
  Future<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final insiderIds = await db.managers.giangvien
        .filter((t) => t.isOutsider(true))
        .map((t) => t.id)
        .get();
    return insiderIds;
  }
}

class InsiderTeachers extends AsyncNotifier<List<TeacherData>> {
  @override
  Future<List<TeacherData>> build() async {
    final insiderIds = await ref.watch(insiderTeacherIdsProvider.future);
    final results = <TeacherData>[];
    for (var id in insiderIds) {
      final teacherData = await ref.watch(teacherByIdProvider(id).future);
      if (teacherData != null) {
        results.add(teacherData);
      }
    }
    return results;
  }
}

class TeacherById extends AsyncNotifier<TeacherData?> {
  final int teacherId;
  TeacherById(this.teacherId);

  @override
  Future<TeacherData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    return db.managers.giangvien
        .filter((t) => t.id.equals(teacherId))
        .getSingleOrNull();
  }
}

class TeachingCoursesNotifier extends AsyncNotifier<Set<CourseData>> {
  final int teacherId;
  TeachingCoursesNotifier(this.teacherId);

  @override
  Future<Set<CourseData>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.managers.dangKyGiangDay
        .filter((d) => d.teacherId.equals(teacherId))
        .map((d) => d.courseId);

    final courseIds = await query.get();
    final courses = <CourseData>{};

    for (final courseId in courseIds) {
      final course = await ref.watch(courseByIdProvider(courseId).future);
      if (course != null) {
        courses.add(course);
      }
    }
    return courses;
  }

  Future<void> addCourse(String courseId) async {
    final db = await ref.read(driftDatabaseProvider.future);
    // Check if the entry already exists
    final existing = await db.managers.dangKyGiangDay
        .filter(
          (d) => d.teacherId.equals(teacherId) & d.courseId.equals(courseId),
        )
        .getSingleOrNull();

    // If not, insert a new entry
    if (existing == null) {
      final entry = DangKyGiangDayCompanion.insert(
        teacherId: teacherId,
        courseId: courseId,
      );
      await db.into(db.dangKyGiangDay).insert(entry);
      ref.invalidateSelf();
    }
  }

  Future<void> removeCourse(String courseId) async {
    final db = await ref.read(driftDatabaseProvider.future);
    final query = (db.delete(db.dangKyGiangDay)
      ..where(
        (d) => d.teacherId.equals(teacherId) & d.courseId.equals(courseId),
      ));
    await query.go();
    ref.invalidateSelf();
  }
}

// Future<List<int>> insiderTeacherIds(Ref ref) async {
//   final db = await ref.watch(myDriftDatabaseProvider.future);
//   final insiderIds = await db.managers.giangvien
//       .filter((t) => t.isOutsider(true))
//       .map((t) => t.id)
//       .get();
//   return insiderIds;
// }
