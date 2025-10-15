import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './common.dart';
import './../../business/drift_orm.dart';
import '../db_v2_providers.dart';

typedef CouncilSelectionModel = SelectionModel<AdmissionCouncilData>;
typedef _Mixin = SelectionModelMixin<AdmissionCouncilData>;
typedef _Notifier = AsyncNotifier<CouncilSelectionModel>;

class CouncilSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  CouncilSelectionModelNotifier(this.name);

  @override
  String get prefKey => 'selection-models/admission-council/$name';

  @override
  Future<SelectionModel<AdmissionCouncilData>> build() async {
    final councils = await ref.watch(admissionCouncilIdsProvider.future);

    // Fetch councils by ID
    final councilOptions = <AdmissionCouncilData>[];
    for (final id in councils) {
      final council = await ref.watch(admissionCouncilByIdProvider(id).future);
      if (council != null) {
        councilOptions.add(council);
      }
    }

    // Fetch preference from previous selection
    final pref = await SharedPreferences.getInstance();
    final selectedId = pref.getInt(prefKey);

    // If none selected
    if (selectedId == null) {
      return SelectionModel<AdmissionCouncilData>(
        selected: null,
        options: councilOptions,
      );
    }

    final selectedCouncil = councilOptions.firstWhere(
      (council) => council.id == selectedId,
    );

    return SelectionModel<AdmissionCouncilData>(
      selected: selectedCouncil,
      options: councilOptions,
    );
  }

  @override
  Future<void> saveSelection(AdmissionCouncilData? item) async {
    final pref = await SharedPreferences.getInstance();
    if (item == null) {
      await pref.remove(prefKey);
    } else {
      await pref.setInt(prefKey, item.id);
    }
  }
}
