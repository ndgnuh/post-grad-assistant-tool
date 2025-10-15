import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db_v2_providers.dart';
import './../../business/drift_orm.dart';
import './common.dart';

typedef PhdCohortSelectionModel = SelectionModel<String>;

typedef _Mixin = SelectionModelMixin<String>;
typedef _Notifier = AsyncNotifier<PhdCohortSelectionModel>;

class PhdCohortSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  PhdCohortSelectionModelNotifier(this.name);

  @override
  String get prefKey => 'selection-model/phd-cohort/$name';

  @override
  FutureOr<PhdCohortSelectionModel> build() async {
    final cohorts = await ref.watch(phdCohortsProvider.future);
    final pref = await SharedPreferences.getInstance();
    final selectedCohort = pref.getString(prefKey);

    return PhdCohortSelectionModel(
      selected: selectedCohort,
      options: cohorts,
    );
  }

  @override
  Future<void> saveSelection(String? item) async {
    final pref = await SharedPreferences.getInstance();
    if (item == null) {
      await pref.remove(prefKey);
    } else {
      await pref.setString(prefKey, item);
    }
  }
}
