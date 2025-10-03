import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business/db_v1_providers.dart';
import '../../business/domain_objects.dart';

// class AdmissionCouncilSelector extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final councilsState = ref.watch(admissionCouncilsProvider);
//
//     switch (councilsState) {
//       case AsyncLoading():
//         return CircularProgressIndicator();
//       case AsyncError():
//         return Text("Error loading council");
//       default:
//     }
//
//     final councils = councilsState.value!;
//
//
//   }
// }

final selectedCouncilProvider = AsyncNotifierProvider(
  SelectedCouncilNotifier.new,
);

class CouncilSelector extends ConsumerWidget {
  final double? width;
  const CouncilSelector({super.key, this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCouncilState = ref.watch(selectedCouncilProvider);
    switch (selectedCouncilState) {
      case AsyncLoading():
        return const Center(child: CircularProgressIndicator());
      case AsyncError():
        return const Center(child: Text("Lỗi tải dữ liệu."));
      default:
    }

    // selected council depends on the councils
    // Since selected council is resolved, councils should be too.
    final councilsState = ref.watch(admissionCouncilsProvider);
    final selectedCouncil = selectedCouncilState.value;
    final councils = councilsState.value!;

    return DropdownMenu<AdmissionCouncil>(
      label: const Text("Tiểu ban xét tuyển"),
      width: width,
      initialSelection: selectedCouncil,
      dropdownMenuEntries: [
        for (final council in councils)
          DropdownMenuEntry(
            value: council,
            label: council.toString(),
          ),
      ],
      onSelected: (council) {
        final notifier = ref.read(selectedCouncilProvider.notifier);
        notifier.select(council);
      },
    );
  }
}

class SelectedCouncilNotifier extends AsyncNotifier<AdmissionCouncil?> {
  String get selectedCouncilPref => "selected-council";

  @override
  FutureOr<AdmissionCouncil?> build() async {
    // watch for list of councils
    final councils = await ref.watch(admissionCouncilsProvider.future);
    if (councils.isEmpty) return null;

    // get selected if any
    final prefs = await SharedPreferences.getInstance();
    final councilKey = prefs.getString(selectedCouncilPref);
    if (councilKey == null) return null;

    // If parse fail
    final councilId = int.tryParse(councilKey);
    if (councilId == null) return null;

    // Search by Id
    for (final council in councils) {
      if (council.id == councilId) return council;
    }

    // Fallback
    return null;
  }

  void select(AdmissionCouncil? value) async {
    state = AsyncData(value);
    final prefs = await SharedPreferences.getInstance();
    switch (value?.id) {
      case int id:
        await prefs.setString(selectedCouncilPref, id.toString());
      case null:
        await prefs.remove(selectedCouncilPref);
    }
  }
}
