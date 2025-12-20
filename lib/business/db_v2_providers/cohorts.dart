import 'dart:async';
import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final cohortIdsProvider = AsyncNotifierProvider(
  CohortIdsNotifer.new,
);

final cohortByIdProvider = AsyncNotifierProvider.family(
  (String id) => CohortByIdNotifier(id),
);

class CohortIdsNotifer extends AsyncNotifier<List<String>> {
  @override
  FutureOr<List<String>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final cohorts = await db.cohort.select().map((cohort) => cohort.id).get();
    return cohorts;
  }
}

class CohortByIdNotifier extends AsyncNotifier<CohortData?> {
  final String cohortId;
  CohortByIdNotifier(this.cohortId);

  @override
  FutureOr<CohortData?> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final query = db.cohort.select()..where((tbl) => tbl.id.equals(cohortId));
    return await query.getSingleOrNull();
  }
}
