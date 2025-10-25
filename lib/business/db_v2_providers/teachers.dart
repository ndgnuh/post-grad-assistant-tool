import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final insiderTeacherIdsProvider = AsyncNotifierProvider(
  InsiderTeacherIds.new,
);

final insiderTeachersProvider = AsyncNotifierProvider(
  InsiderTeachers.new,
);

final teacherByIdProvider = AsyncNotifierProvider.family(
  TeacherByIdNotifier.new,
);

final teacherIdsByCourseProvider = AsyncNotifierProvider.family(
  TeacherIdsByCourseProvider.new,
);

final teachingCoursesProvider = AsyncNotifierProvider.family(
  TeachingCoursesNotifier.new,
);

class InsiderTeacherIds extends AsyncNotifier<List<int>> {
  @override
  Future<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final insiderIds = await db.managers.teacher
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

class TeacherByIdNotifier extends AsyncNotifier<TeacherData> {
  final int teacherId;
  TeacherByIdNotifier(this.teacherId);

  @override
  Future<TeacherData> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final maybeTeacher = await db.managers.teacher
        .filter((t) => t.id.equals(teacherId))
        .getSingleOrNull();

    assert(maybeTeacher != null, "Không tìm thấy giảng viên với ID $teacherId");
    return maybeTeacher as TeacherData;
  }
}

/// Ids of teachers that teach a given course
class TeacherIdsByCourseProvider extends AsyncNotifier<List<int>> {
  final String courseId;
  TeacherIdsByCourseProvider(this.courseId);

  @override
  Future<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final teacherIds = await db.managers.dangKyGiangDay
        .filter((d) => d.courseId.equals(courseId))
        .map((d) => d.teacherId)
        .get();
    return teacherIds;
  }
}

class TeachingCoursesNotifier extends AsyncNotifier<Set<CourseData>> {
  final int teacherId;
  TeachingCoursesNotifier(this.teacherId);

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
