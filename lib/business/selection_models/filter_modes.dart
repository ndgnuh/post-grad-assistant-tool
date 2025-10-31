import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './../business_enums.dart';
import './common.dart';

typedef FilterModeSelectionModel = SelectionModel<FilterMode>;

typedef _Mixin = SelectionModelMixin<FilterMode>;
typedef _Notifier = AsyncNotifier<FilterModeSelectionModel>;

class FilterModeSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  final FilterMode initialSelection;

  FilterModeSelectionModelNotifier(
    this.name, {
    this.initialSelection = FilterMode.or,
  });

  @override
  FutureOr<List<FilterMode>> get options => FilterMode.values;

  @override
  String get prefKey => "selection-models/filter-mode/$name";

  @override
  FilterMode? load(SharedPreferences prefs) {
    final value = prefs.getString(prefKey);
    return FilterMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => initialSelection,
    );
  }

  @override
  void save(SharedPreferences prefs, FilterMode? item) {
    if (item == null) {
      prefs.remove(prefKey);
    } else {
      prefs.setString(prefKey, item.name);
    }
  }
}
