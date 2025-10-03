import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
export 'package:drift/drift.dart' show Value;
import 'package:riverpod/riverpod.dart';

import '../preferences.dart' as preferences;
import './business_enums.dart';
export './business_enums.dart'
    show Gender, AcademicRankConverter, AcademicRank, CourseCategory;

part 'drift_orm.g.dart';

const trueExpr = Constant(true);
const falseExpr = Constant(false);

@DriftDatabase(include: {"database_v1.drift"})
class MyDriftDatabase extends _$MyDriftDatabase {
  MyDriftDatabase(super.excecutor);

  @override
  int get schemaVersion => 1;
}

// @riverpod
// Future<List<TeacherData>> allTeachers(Ref ref) async {
//   final db = await ref.watch(myDriftDatabaseProvider.future);
//   return db.managers.giangvien.get();
// }
//
// @riverpod
// Future<List<int>> insiderTeacherIds(Ref ref) async {
//   final db = await ref.watch(myDriftDatabaseProvider.future);
//   final insiderIds = await db.managers.giangvien
//       .filter((t) => t.isOutsider(true))
//       .map((t) => t.id)
//       .get();
//   return insiderIds;
// }

// @riverpod
// Future<TeacherData?> teacherById(Ref ref, int id) async {
//   final db = await ref.watch(myDriftDatabaseProvider.future);
//   return db.managers.giangvien.filter((t) => t.id.equals(id)).getSingleOrNull();
// }
//
// @riverpod
// Future<List<TeacherData>> teachersByIds(Ref ref, List<int> ids) async {
//   final results = <TeacherData>[];
//   for (var id in ids) {
//     final teacherData = await ref.watch(teacherByIdProvider(id).future);
//     if (teacherData != null) {
//       results.add(teacherData);
//     }
//   }
//   return results;
// }
//
// @riverpod
// Future<List<TeacherData>> insiderTeachers(Ref ref) async {
//   final insiderIds = await ref.watch(insiderTeacherIdsProvider.future);
//   final teachers = await ref.watch(teachersByIdsProvider(insiderIds).future);
//   return teachers;
// }
//
// @riverpod
// Future<Set<String>> allPhdCohorts(Ref ref) async {
//   final db = await ref.watch(myDriftDatabaseProvider.future);
//   final query = db.managers.phdStudent.map((phdStudent) => phdStudent.cohort);
//   final result = await query.get();
//   return result.toSet();
// }
//

final driftDatabaseProvider = AsyncNotifierProvider(DriftDatabaseNotifier.new);

class DriftDatabaseNotifier extends AsyncNotifier<MyDriftDatabase> {
  @override
  Future<MyDriftDatabase> build() async {
    final executor = driftDatabase(
      name: 'fami-caohoc-drift',
      native: DriftNativeOptions(
        // databaseDirectory: () => Future.value("/tmp"),
        databasePath: () async {
          final path = await ref.watch(preferences.databasePathProvider.future);
          return path!;
        },
      ),
    );
    return MyDriftDatabase(executor);
  }
}
