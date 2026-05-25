import '../../business/main_database.dart';

extension _NzString on String? {
  Value<String?> get nzValue {
    if (this == null) {
      return Value.absent();
    }

    final trimmed = this!.trim();
    if (trimmed.isEmpty) return Value.absent();
    return Value(trimmed);
  }
}

class TeacherManagementService {
  final AppDatabase db;
  const TeacherManagementService({required this.db});

  Future<TeacherData> addTeacher({
    required String name,
    required Gender gender,
    required String? email,
    required String? phoneNumber,
    required AcademicRank? academicRank,
    required AcademicDegree? academicDegree,
    required String? university,
    required String? faculty,
  }) {
    final companion = TeacherCompanion.insert(
      name: name,
      gender: gender,
      workEmail: email.nzValue,
      phoneNumber: phoneNumber.nzValue,
      academicRank: Value(academicRank),
      academicDegree: Value(academicDegree),
      university: university.nzValue,
      falcuty: faculty.nzValue,
    );

    return db.into(db.teacher).insertReturning(companion);
  }
}
