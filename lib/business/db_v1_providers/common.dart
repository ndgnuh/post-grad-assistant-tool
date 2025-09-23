import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../domain_objects.dart';

final cohortsProvider = AsyncNotifierProvider(Cohorts.new);

final academicYearsProvider = AsyncNotifierProvider(AcademicYears.new);
final currentAcademicYearProvider = AsyncNotifierProvider(
  CurrentAcademicYear.new,
);
final studentByIdProvider = AsyncNotifierProvider.family(StudentById.new);
final studentByCohortProvider = AsyncNotifierProvider.family(
  StudentsByCohort.new,
);
final teacherByIdProvider = AsyncNotifierProvider.family(TeacherById.new);

class Cohorts extends AsyncNotifier<List<Cohort>> {
  @override
  FutureOr<List<Cohort>> build() async {
    return await Cohort.all();
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

class TeacherById extends AsyncNotifier<Teacher> {
  final int teacherId;
  TeacherById(this.teacherId);

  @override
  Future<Teacher> build() async {
    return await Teacher.getById(teacherId);
  }
}

class AcademicYears extends AsyncNotifier<List<AcademicYear>> {
  @override
  FutureOr<List<AcademicYear>> build() async {
    return await AcademicYear.all();
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
