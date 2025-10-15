import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../business/db_v1_providers.dart' as v1_providers;
import '../../business/db_v2_providers.dart';
import '../../business/domain_objects.dart' as v1;
import '../../business/selection_models.dart';

final cohortSelectionModelProvider = AsyncNotifierProvider(
  () => CohortSelectionModelNotifier("student-list"),
);

final filterModeSelectionModelProvider = AsyncNotifierProvider(
  () => FilterModeSelectionModelNotifier("student-list"),
);

final searchModelProvider = NotifierProvider(
  () => SearchModelNotifier(),
);

final studentListViewModelProvider = AsyncNotifierProvider(
  StudentListViewModelNotifier.new,
);

typedef CohortSelectionModel = SelectionModel<CohortData?>;

class SearchModelNotifier extends Notifier<String> {
  late FocusNode focusNode;
  late Duration duration;
  late Timer timer;

  SearchModelNotifier() {
    duration = Duration(milliseconds: 250);
    focusNode = FocusNode();
    timer = Timer(Duration(seconds: 0), () {});
  }

  @override
  String build() => "";

  void debounceSet(String value) {
    if (timer.isActive) timer.cancel();
    timer = Timer(duration, () {
      set(value);
    });
  }

  void set(String value) {
    state = value;
  }
}

class StudentListViewModel {
  final bool needToSetFilter;

  final List<StudentData> students;
  final List<v1.HocVien> v1Students; // Until we update all the student page
  const StudentListViewModel({
    required this.students,
    required this.v1Students,
    required this.needToSetFilter,
  });
}

class StudentListViewModelNotifier extends AsyncNotifier<StudentListViewModel> {
  @override
  FutureOr<StudentListViewModel> build() async {
    final cohortModel = await ref.watch(cohortSelectionModelProvider.future);
    final searchQuery = ref.watch(searchModelProvider);
    final cohort = cohortModel.selected;
    final filterModeModel = await ref.watch(
      filterModeSelectionModelProvider.future,
    );
    final filterMode = filterModeModel.selected ?? FilterMode.or;

    if (cohort == null && searchQuery.isEmpty) {
      return StudentListViewModel(
        students: [],
        v1Students: [],
        needToSetFilter: true,
      );
    }

    // Query the Ids from DB
    final db = await ref.watch(driftDatabaseProvider.future);
    final (fallback) = switch (filterMode) {
      FilterMode.and => true,
      FilterMode.or => false,
    };

    final stmt = db.student.select()
      ..orderBy([
        (Student student) => OrderingTerm(
          expression: student.cohort,
          mode: OrderingMode.desc,
        ),
        (Student student) => OrderingTerm(
          expression: student.studentId,
          mode: OrderingMode.asc,
        ),
      ])
      ..where((student) {
        final c1 = cohortFilter(student, cohort, fallback);
        final c2 = searchFilter(student, searchQuery.trim(), fallback);
        return switch (filterMode) {
          FilterMode.and => [c1, c2].reduce((a, b) => a & b),
          FilterMode.or => [c1, c2].reduce((a, b) => a | b),
        };
      });
    final ids = await stmt.map((student) => student.id).get();

    final students = <StudentData>[];
    final v1Students = <v1.HocVien>[];
    for (final id in ids) {
      final student = await ref.watch(studentByIdProvider(id).future);
      if (student != null) {
        final v1Student = await ref.watch(
          v1_providers.studentByIdProvider(id).future,
        );
        students.add(student);
        v1Students.add(v1Student);
      }
    }

    return StudentListViewModel(
      students: students,
      v1Students: v1Students,
      needToSetFilter: false,
    );
  }

  Expression<bool> cohortFilter(
    Student student,
    CohortData? cohort,
    bool fallback,
  ) {
    return switch (cohort) {
      CohortData cohort => student.cohort.equals(cohort.cohort),
      _ => Constant(fallback),
    };
  }

  Expression<bool> searchFilter(
    Student student,
    String searchQuery,
    bool fallback,
  ) {
    if (searchQuery.isEmpty) return Constant(fallback);
    return student.name.contains(searchQuery) |
        student.studentId.contains(searchQuery) |
        student.cohort.contains(searchQuery) |
        student.personalEmail.contains(searchQuery);
  }
}
