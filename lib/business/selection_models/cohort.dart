import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db_v2_providers.dart';
import './../../business/drift_orm.dart';
import './common.dart';

typedef CohortSelectionModel = SelectionModel<CohortData>;

typedef _Mixin = SelectionModelMixin<CohortData>;
typedef _Notifier = AsyncNotifier<CohortSelectionModel>;

class CohortSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  final bool withNull;
  CohortSelectionModelNotifier(this.name, {this.withNull = false});

  @override
  String get prefKey => 'selection-model/cohort/$name';

  @override
  FutureOr<CohortSelectionModel> build() async {
    final cohortById = await ref.watch(cohortIdsProvider.future);

    // Fetch cohorts by ID
    final cohorts = <CohortData>[];
    for (final id in cohortById) {
      final cohort = await ref.watch(cohortByIdProvider(id).future);
      if (cohort != null) {
        cohorts.add(cohort);
      }
    }

    // Fetch preference from previous selection
    final pref = await SharedPreferences.getInstance();
    final selectedId = pref.getString(prefKey);

    // If none selected
    if (selectedId == null) {
      return SelectionModel<CohortData>(
        selected: null,
        options: cohorts,
      );
    }

    try {
      final selectedCohort = cohorts.firstWhere(
        (cohort) => cohort.cohort == selectedId,
      );

      return SelectionModel<CohortData>(
        selected: selectedCohort,
        options: cohorts,
      );
    } catch (e) {
      // If the selected cohort is not found, return with no selection
      return SelectionModel<CohortData>(
        selected: null,
        options: cohorts,
      );
    }
  }

  @override
  Future<void> saveSelection(CohortData? item) async {
    final pref = await SharedPreferences.getInstance();
    if (item == null) {
      await pref.remove(prefKey);
    } else {
      await pref.setString(prefKey, item.cohort);
    }
  }
}
