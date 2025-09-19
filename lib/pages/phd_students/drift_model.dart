import 'package:fami_tools/business/db_v2_providers/phd_students.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../business/db_v2_providers.dart';
import '../../business/drift_orm.dart';

final filteredPhdStudentsProvider = AsyncNotifierProvider(
  FilteredPhdStudentsNotifier.new,
);
final phdStudentViewModelByIdProvider = AsyncNotifierProvider.family(
  PhdStudentViewModelNotifier.new,
);
final selectedCohortProvider = NotifierProvider(
  SelectedCohortNotifier.new,
);

class FilteredPhdStudentsNotifier
    extends AsyncNotifier<List<PhdStudentViewModel>> {
  @override
  FutureOr<List<PhdStudentViewModel>> build() async {
    final selectedCohort = ref.watch(selectedCohortProvider);
    if (selectedCohort == null) {
      return [];
    }

    final students = await ref.watch(
      phdStudentIdsByCohortProvider(selectedCohort).future,
    );

    final viewModels = <PhdStudentViewModel>[];
    for (final id in students) {
      final viewModel = await ref.watch(
        phdStudentViewModelByIdProvider(id).future,
      );
      viewModels.add(viewModel!);
    }
    return viewModels;
  }
}

class PhdStudentViewModel {
  final PhdStudentData student;
  final TeacherData supervisor;
  final TeacherData? secondarySupervisor;

  PhdStudentViewModel({
    required this.student,
    required this.supervisor,
    this.secondarySupervisor,
  });
}

class PhdStudentViewModelNotifier extends AsyncNotifier<PhdStudentViewModel?> {
  final int studentId;
  PhdStudentViewModelNotifier(this.studentId);
  @override
  FutureOr<PhdStudentViewModel?> build() async {
    final student = await ref.watch(phdStudentByIdProvider(studentId).future);
    final supervisorId = student?.supervisorId;
    final secondarySupervisorId = student?.secondarySupervisorId;

    final supervisor = await ref.watch(
      teacherByIdProvider(supervisorId!).future,
    );
    final secondarySupervisor = secondarySupervisorId != null
        ? await ref.watch(teacherByIdProvider(secondarySupervisorId).future)
        : null;

    return PhdStudentViewModel(
      student: student!,
      supervisor: supervisor!,
      secondarySupervisor: secondarySupervisor,
    );
  }
}

class SelectedCohortNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void select(String? cohort) {
    state = cohort;
  }
}

// @riverpod
// Future<PhdStudentsViewModelData> phdStudentsViewModel(
//   Ref ref,
//   String selectedCohort,
// ) async {
//   final students = await ref.watch(
//     phdStudentsByCohortsProvider(selectedCohort).future,
//   );
//
//   final supervisors = <int, TeacherData>{};
//   for (final student in students) {
//     final supervisorId = student.supervisorId;
//     final supervisor = await ref.watch(
//       teacherByIdProvider(supervisorId).future,
//     );
//     supervisors[supervisorId] = supervisor!;
//   }
//
//   return (
//     students: students,
//     supervisors: supervisors,
//   );
// }
