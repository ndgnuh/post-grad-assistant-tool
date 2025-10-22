import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/copy_pasta.dart';
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

    return DropdownMenu<String?>(
      expandedInsets: EdgeInsets.zero,
      initialSelection: model.selected,
      label: const Text('Niên khóa NCS'),
      dropdownMenuEntries: [
        for (final option in model.options)
          DropdownMenuEntry(
            value: option,
            label: option ?? 'Tất cả',
          ),
      ],
      onSelected: (String? value) {
        ref.read(cohortSelectionModelProvider.notifier).select(value);
      },
    );
  }
}

class AdmissionCouncilArrangementEmailButton extends ConsumerWidget {
  final int phdStudentId;
  final Widget Function(BuildContext, VoidCallback) builder;

  const AdmissionCouncilArrangementEmailButton({
    super.key,
    required this.phdStudentId,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailAsync = ref.watch(
      admissionCouncilArrangementEmailNotifier(phdStudentId),
    );
    switch (emailAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text('Error preparing email: $error');
      default:
    }

    void callback() {
      final email = emailAsync.value!;
      showDialog(
        context: context,
        builder: (context) => EmailCopyDialog(email: email),
      );
    }

    return builder(context, callback);
  }
}
