import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final semesterIdsProvider = AsyncNotifierProvider(
  SemesterIdsNotifier.new,
);

final semesterByIdProvider = AsyncNotifierProvider.family(
  SemesterByIdNotifier.new,
);

class SemesterIdsNotifier extends AsyncNotifier<List<String>> {
  @override
  FutureOr<List<String>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final semesters = await db.managers.hocky.map((h) => h.semester).get();
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
