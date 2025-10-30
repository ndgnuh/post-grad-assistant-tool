import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db_v2_providers.dart';
import './common.dart';

typedef SemesterSelectionModel = SelectionModel<SemesterData>;

typedef _Mixin = SelectionModelMixin<SemesterData>;
typedef _Notifier = AsyncNotifier<SemesterSelectionModel>;

class SemesterSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  final bool withNull;
  SemesterSelectionModelNotifier(this.name, {this.withNull = false});

  @override
  String get prefKey => 'selection-model/semester/$name';

  @override
  Future<SemesterSelectionModel> build() async {
    final ids = await ref.watch(semesterIdsProvider.future);

    // Fetch options by ID
    final options = <SemesterData>[];
    for (final id in ids) {
      final option = await ref.watch(semesterByIdProvider(id).future);
      options.add(option);
    }

    // Fetch preference from previous selection
    final pref = await SharedPreferences.getInstance();
    final selectedId = pref.getString(prefKey);

    // If none selected
    if (selectedId == null) {
      return SelectionModel<SemesterData>(
        selected: null,
        options: options,
      );
    }

    // Try to find the selected option
    final selectedOption = options
        .where(
          (option) => option.id == selectedId,
        )
        .firstOrNull;

    return SelectionModel<SemesterData>(
      selected: selectedOption,
      options: options,
    );
  }

  @override
  Future<void> saveSelection(SemesterData? item) async {
    final pref = await SharedPreferences.getInstance();
    if (item == null) {
      await pref.remove(prefKey);
    } else {
      await pref.setString(prefKey, item.id);
    }
  }
}
