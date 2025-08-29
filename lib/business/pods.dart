import './domain_objects.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';
// import 'dart:io';

part 'pods.g.dart';

@riverpod
Future<List<Semester>> allAcademicYears(Ref ref) async {
  return await HocKy.all();
}

@riverpod
Future<List<Cohort>> allCohorts(Ref ref) async {
  return await NienKhoa.all();
}

@riverpod
Future<List<Cohort>> searchCohorts(Ref ref, String searchQuery) async {
  if (searchQuery.isEmpty) {
    return [];
  }
  return await Cohort.search(searchQuery);
}

@riverpod
Future<HocKy> getCurrentAcademicYear(Ref ref) async {
  final listAcademicYears = await ref.watch(
    allAcademicYearsProvider.future,
  );
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

@Riverpod(keepAlive: true)
Future<List<Student>> getStudentsByCohort(Ref ref, Cohort cohort) async {
  return await Student.search(classOfYear: cohort);
}

@riverpod
Future<Map<Student, Thesis?>> getThesisByStudentOfCohorts(
  Ref ref,
  Cohort cohort,
) async {
  final students = await ref.watch(getStudentsByCohortProvider(cohort).future);

  final result = <Student, Thesis?>{};
  for (final student in students) {
    result[student] = await Thesis.getByStudentId(student.id);
  }
  return result;
}

// @riverpod
// Future<NienKhoa?> getThesisAssignmentCohort(Ref ref) async {
//   final cohorts = await ref.watch(allCohortsProvider.future);
//   final today = DateTime.now();
//   final supposedStart = today.subtract(const Duration(days: 30 * 6));
//   for (final cohort in cohorts) {}
// }

@riverpod
Future<Teacher> teacherById(Ref ref, int id) async {
  final teacher = await Teacher.getById(id);
  return teacher;
}

@riverpod
Future<Student> studentById(Ref ref, int id) async {
  final student = await Student.getById(id);
  return student;
}
