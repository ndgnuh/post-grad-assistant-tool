import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../drift_orm.dart';

final semestersProvider = AsyncNotifierProvider(
  SemestersNotifier.new,
);

class SemestersNotifier extends AsyncNotifier<List<SemesterData>> {
  @override
  FutureOr<List<SemesterData>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final semesters = await db.managers.hocky.get();
    return semesters;
  }
}
