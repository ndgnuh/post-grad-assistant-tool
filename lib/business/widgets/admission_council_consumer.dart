import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db_v2_providers.dart';

final _councilProviders = StreamProvider((ref) async* {
  final db = await ref.watch(mainDatabaseProvider.future);
  final stmt = db.select(db.admissionCouncil);
  yield* stmt.watch();
});

abstract class AdmissionCouncilConsumerWidget extends ConsumerWidget {
  const AdmissionCouncilConsumerWidget({super.key});

  Widget buildSuccess(
    BuildContext context,
    WidgetRef ref,
    List<AdmissionCouncilData> councilList,
  );

  Widget buildError(
    BuildContext context,
    WidgetRef ref,
    error,
    StackTrace stackTrace,
  ) {
    if (kDebugMode) {
      print(stackTrace);
    }
    return Center(
      child: Text("Đã có lỗi xảy ra"),
    );
  }

  Widget buildLoading(
    BuildContext context,
    WidgetRef ref,
  ) => Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelState = ref.watch(_councilProviders);
    switch (modelState) {
      case AsyncLoading():
        return buildLoading(context, ref);
      case AsyncError(:final error, :final stackTrace):
        return buildError(context, ref, error, stackTrace);
      case AsyncData(value: final councilList):
        return buildSuccess(context, ref, councilList);
    }
  }
}

class AdmissionCouncilConsumer extends ConsumerWidget {
  final Widget Function(BuildContext, List<AdmissionCouncilData>) buildSuccess;
  final Widget Function(BuildContext, Object, StackTrace) buildError;
  final Widget Function(BuildContext) buildLoading;
  const AdmissionCouncilConsumer({
    super.key,
    required this.buildSuccess,
    this.buildError = _buildError,
    this.buildLoading = _buildLoading,
  });

  static Widget _buildError(
    BuildContext context,
    error,
    StackTrace stackTrace,
  ) {
    if (kDebugMode) {
      print(stackTrace);
    }
    return Center(
      child: Text("Đã có lỗi xảy ra"),
    );
  }

  static Widget _buildLoading(
    BuildContext context,
  ) => Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelState = ref.watch(_councilProviders);
    switch (modelState) {
      case AsyncLoading():
        return buildLoading(context);
      case AsyncError(:final error, :final stackTrace):
        return buildError(context, error, stackTrace);
      case AsyncData(value: final councilList):
        return buildSuccess(context, councilList);
    }
  }
}

class AdmissionCouncilPicker extends StatefulWidget {
  final AdmissionCouncilData? initialSelection;
  final ValueNotifier<AdmissionCouncilData?>? notifier;
  final FormFieldValidator<AdmissionCouncilData?>? validator;
  const AdmissionCouncilPicker({
    super.key,
    this.initialSelection,
    this.notifier,
    this.validator,
  });

  @override
  State<AdmissionCouncilPicker> createState() => _AdmissionCouncilPickerState();
}

class _AdmissionCouncilPickerState extends State<AdmissionCouncilPicker> {
  late ValueNotifier<AdmissionCouncilData?> notifier;

  @override
  initState() {
    super.initState();

    /// Initialize notifier
    if (widget.notifier == null) {
      notifier = ValueNotifier(null);
    } else {
      notifier = widget.notifier!;
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.notifier == null) {
      notifier.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdmissionCouncilConsumer(
      buildSuccess: (context, councilList) {
        final dropdownMenuEntries = [
          for (final council in councilList)
            DropdownMenuEntry(
              value: council,
              label: "Tiểu ban ${council.year}",
            ),
        ];

        return ValueListenableBuilder(
          valueListenable: notifier,
          child: const Text("Hội đồng tuyển sinh"),
          builder: (context, value, child) {
            return DropdownMenuFormField<AdmissionCouncilData>(
              label: child,
              expandedInsets: EdgeInsets.zero,
              initialSelection: notifier.value ?? widget.initialSelection,
              dropdownMenuEntries: dropdownMenuEntries,
              validator: widget.validator,
              onSelected: (value) => notifier.value = value,
            );
          },
        );
      },
    );
  }
}
