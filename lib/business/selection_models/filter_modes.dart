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
  String get prefKey => "selection-models/filter-mode/$name";

  @override
  FutureOr<FilterModeSelectionModel> build() async {
    final options = FilterMode.values;
    final prefs = await SharedPreferences.getInstance();
    final selectedName = prefs.getString(prefKey);
    final selected = [
      for (final gender in FilterMode.values)
        if (gender.name == selectedName) gender,
    ].firstOrNull;

    return FilterModeSelectionModel(
      selected: selected ?? initialSelection,
      options: options,
    );
  }

  @override
  Future<void> saveSelection(FilterMode? item) async {
    final prefs = await SharedPreferences.getInstance();
    if (item == null) {
      await prefs.remove(prefKey);
    } else {
      await prefs.setString(prefKey, item.name);
    }
  }
}
