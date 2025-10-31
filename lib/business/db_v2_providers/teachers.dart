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

class InsiderTeacherIds extends AsyncNotifier<List<int>> {
  @override
  Future<List<int>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
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
    final db = await ref.watch(mainDatabaseProvider.future);
    final maybeTeacher = await db.managers.teacher
        .filter((t) => t.id.equals(teacherId))
        .getSingleOrNull();

    assert(maybeTeacher != null, "Không tìm thấy giảng viên với ID $teacherId");
    return maybeTeacher as TeacherData;
  }

  Future<void> updateTeacher(TeacherCompanion newData) async {
    final db = await ref.read(mainDatabaseProvider.future);
    final stmt = db.teacher.update();
    stmt.where((t) => t.id.equals(teacherId));
    final newTeacherData = await stmt.writeReturning(newData);
    state = AsyncData(newTeacherData.first);
  }

  Future<void> updateAcademicRank(AcademicRank? rank) async {
    updateTeacher(
      TeacherCompanion(
        academicRank: Value(rank),
      ),
    );
  }

  Future<void> updateAcademicDegree(AcademicDegree? degree) async {
    updateTeacher(
      TeacherCompanion(
        academicDegree: Value(degree),
      ),
    );
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
