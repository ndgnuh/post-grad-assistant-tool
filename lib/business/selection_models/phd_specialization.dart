import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './../business_enums.dart';
import './common.dart';

typedef PhdSpecilizationSelectionModel = SelectionModel<PhdSpecialization>;

typedef _Mixin = SelectionModelMixin<PhdSpecialization>;
typedef _Notifier = AsyncNotifier<PhdSpecilizationSelectionModel>;

class PhdSpecializationSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  PhdSpecializationSelectionModelNotifier(this.name);

  @override
  String get prefKey => "selection-models/phd-specialization/$name";

  @override
  get options => PhdSpecialization.values;

  @override
  PhdSpecialization? load(SharedPreferences prefs) {
    final value = prefs.getString(prefKey);
    try {
      return PhdSpecialization.fromValue(value ?? "");
    } catch (e) {
      return null;
    }
  }

  @override
  void save(SharedPreferences prefs, PhdSpecialization? item) {
    if (item == null) {
      prefs.remove(prefKey);
    } else {
      prefs.setString(prefKey, item.label);
    }
  }
}
