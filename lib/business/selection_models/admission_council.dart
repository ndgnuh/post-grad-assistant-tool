import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './common.dart';
import '../db_v2_providers.dart';

typedef CouncilSelectionModel = SelectionModel<AdmissionCouncilData>;
typedef _Mixin = SelectionModelMixin<AdmissionCouncilData>;
typedef _Notifier = AsyncNotifier<CouncilSelectionModel>;

class CouncilSelectionModelNotifier extends _Notifier with _Mixin {
  final String name;
  CouncilSelectionModelNotifier(this.name);

  @override
  String get prefKey => 'selection-models/admission-council/$name';

  @override
  FutureOr<AdmissionCouncilData?> load(SharedPreferences prefs) {
    final id = prefs.getInt(prefKey);
    if (id == null) return null;
    return ref.watch(admissionCouncilByIdProvider(id).future);
  }

  @override
  FutureOr<List<AdmissionCouncilData>> get options async {
    final ids = await ref.watch(admissionCouncilIdsProvider.future);
    final councilOptions = <AdmissionCouncilData>[];
    for (final id in ids) {
      final council = await ref.watch(admissionCouncilByIdProvider(id).future);
      councilOptions.add(council);
    }
    return councilOptions;
  }

  @override
  void save(SharedPreferences prefs, AdmissionCouncilData? item) async {
    if (item == null) {
      await prefs.remove(prefKey);
    } else {
      await prefs.setInt(prefKey, item.id);
    }
  }
}
