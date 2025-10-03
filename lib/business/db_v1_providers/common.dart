import 'dart:async';

import 'package:fami_tools/services/database.dart';
import 'package:riverpod/riverpod.dart';

import '../domain_objects.dart';

final academicYearsProvider = AsyncNotifierProvider(
  AcademicYears.new,
);

final cohortsProvider = AsyncNotifierProvider(
  CohortsNotifier.new,
);

final currentAcademicYearProvider = AsyncNotifierProvider(
  CurrentAcademicYear.new,
);

final studentByCohortProvider = AsyncNotifierProvider.family(
  StudentsByCohort.new,
);

final studentByIdProvider = AsyncNotifierProvider.family(
  StudentById.new,
);

final teacherByIdProvider = AsyncNotifierProvider.family(
  TeacherByIdNotifier.new,
);

class AcademicYears extends AsyncNotifier<List<AcademicYear>> {
  @override
  FutureOr<List<AcademicYear>> build() async {
    return await AcademicYear.all();
  }
}

class CohortsNotifier extends AsyncNotifier<List<Cohort>> {
  @override
  FutureOr<List<Cohort>> build() async {
    return await Cohort.all();
  }
}

class CurrentAcademicYear extends AsyncNotifier<AcademicYear?> {
  @override
  FutureOr<AcademicYear?> build() async {
    final listAcademicYears = await ref.watch(academicYearsProvider.future);
    final now = DateTime.now();
    if (listAcademicYears.isEmpty) {
      throw Exception('No academic years found');
    }

    var dayDiff = Duration(days: 99999999999);
    var closest = listAcademicYears.first;

    for (final year in listAcademicYears) {
      final diff = year.batDauHoc.difference(now).abs();
      if (diff < dayDiff) {
        dayDiff = diff;
        closest = year;
      }
    }
    return closest;
  }
}

class StudentById extends AsyncNotifier<Student> {
  final int studentId;
  StudentById(this.studentId);

  @override
  Future<Student> build() async {
    return await Student.getById(studentId);
  }

  Future<void> updateStatus(TrangThaiHocVien status) async {
    switch (state) {
      case AsyncData():
        break;
      default:
        return; //no-op
    }

    final student = state.value!;
    await student.updateStatus(status);
    ref.invalidateSelf();
  }
}

class StudentsByCohort extends AsyncNotifier<List<Student>> {
  final Cohort cohort;
  StudentsByCohort(this.cohort);

  @override
  FutureOr<List<Student>> build() async {
    return await Student.getByClassOfYear(cohort);
  }
}

class TeacherByIdNotifier extends AsyncNotifier<Teacher> {
  final int teacherId;
  TeacherByIdNotifier(this.teacherId);

  @override
  Future<Teacher> build() async {
    return await Teacher.getById(teacherId);
  }

  Future<void> updateField<T>({
    required String fieldName,
    required T value,
  }) async {
    switch (state) {
      case AsyncData():
        break;
      default:
        return; //no-op
    }

    final teacher = state.value!;
    await teacher.updateField<T>(fieldName: fieldName, value: value);
    ref.invalidateSelf();
  }

  Future updateAcademicDegree({HocVi? degree, String? value}) async {
    if (degree != null) {
      await updateField(fieldName: "hocVi", value: degree.value);
    } else if (value != null) {
      await updateField(fieldName: "hocVi", value: value);
    } else {
      throw ArgumentError(
        "Either degree or value must be provided to update academic degree.",
      );
    }
  }

  Future updateAcademicRank({HocHam? rank, String? value}) async {
    if (rank != null) {
      await updateField(fieldName: "hocHam", value: rank.value);
    } else if (value != null) {
      await updateField(fieldName: "hocHam", value: value);
    } else {
      throw ArgumentError(
        "Either rank or value must be provided to update academic rank.",
      );
    }
  }

  Future updateUniversity(String universityName) async {
    return updateField(fieldName: "donVi", value: universityName);
  }

  Future updateName(String name) async {
    return updateField(fieldName: "hoTen", value: name);
  }

  Future updateStaffId(String? staffId) async {
    return updateField(fieldName: "maCanBo", value: staffId);
  }

  Future updateCitizenId(String? citizenId) async {
    return updateField(fieldName: "cccd", value: citizenId);
  }

  Future updatePhone(String? phone) async {
    return updateField(fieldName: "sdt", value: phone);
  }

  Future updateDateOfBirth(DateTime? date) async {
    final dateString = date != null ? datetimeToYyyymmdd(date) : null;
    updateField(fieldName: "ngaySinh", value: dateString);
  }

  Future updateEmail(String? email) async {
    return updateField(fieldName: "email", value: email);
  }

  Future updateGroup(int? ncm) async {
    return updateField(fieldName: "ncm", value: ncm);
  }

  Future updateGender(GioiTinh? gender) async {
    return updateField(fieldName: "gioiTinh", value: gender?.value);
  }

  Future updateTaxCode(String? taxCode) async {
    return updateField(fieldName: "mst", value: taxCode);
  }

  Future updateBankAccount(String? bankAccount) async {
    return updateField(fieldName: "stk", value: bankAccount);
  }

  Future updateBankName(String? bankName) async {
    return updateField(fieldName: "nganHang", value: bankName);
  }
}

// abstract class TeacherInformationProvider<T> extends AsyncNotifier<T> {
//   final int teacherId;
//   TeacherInformationProvider(this.teacherId);
//
//   String get field;
//
//   @override
//   Future<T> build() async {
//     final query = SelectQuery()
//       ..from(Teacher.table)
//       ..select([field])
//       ..where("id = ?", [teacherId]);
//
//     final sql = query.build();
//
//     return dbSession((db) async {
//       final rows = await db.rawQuery(sql);
//       return rows.first[field] as T;
//     });
//   }
//
//   Future<void> set(T value) async {
//     final query = UpdateQuery()
//       ..update(Teacher.table)
//       ..set({field: value})
//       ..where("id = ?", [teacherId]);
//
//     final sql = query.build();
//
//     await dbSession((db) async {
//       await db.rawUpdate(sql);
//     });
//
//     ref.invalidateSelf();
//   }
// }
//
// class TeacherPhoneNumberProvider extends TeacherInformationProvider<String?> {
//   TeacherPhoneNumberProvider(super.teacherId);
//
//   @override
//   String get field => 'so_dien_thoai';
// }
//
// class TeacherEmailProvider extends TeacherInformationProvider<String?> {
//   TeacherEmailProvider(super.teacherId);
//
//   @override
//   String get field => 'email';
// }
//
// class TeacherBankAccountProvider extends TeacherInformationProvider<String?> {
//   TeacherBankAccountProvider(super.teacherId);
//
//   @override
//   String get field => 'dia_chi';
// }
