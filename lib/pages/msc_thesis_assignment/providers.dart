import 'package:fami_tools/business/selection_models.dart';
import 'package:riverpod/riverpod.dart';
import '../../business/db_v2_providers.dart';

final _name = "msc-thesis-assignment";

final cohortSelectionProvider = AsyncNotifierProvider(
  () => CohortSelectionModelNotifier(_name),
);

final assignmentViewModelProvider = FutureProvider.family(
  (ref, int studentId) async {
    final student = await ref.watch(studentByIdProvider(studentId).future);

    /// Get thesis
    final thesisId = await ref.watch(
      thesisIdByStudentProvider(studentId).future,
    );
    if (thesisId == null) {
      return AssignmentModel(
        student: student,
        thesis: null,
        supervisor: null,
      );
    }

    final thesis = await ref.watch(
      thesisByIdProvider(thesisId).future,
    );
    final supervisor = await ref.watch(
      teacherByIdProvider(thesis.supervisorId).future,
    );

    return AssignmentModel(
      student: student,
      thesis: thesis,
      supervisor: supervisor,
    );
  },
);

final studentIdsProvider = FutureProvider<List<int>?>((ref) async {
  /// Return null so that the UI prompt
  /// the user to select cohort
  final cohortModel = await ref.watch(cohortSelectionProvider.future);
  final selectedCohort = cohortModel.selected;
  if (selectedCohort == null) return null;

  /// Get student ids by cohort
  final studentIds = await ref.read(
    studentIdsByCohortProvider(selectedCohort).future,
  );

  return studentIds;
});

class AssignmentModel {
  final StudentData student;
  final ThesisData? thesis;
  final TeacherData? supervisor;
  AssignmentModel({
    required this.student,
    this.thesis,
    this.supervisor,
  });
}
