import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/copy_pasta.dart';
import '../../business/db_v2_providers.dart';
import './providers.dart';

class PhdStudentInfo extends ConsumerWidget {
  final int studentId;
  final Widget Function(BuildContext, PhdStudentData) builder;
  final Widget loading;
  const PhdStudentInfo({
    super.key,
    this.loading = const CircularProgressIndicator(),
    required this.studentId,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phdStudentAsync = ref.watch(phdStudentByIdProvider(studentId));
    return phdStudentAsync.when(
      data: (phdStudent) => builder(context, phdStudent),
      loading: () => loading,
      error: (error, stack) => Text("Lỗi: $error"),
    );
  }
}

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

    return DropdownMenu<PhdCohortData?>(
      expandedInsets: EdgeInsets.zero,
      initialSelection: model.selected,
      label: const Text('Niên khóa NCS'),
      dropdownMenuEntries: [
        for (final option in model.options)
          DropdownMenuEntry(
            value: option,
            label: option?.cohort ?? "Tất cả niên khóa",
          ),
      ],
      onSelected: (PhdCohortData? value) {
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
