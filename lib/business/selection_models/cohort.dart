import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db_v2_providers.dart';
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
  FutureOr<CohortData?> load(SharedPreferences prefs) {
    final id = prefs.getString(prefKey);
    if (id == null) return null;
    return ref.watch(cohortByIdProvider(id).future);
  }

  @override
  FutureOr<List<CohortData>> get options async {
    final ids = await ref.watch(cohortIdsProvider.future);
    final cohorts = <CohortData>[];
    for (final id in ids) {
      final cohort = await ref.watch(cohortByIdProvider(id).future);
      if (cohort != null) {
        cohorts.add(cohort);
      }
    }
    return cohorts;
  }

  @override
  void save(SharedPreferences prefs, CohortData? item) {
    if (item == null) {
      prefs.remove(prefKey);
    } else {
      prefs.setString(prefKey, item.id);
    }
  }
}
