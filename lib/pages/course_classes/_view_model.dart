import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business/db_v2_providers.dart';
import '../../business/drift_orm.dart';

final courseClassViewModelsProvider = AsyncNotifierProvider(
  CourseClassViewModelsNotifier.new,
);

final courseClassViewModelByIdProvider = AsyncNotifierProvider.family(
  CourseClassViewModelByIdNotifier.new,
);

final selectedSemesterProvider = AsyncNotifierProvider(
  SelectedSemesterNotifier.new,
);

@immutable
class CourseClassViewModel {
  final SemesterData semester;
  final CourseClassData courseClass;
  final Map<TeacherData, double> teachers;
  final CourseData course;
  final int registrationCount;

  const CourseClassViewModel({
    required this.semester,
    required this.courseClass,
    required this.teachers,
    required this.course,
    this.registrationCount = 0,
  });
}

class CourseClassViewModelByIdNotifier
    extends AsyncNotifier<CourseClassViewModel?> {
  final int courseClassId;
  CourseClassViewModelByIdNotifier(this.courseClassId);

  @override
  FutureOr<CourseClassViewModel?> build() async {
    final courseClass = await ref.watch(
      courseClassByIdProvider(courseClassId).future,
    );
    if (courseClass == null) return null;

    final course = await ref.watch(
      courseByIdProvider(courseClass.courseId).future,
    );
    if (course == null) return null;

    final semester = await ref.watch(
      semesterByIdProvider(courseClass.semester).future,
    );
    if (semester == null) return null;

    final teachingTeachers = await ref.watch(
      teachingTeachersProvider(courseClass.id).future,
    );

    final registrationCount = await ref.watch(
      registrationCountProvider(courseClass.id).future,
    );

    return CourseClassViewModel(
      semester: semester,
      courseClass: courseClass,
      teachers: teachingTeachers,
      course: course,
      registrationCount: registrationCount,
    );
  }
}

class CourseClassViewModelsNotifier
    extends AsyncNotifier<List<CourseClassViewModel>> {
  @override
  FutureOr<List<CourseClassViewModel>> build() async {
    final semester = await ref.watch(selectedSemesterProvider.future);
    if (semester == null) {
      return [];
    }

    final courseClassIds = await ref.watch(
      courseClassIdsBySemesterProvider(semester.semester).future,
    );

    final courseClassViewModels = <CourseClassViewModel>[];

    for (final id in courseClassIds) {
      final viewModel = await ref.watch(
        courseClassViewModelByIdProvider(id).future,
      );
      if (viewModel != null) {
        courseClassViewModels.add(viewModel);
      }
    }

    return courseClassViewModels;
  }
}

class SelectedSemesterNotifier extends AsyncNotifier<SemesterData?> {
  static const String key = "course-classes/selected-semester";
  @override
  FutureOr<SemesterData?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final semesters = await ref.watch(semestersProvider.future);
    final saved = prefs.getString(key);
    for (final semester in semesters) {
      if (semester.semester == saved) {
        return semester;
      }
    }
    return null;
  }

  Future<void> set(SemesterData? semester) async {
    state = const AsyncValue.loading();
    final prefs = await SharedPreferences.getInstance();
    if (semester == null) {
      await prefs.remove(key);
      state = const AsyncValue.data(null);
    } else {
      await prefs.setString(key, semester.semester);
      state = AsyncValue.data(semester);
    }
  }
}
