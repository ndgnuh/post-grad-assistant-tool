import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../business/drift_orm.dart';
import '../../business/selection_models.dart';

final cohortSelectionModelProvider = AsyncNotifierProvider(
  () => PhdCohortSelectionModelNotifier("phd-students"),
);

final phdStudentListViewModelProvider = AsyncNotifierProvider(
  PhdStudentListViewModelNotifier.new,
);

class PhdStudentListViewModel {
  final String? cohort;
  final List<PhdStudentData> students;
  final Map<PhdStudentData, TeacherData> supervisors;
  final Map<PhdStudentData, TeacherData?> secondarySupervisor;

  PhdStudentListViewModel({
    required this.cohort,
    required this.students,
    required this.supervisors,
    required this.secondarySupervisor,
  });
}

class PhdStudentListViewModelNotifier
    extends AsyncNotifier<PhdStudentListViewModel> {
  @override
  Future<PhdStudentListViewModel> build() async {
    // Get selected cohort
    final cohortModel = await ref.watch(cohortSelectionModelProvider.future);
    final cohort = cohortModel.selected;
    if (cohort == null) {
      return PhdStudentListViewModel(
        cohort: null,
        students: [],
        supervisors: {},
        secondarySupervisor: {},
      );
    }

    // Get student of cohorts along with their supervisors
    final ids = await ref.watch(phdStudentIdsByCohortProvider(cohort).future);
    final students = <PhdStudentData>[];
    final supervisors = <PhdStudentData, TeacherData>{};
    final secondarySupervisors = <PhdStudentData, TeacherData?>{};
    for (var id in ids) {
      final student = await ref.watch(phdStudentByIdProvider(id).future);
      if (student == null) continue;

      final supervisor = await ref.watch(
        teacherByIdProvider(student.supervisorId).future,
      );

      final secondarySupervisor = switch (student.secondarySupervisorId) {
        null => null,
        int id => await ref.watch(teacherByIdProvider(id).future),
      };

      if (supervisor != null) {
        students.add(student);
        supervisors[student] = supervisor;
        secondarySupervisors[student] = secondarySupervisor;
      }
    }

    return PhdStudentListViewModel(
      cohort: cohort,
      students: students,
      supervisors: supervisors,
      secondarySupervisor: secondarySupervisors,
    );
  }
}
