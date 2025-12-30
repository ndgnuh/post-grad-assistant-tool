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
      results.add(teacherData);
    }
    return results;
  }
}

class TeacherByIdNotifier extends AsyncNotifier<TeacherData> {
  final int teacherId;
  late Stream<TeacherData> teacherStream;
  TeacherByIdNotifier(this.teacherId);

  @override
  Future<TeacherData> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.managers.teacher.filter(
      (t) => t.id.equals(teacherId),
    );

    final maybeTeacher = await stmt.getSingleOrNull();

    // Automatially update the state when the teacher data changes
    if (ref.isFirstBuild) {
      stmt.watchSingle().listen((teacherData) {
        state = AsyncData(teacherData);
      });
    }

    assert(maybeTeacher != null, "Không tìm thấy giảng viên với ID $teacherId");
    return maybeTeacher as TeacherData;
  }

  Future<void> updateInfo({
    String? name,
    String? staffId,
    String? phoneNumber,
    String? email,
    Gender? gender,
    String? specialization,
    String? bankAccount,
    String? bankName,
    String? deprecatedTaxCode,
    String? citizenId,
    String? falcuty,
    String? university,
    int? startTeachingYear,
    AcademicRank? academicRank,
    AcademicDegree? academicDegree,
    DateTime? dateOfBirth,
  }) async {
    final db = await ref.read(mainDatabaseProvider.future);
    db.updateTeacher(
      id: teacherId,
      name: name,
      staffId: staffId,
      phoneNumber: phoneNumber,
      email: email,
      gender: gender,
      specialization: specialization,
      bankAccount: bankAccount,
      bankName: bankName,
      deprecatedTaxCode: deprecatedTaxCode,
      citizenId: citizenId,
      falcuty: falcuty,
      university: university,
      startTeachingYear: startTeachingYear,
      academicRank: academicRank,
      academicDegree: academicDegree,
      dateOfBirth: dateOfBirth,
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
