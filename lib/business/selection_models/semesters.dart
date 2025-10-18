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
  FutureOr<SemesterSelectionModel> build() async {
    final ids = await ref.watch(semesterIdsProvider.future);

    // Fetch options by ID
    final options = <SemesterData>[];
    for (final id in ids) {
      final option = await ref.watch(semesterByIdProvider(id).future);
      if (option != null) {
        options.add(option);
      }
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

    try {
      final selectedOption = options.firstWhere(
        (option) => option.semester == selectedId,
      );

      return SelectionModel<SemesterData>(
        selected: selectedOption,
        options: options,
      );
    } catch (e) {
      // If the selected option is not found, return with no selection
      return SelectionModel<SemesterData>(
        selected: null,
        options: options,
      );
    }
  }

  @override
  Future<void> saveSelection(SemesterData? item) async {
    final pref = await SharedPreferences.getInstance();
    if (item == null) {
      await pref.remove(prefKey);
    } else {
      await pref.setString(prefKey, item.semester);
    }
  }
}
