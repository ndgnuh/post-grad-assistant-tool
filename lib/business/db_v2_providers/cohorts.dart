import 'dart:async';
import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';
import '../drift_orm.dart' show CohortData;

final cohortIdsProvider = AsyncNotifierProvider(
  CohortIdsNotifer.new,
);

final cohortByIdProvider = AsyncNotifierProvider.family(
  CohortByIdNotifier.new,
);

class CohortIdsNotifer extends AsyncNotifier<List<String>> {
  @override
  FutureOr<List<String>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final cohorts = await db.nienKhoa
        .select()
        .map((cohort) => cohort.cohort)
        .get();
    return cohorts;
  }
}

class CohortByIdNotifier extends AsyncNotifier<CohortData?> {
  final String cohortId;
  CohortByIdNotifier(this.cohortId);

  @override
  FutureOr<CohortData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.nienKhoa.select()
      ..where((tbl) => tbl.cohort.equals(cohortId));
    return await query.getSingleOrNull();
  }
}
