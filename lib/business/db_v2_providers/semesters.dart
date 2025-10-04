import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../drift_orm.dart';

final semestersProvider = AsyncNotifierProvider(
  SemestersNotifier.new,
);

final semesterByIdProvider = AsyncNotifierProvider.family(
  SemesterByIdNotifier.new,
);

class SemestersNotifier extends AsyncNotifier<List<SemesterData>> {
  @override
  FutureOr<List<SemesterData>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final semesters = await db.managers.hocky.get();
    return semesters;
  }
}

class SemesterByIdNotifier extends AsyncNotifier<SemesterData?> {
  final String semesterId;
  SemesterByIdNotifier(this.semesterId);

  @override
  FutureOr<SemesterData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final stmt = db.hocky.select()..where((s) => s.semester.equals(semesterId));
    final semester = await stmt.getSingleOrNull();
    return semester;
  }
}
