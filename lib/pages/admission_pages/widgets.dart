import '../../business/db_v2_providers/students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/copy_pasta.dart';
import '../../business/main_database.dart';
import 'providers.dart';

/// Create a heading for expansion panel
Widget Function(BuildContext, bool) simpleExpansionHeading(String text) {
  Widget buildHeading(context, isExpanded) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  return buildHeading;
}

class CohortSelector extends ConsumerWidget {
  const CohortSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelState = ref.watch(cohortSelectionProvider);
    switch (modelState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return const Center(child: Text("Lỗi tải dữ liệu."));
      default:
    }

    final model = modelState.value!;

    return DropdownMenu<CohortData>(
      label: const Text("Khóa"),
      expandedInsets: EdgeInsets.zero,
      initialSelection: model.selected,
      dropdownMenuEntries: [
        for (final cohort in model.options)
          DropdownMenuEntry(
            value: cohort,
            label: cohort.id,
          ),
      ],
      onSelected: (cohort) {
        // set selected cohort
        final notifier = ref.read(cohortSelectionProvider.notifier);
        notifier.select(cohort);
      },
    );
  }
}

class CouncilSelector extends ConsumerWidget {
  const CouncilSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelState = ref.watch(admissionCouncilSelectionProvider);
    switch (modelState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return const Center(child: Text("Lỗi tải dữ liệu."));
      default:
    }

    final model = modelState.value!;

    return DropdownMenu<AdmissionCouncilData>(
      label: const Text("Hội đồng"),
      expandedInsets: EdgeInsets.zero,
      initialSelection: model.selected,
      dropdownMenuEntries: [
        for (final council in model.options)
          DropdownMenuEntry(
            value: council,
            label: "Tiểu ban ${council.year}",
          ),
      ],
      onSelected: (council) {
        // set selected cohort
        final notifier = ref.read(admissionCouncilSelectionProvider.notifier);
        notifier.select(council);
      },
    );
  }
}

class AcceptanceEmailSender extends ConsumerWidget {
  final Widget Function(BuildContext, VoidCallback) builder;
  const AcceptanceEmailSender({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    return builder(context, () async {
      final email = await ref.read(acceptanceEmailProvider.future);
      if (email == null) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text("Chọn khóa học viên để hiển thị email"),
          ),
        );
        return;
      }

      if (context.mounted == false) return;
      await showDialog(
        context: context,
        builder: (context) => EmailCopyDialog(email: email),
      );
    });
  }
}

class InterviewEmailSender extends ConsumerWidget {
  final Widget Function(BuildContext, VoidCallback) builder;
  const InterviewEmailSender({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return builder(context, () async {
      final email = await ref.read(interviewEmailProvider.future);
      if (context.mounted == false) return;
      await showDialog(
        context: context,
        builder: (context) => EmailCopyDialog(email: email),
      );
    });
  }
}

class EnrollButtonBuilder extends ConsumerWidget {
  final int studentUid;
  final TextEditingController studentIdController;
  final TextEditingController schoolEmailController;
  final Widget Function(BuildContext context, VoidCallback callback) builder;

  const EnrollButtonBuilder({
    super.key,
    required this.studentUid,
    required this.builder,
    required this.studentIdController,
    required this.schoolEmailController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    return builder(context, () async {
      // Check student ID and school email are not empty
      final studentId = studentIdController.text.trim();
      final schoolEmail = schoolEmailController.text.trim();
      if (studentId.isEmpty || schoolEmail.isEmpty) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text(
              "Mã số học viên và email đại học cấp không được để trống",
            ),
          ),
        );
        return;
      }

      final cohortModel = await ref.read(cohortSelectionProvider.future);
      final councilModel = await ref.read(
        admissionCouncilSelectionProvider.future,
      );

      final cohort = cohortModel.selected;
      final council = councilModel.selected;
      if (cohort == null || council == null) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text("Chọn tiểu ban xét tuyển & khóa học viên"),
          ),
        );
        return;
      }

      final notifier = ref.read(studentMutationProvider(studentUid).notifier);
      await notifier.enroll(
        cohortId: cohort.id,
        studentId: studentId,
        schoolEmail: schoolEmail,
        admissionCouncilId: council.id,
      );

      navigator.pop();
      messenger.showSnackBar(
        const SnackBar(
          content: Text("Nhập học thành công"),
        ),
      );
    });
  }
}
