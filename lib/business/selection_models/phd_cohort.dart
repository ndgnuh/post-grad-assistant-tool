import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db_v2_providers.dart';
import './common.dart';

typedef PhdCohortSelectionModel = SelectionModel<PhdCohortData?>;

typedef _Mixin = SelectionModelMixin<PhdCohortData?>;
typedef _Notifier = AsyncNotifier<PhdCohortSelectionModel>;

class PhdCohortSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  PhdCohortSelectionModelNotifier(this.name);

  @override
  String get prefKey => 'selection-model/phd-cohort/$name';

  @override
  FutureOr<PhdCohortData?> load(SharedPreferences prefs) async {
    final value = prefs.getString(prefKey);
    if (value != null) {
      for (final cohort in await options) {
        if (cohort?.cohort == value) {
          return cohort;
        }
      }
    }
    return null;
  }

  @override
  FutureOr<List<PhdCohortData?>> get options =>
      ref.watch(phdCohortsProvider.future);

  @override
  void save(SharedPreferences prefs, PhdCohortData? item) async {
    if (item == null) {
      await prefs.remove(prefKey);
    } else {
      await prefs.setString(prefKey, item.cohort);
    }
  }
}
