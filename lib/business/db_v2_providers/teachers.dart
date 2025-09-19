import 'package:riverpod/riverpod.dart';

import '../drift_orm.dart';

final insiderTeacherIdsProvider = AsyncNotifierProvider(InsiderTeacherIds.new);
final insiderTeachersProvider = AsyncNotifierProvider(InsiderTeachers.new);
final teacherByIdProvider = AsyncNotifierProvider.family(TeacherById.new);

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

// Future<List<int>> insiderTeacherIds(Ref ref) async {
//   final db = await ref.watch(myDriftDatabaseProvider.future);
//   final insiderIds = await db.managers.giangvien
//       .filter((t) => t.isOutsider(true))
//       .map((t) => t.id)
//       .get();
//   return insiderIds;
// }
