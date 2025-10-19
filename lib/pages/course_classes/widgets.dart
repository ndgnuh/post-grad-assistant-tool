import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../business/drift_orm.dart';
import './providers.dart';

class SemesterPicker extends ConsumerWidget {
  const SemesterPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.read(semesterSelectionModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncError(:final error):
        return Text("Error: $error");
      default:
    }

    final model = modelAsync.value!;

    return DropdownMenu<SemesterData>(
      label: Text("Đợt học"),
      initialSelection: model.selected,
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: [
        for (final semester in model.options)
          DropdownMenuEntry(
            value: semester,
            label: semester.semester.toString(),
          ),
      ],
      onSelected: (value) async {
        final notifier = ref.read(semesterSelectionModelProvider.notifier);
        notifier.select(value);
      },
    );
  }
}

class RegistrationNotificationButton extends ConsumerWidget {
  final Widget Function(BuildContext context, String? message) builder;

  const RegistrationNotificationButton({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageAsync = ref.watch(courseRegistrationNotificationProvider);
    switch (messageAsync) {
      case AsyncLoading _:
        return builder(context, null);
      case AsyncError(:final error):
        return Text("Error: $error");
      case AsyncData(:final value):
        return builder(context, value);
    }
  }
}
