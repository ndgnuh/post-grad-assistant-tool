/// Providers for querying msc-admission related data;
library;

import 'dart:io';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../business/db_v2_providers.dart';
import '../../business/selection_models.dart';

final admissionRoundsProvider = StreamProvider.family(
  (ref, int? year) async* {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.getAdmissionRounds(year: year);
    yield* stmt.watch();
  },
);

final admissionYearsProvider = StreamProvider((ref) async* {
  final db = await ref.watch(mainDatabaseProvider.future);
  final stmt = db.getAdmissionYears();
  yield* stmt.watch();
});

final admissionProfilesProvider = StreamProvider.family(
  (ref, int roundId) async* {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.getAdmissionProfiles(roundId: roundId);
    yield* stmt.watch();
  },
);

final admissionYearSelectionProvider = NotifierProvider(
  () => AdmissionYearNotifier(name: "default"),
);

class AdmissionYearNotifier extends Notifier<SelectionModel<int>> {
  final String? name;
  late SelectionModel<int> selection;
  late SharedPreferences prefs;

  AdmissionYearNotifier({this.name});

  String? get key => switch (name) {
    String name => "admission-year:$name",
    null => null,
  };

  @override
  build() {
    _asyncBuild();
    return SelectionModel(selected: null, options: []);
  }

  void _asyncBuild() async {
    final options = await ref.watch(admissionYearsProvider.future);
    late final int? selected;
    switch (key) {
      case null:
        selected = state.selected ?? options.firstOrNull;
      case String key:
        prefs = await SharedPreferences.getInstance();
        selected = prefs.getInt(key);
    }

    state = SelectionModel(selected: selected, options: options);
  }

  void selectOrClear(int? year) => switch (year) {
    int year => select(year),
    null => clear(),
  };

  void select(int year) {
    state = SelectionModel(selected: year, options: state.options);
    switch (key) {
      case String key:
        prefs.setInt(key, year);
    }
  }

  void clear() {
    state = SelectionModel(selected: null, options: state.options);
    switch (key) {
      case String key:
        prefs.remove(key);
    }
  }
}
