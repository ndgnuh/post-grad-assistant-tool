import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../db_v2_providers.dart';

final admissionCouncilByIdProvider = AsyncNotifierProvider.family(
  AdmissionCouncilByIdNotifier.new,
);

final admissionCouncilIdsProvider = AsyncNotifierProvider(
  AdmissionCouncilIdsNotifier.new,
);

typedef _A = AdmissionCouncilData;

class AdmissionCouncilByIdNotifier extends AsyncNotifier<_A?> {
  final int councilId;
  AdmissionCouncilByIdNotifier(this.councilId);

  @override
  FutureOr<AdmissionCouncilData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.tieuBanXetTuyen.select()
      ..where((tbl) => tbl.id.equals(councilId));
    final council = await query.getSingleOrNull();
    return council;
  }
}

class AdmissionCouncilIdsNotifier extends AsyncNotifier<List<int>> {
  @override
  FutureOr<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final query = db.tieuBanXetTuyen.select().map((c) => c.id);
    return await query.get();
  }
}
