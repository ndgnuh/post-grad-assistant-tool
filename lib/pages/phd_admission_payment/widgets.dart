import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './providers.dart';

class CohortDropdown extends ConsumerWidget {
  const CohortDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncModel = ref.watch(phdCohortSelectionProvider);

    switch (asyncModel) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError():
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
            label: cohort.toString(),
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
    final asyncPhdIds = ref.watch(phdIdsProvider);

    final ids = asyncPhdIds.maybeWhen(
      data: (ids) => ids,
      orElse: () => null,
    );

    if (ids == null) {
      return LinearProgressIndicator();
    }

    if (ids.isEmpty) {
      return Text('Không có NCS trong khóa đã chọn.');
    }

    return ListView.builder(
      itemCount: ids.length,
      itemBuilder: (context, index) {
        final id = ids[index];
        return ListTile(
          title: Text('Ph.D. Student ID: $id'),
        );
      },
    );
  }
}
