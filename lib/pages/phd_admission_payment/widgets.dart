import 'package:fami_tools/pages/phd_student_pages/phd_student_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/main_database.dart';
import '../../business/view_models.dart';
import './providers.dart';

class CohortDropdown extends ConsumerWidget {
  const CohortDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncModel = ref.watch(phdCohortSelectionProvider);

    switch (asyncModel) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        return ErrorWidget(error);
      default:
    }

    final model = asyncModel.value!;

    return DropdownMenu(
      initialSelection: model.selected,
      label: Text('Khóa NCS'),
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: [
        for (final cohort in model.options)
          DropdownMenuEntry(
            value: cohort,
            label: cohort?.cohort.toString() ?? "Chọn một khóa",
          ),
      ],
      onSelected: (newCohort) {
        if (newCohort != null) {
          ref.read(phdCohortSelectionProvider.notifier).select(newCohort);
        }
      },
    );
  }
}

class PhdStudentListView extends ConsumerWidget {
  const PhdStudentListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPhdIds = ref.watch(phdStudentIdsProvider);

    switch (asyncPhdIds) {
      case AsyncLoading():
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        print(stackTrace);
        return Center(child: Text('Error loading Ph.D. student IDs: $error'));
      default:
    }

    final ids = asyncPhdIds.value!;
    if (ids.isEmpty) {
      return Center(
        child: Text('No Ph.D. students found for the selected cohort.'),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: ids.length,
      itemBuilder: (context, index) {
        final id = ids[index];
        return _PhdPaymentTile(id: id);
      },
    );
  }
}

class _PhdPaymentTile extends ConsumerWidget {
  const _PhdPaymentTile({
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(PhdStudentViewModel.providerById(id));
    switch (modelAsync) {
      case AsyncLoading():
        return ListTile(
          title: Text('Loading Ph.D. Student ID: $id'),
          subtitle: LinearProgressIndicator(),
        );
      case AsyncError(:final error):
        return ListTile(
          title: Text('Error loading Ph.D. Student ID: $id'),
          subtitle: Text('Error: $error'),
        );
      default:
    }

    final model = modelAsync.value!;
    final student = model.student;
    // final supervisor = model.supervisor;
    // final secondarySupervisor = model.secondarySupervisor;

    /// Teacher subtitle line
    String teacherStl(TeacherData? teacher, String role) {
      if (teacher != null) {
        return '$role: ${teacher.name} - ${teacher.university}';
      } else {
        return '$role: ';
      }
    }

    final subtitleParts = <String>[
      teacherStl(model.admissionPresident, 'Chủ tịch'),
      teacherStl(model.admissionSecretary, 'Thư ký'),
      teacherStl(model.admissionMember1, 'Ủy viên'),
      teacherStl(model.admissionMember2, 'Ủy viên'),
      teacherStl(model.admissionMember3, 'Ủy viên'),
    ];
    // subtitleParts.add('HD1: ${supervisor.name}');
    // subtitleParts.add('HD2: ${secondarySupervisor?.name ?? ""}');

    final helper = model.admissionHelper;
    if (helper != null) {
      subtitleParts.add('Người hỗ trợ: ${helper.name}');
    }

    final navigator = Navigator.of(context);

    return ListTile(
      title: Text(student.name),
      subtitle: Text(subtitleParts.join('\n')),
      onTap: () {
        navigator.push(
          MaterialPageRoute(
            builder: (context) => PhdStudentDetailsPage(studentId: id),
          ),
        );
      },
    );
  }
}
