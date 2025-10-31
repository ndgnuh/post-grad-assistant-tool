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
  SemesterSelectionModelNotifier(this.name);

  @override
  String get prefKey => 'selection-model/semester/$name';

  @override
  FutureOr<SemesterData?> load(SharedPreferences prefs) async {
    final id = prefs.getString(prefKey);
    if (id == null) return null;
    return await ref.read(semesterByIdProvider(id).future);
  }

  @override
  FutureOr<List<SemesterData>> get options async {
    final ids = await ref.read(semesterIdsProvider.future);
    final semesters = await Future.wait([
      for (final id in ids) ref.read(semesterByIdProvider(id).future),
    ]);
    return semesters;
  }

  @override
  void save(SharedPreferences prefs, SemesterData? item) {
    if (item == null) {
      prefs.remove(prefKey);
    } else {
      prefs.setString(prefKey, item.id);
    }
  }
}
