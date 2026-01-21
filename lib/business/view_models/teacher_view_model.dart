import '../db_v2_providers.dart';
import 'package:riverpod/riverpod.dart';
import 'package:drift/drift.dart';


class TeacherViewModel {
  final TeacherData teacher;
  final TeacherGroupData? group;

  static final providerById = _byId;

  const TeacherViewModel({
    required this.teacher,
    required this.group,
  });
}

final _byId = FutureProvider.family(
  (Ref ref, int id) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final teacher = await ref.watch(teacherByIdProvider(id).future);

    final TeacherGroupData? group;
    switch (teacher.teacherGroupId) {
      case int id:
        final groupStmt = db.teacherGroup.select();

        groupStmt.where((tbl) => tbl.id.equals(id));
        group = await groupStmt.getSingleOrNull();
      default:
        group = null;
    }

    return TeacherViewModel(
      teacher: teacher,
      group: group,
    );
  },
);
