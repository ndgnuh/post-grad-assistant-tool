import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../business/db_v1_providers.dart' as v1_providers;
import '../../business/drift_orm.dart';
import './providers.dart';

class CohortSelector extends ConsumerWidget {
  const CohortSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Wait for selection model
    final modelAsync = ref.watch(cohortSelectionModelProvider);
    switch (modelAsync) {
      case AsyncLoading _:
        return CircularProgressIndicator();
      case AsyncError(:final error):
        return Text('Error loading cohorts $error');
      default:
    }

    final model = modelAsync.value!;
    final selectedCohort = model.selected;
    final cohorts = model.options;
    final controller = model.labelController;

    void select(CohortData? value) {
      final notifier = ref.read(cohortSelectionModelProvider.notifier);
      notifier.select(value);
    }

    return DropdownMenu<CohortData>(
      initialSelection: selectedCohort,
      label: Text('Niên khóa'),
      controller: controller,
      expandedInsets: EdgeInsets.zero,
      enableSearch: true,
      enableFilter: true,
      onSelected: select,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      dropdownMenuEntries: [
        for (final cohort in cohorts)
          DropdownMenuEntry(
            value: cohort,
            label: cohort.cohort,
          ),
      ],
    );
  }
}

class CohortReset extends ConsumerWidget {
  const CohortReset({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton.icon(
      onPressed: () {
        final notifier = ref.read(cohortSelectionModelProvider.notifier);
        notifier.deselect();
      },
      icon: Icon(Symbols.clear),
      label: Text('Bỏ chọn'),
    );
  }
}

class StudentSearchBar extends ConsumerWidget {
  const StudentSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(searchModelProvider.notifier);

    return IntrinsicWidth(
      child: TextField(
        focusNode: notifier.focusNode,
        onChanged: (text) => notifier.debounceSet(text),
        onSubmitted: (text) => notifier.set(text),
        // onFieldSubmitted: (text) => notifier.set(text),
        decoration: InputDecoration(
          labelText: 'Tìm học viên',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: Icon(Symbols.search),
        ),
      ),
    );
  }
}

class FilterModeButton extends ConsumerWidget {
  const FilterModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(filterModeSelectionModelProvider);
    switch (modelAsync) {
      case AsyncLoading _:
        return SizedBox.square(child: CircularProgressIndicator());
      case AsyncError(:final error):
        return Text("Error $error");
      default:
    }

    final model = modelAsync.value!;
    final selected = model.selected ?? FilterMode.or;
    final options = model.options;

    return AspectRatio(
      aspectRatio: 1.5,
      child: OutlinedButton(
        onPressed: () {
          final notifier = ref.read(filterModeSelectionModelProvider.notifier);
          notifier.cycle();
        },
        child: Text(selected.label),
      ),
    );

    return SegmentedButton<FilterMode>(
      expandedInsets: EdgeInsets.zero,
      segments: [
        for (final option in options)
          ButtonSegment(
            value: option,
            label: Text(option.label),
          ),
      ],
      multiSelectionEnabled: false,
      showSelectedIcon: false,
      selected: {selected},
      onSelectionChanged: (selections) {
        final notifier = ref.read(filterModeSelectionModelProvider.notifier);
        notifier.select(selections.firstOrNull);
      },
    );
  }
}

class StudentReloadButton extends ConsumerWidget {
  const StudentReloadButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: IconButton.filled(
        onPressed: () {
          ref.invalidate(studentListViewModelProvider);
          ref.invalidate(studentByIdProvider);
          ref.invalidate(v1_providers.studentByIdProvider);
        },
        icon: Icon(Symbols.refresh),
      ),
    );
  }
}
