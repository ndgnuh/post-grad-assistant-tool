import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './providers.dart';

class CohortSelector extends ConsumerWidget {
  const CohortSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(cohortSelectionModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError():
        return const Text('Error loading cohorts');
      default:
    }

    final model = modelAsync.value!;

    return DropdownMenu(
      expandedInsets: EdgeInsets.zero,
      initialSelection: model.selected,
      label: const Text('Niên khóa NCS'),
      dropdownMenuEntries: [
        for (final option in model.options)
          DropdownMenuEntry(
            value: option,
            label: option,
          ),
      ],
      onSelected: (String? value) {
        ref.read(cohortSelectionModelProvider.notifier).select(value);
      },
    );
  }
}
