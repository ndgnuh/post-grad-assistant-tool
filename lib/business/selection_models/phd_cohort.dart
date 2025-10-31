import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db_v2_providers.dart';
import './common.dart';

typedef PhdCohortSelectionModel = SelectionModel<String?>;

typedef _Mixin = SelectionModelMixin<String?>;
typedef _Notifier = AsyncNotifier<PhdCohortSelectionModel>;

class PhdCohortSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  PhdCohortSelectionModelNotifier(this.name);

  @override
  String get prefKey => 'selection-model/phd-cohort/$name';

  @override
  FutureOr<String?> load(SharedPreferences prefs) async {
    final value = prefs.getString(prefKey);
    return value;
  }

  @override
  FutureOr<List<String?>> get options => ref.watch(phdCohortsProvider.future);

  @override
  void save(SharedPreferences prefs, String? item) async {
    if (item == null) {
      await prefs.remove(prefKey);
    } else {
      await prefs.setString(prefKey, item);
    }
  }
}
