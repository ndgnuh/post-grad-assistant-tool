import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        print(error);
        print(stackTrace);
        return Text('Error loading cohorts');
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

    final subtitleParts = <String>[];
    // subtitleParts.add('HD1: ${supervisor.name}');
    // subtitleParts.add('HD2: ${secondarySupervisor?.name ?? ""}');
    subtitleParts.add('Chủ tịch: ${model.admissionPresident?.name ?? ""}');
    subtitleParts.add('Thư ký: ${model.admissionPresident?.name ?? ""}');
    subtitleParts.add('Ủy viên 1: ${model.admissionMember1?.name ?? ""}');
    subtitleParts.add('Ủy viên 2: ${model.admissionMember2?.name ?? ""}');
    subtitleParts.add('Ủy viên 3: ${model.admissionMember3?.name ?? ""}');

    final helper = model.admissionHelper;
    if (helper != null) {
      subtitleParts.add('Người hỗ trợ: ${helper.name}');
    }

    return ListTile(
      title: Text(student.name),
      subtitle: Text(subtitleParts.join('\n')),
    );
  }
}
