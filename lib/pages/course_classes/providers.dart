import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business/db_v2_providers.dart';
import '../../business/drift_orm.dart';
import '../../business/selection_models.dart';

final courseClassViewModelsProvider = AsyncNotifierProvider(
  CourseClassViewModelsNotifier.new,
);

final courseClassViewModelByIdProvider = AsyncNotifierProvider.family(
  CourseClassViewModelByIdNotifier.new,
);

final semesterSelectionModelProvider = AsyncNotifierProvider(
  () => SemesterSelectionModelNotifier("course-class"),
);

@immutable
class CourseClassViewModel {
  final CourseClassData courseClass;
  final Map<TeacherData, double> teachers;
  final CourseData course;
  final int registrationCount;

  const CourseClassViewModel({
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
    final semesterModel = await ref.watch(
      semesterSelectionModelProvider.future,
    );
    if (semesterModel.selected == null) {
      return [];
    }

    final semester = semesterModel.selected!;

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
