import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

class StudentViewModel {
  final StudentData student;
  final CohortData? cohort; // Unofficial student does not have cohort
  final ThesisData? thesis;
  final TeacherData? supervisor;
  final TeacherData? secondarySupervisor;

  const StudentViewModel({
    required this.student,
    required this.cohort,
    required this.thesis,
    required this.supervisor,
    required this.secondarySupervisor,
  });

  /// Provide a [StudentViewModel] by student ID
  static final providerById = _byId;
}

final _byId = FutureProvider.family(
  (Ref ref, int id) async {
    final student = await ref.watch(studentByIdProvider(id).future);

    final cohort = switch (student.cohort) {
      String cId => await ref.watch(cohortByIdProvider(cId).future),
      null => null,
    };

    final thesisId = await ref.watch(thesisIdByStudentProvider(id).future);
    final thesis = switch (thesisId) {
      int tId => await ref.watch(thesisByIdProvider(tId).future),
      null => null,
    };

    final TeacherData? supervisor;
    final TeacherData? secondarySupervisor;
    if (thesis != null) {
      supervisor = await ref.watch(
        teacherByIdProvider(thesis.supervisorId).future,
      );

      // TODO: proper implementation for secondary supervisor
      secondarySupervisor = null;
      // secondarySupervisor = switch (thesis.secondarySupervisorId) {
      //   int sId => await ref.watch(teacherByIdProvider(sId).future),
      //   null => null,
      // };
    } else {
      supervisor = null;
      secondarySupervisor = null;
    }

    return StudentViewModel(
      student: student,
      cohort: cohort,
      supervisor: supervisor,
      secondarySupervisor: secondarySupervisor,
      thesis: thesis,
    );
  },
);
