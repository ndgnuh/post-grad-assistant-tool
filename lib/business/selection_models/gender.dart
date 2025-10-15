import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './../business_enums.dart';
import './common.dart';

typedef GenderSelectionModel = SelectionModel<Gender>;

typedef _Mixin = SelectionModelMixin<Gender>;
typedef _Notifier = AsyncNotifier<GenderSelectionModel>;

class GenderSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  GenderSelectionModelNotifier(this.name);

  @override
  String get prefKey => "selection-models/gender/$name";

  @override
  FutureOr<GenderSelectionModel> build() async {
    final options = Gender.values;
    final prefs = await SharedPreferences.getInstance();
    final selectedName = prefs.getString(prefKey);
    final selected = [
      for (final gender in Gender.values)
        if (gender.value == selectedName) gender,
    ].firstOrNull;

    return GenderSelectionModel(
      selected: selected,
      options: options,
    );
  }

  @override
  Future<void> saveSelection(Gender? item) async {
    final prefs = await SharedPreferences.getInstance();
    if (item == null) {
      await prefs.remove(prefKey);
    } else {
      await prefs.setString(prefKey, item.name);
    }
  }
}
