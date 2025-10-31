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
  FutureOr<List<Gender>> get options => Gender.values;

  @override
  String get prefKey => "selection-models/gender/$name";

  @override
  Gender? load(SharedPreferences prefs) {
    final value = prefs.getString(prefKey);
    return Gender.fromValueOrNull(value);
  }

  @override
  void save(SharedPreferences prefs, Gender? item) {
    if (item == null) {
      prefs.remove(prefKey);
    } else {
      prefs.setString(prefKey, item.name);
    }
  }
}
