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

class AdmissionCouncilByIdNotifier extends AsyncNotifier<AdmissionCouncilData> {
  final int councilId;
  AdmissionCouncilByIdNotifier(this.councilId);

  @override
  FutureOr<AdmissionCouncilData> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final query = db.admissionCouncil.select()
      ..where((tbl) => tbl.id.equals(councilId));
    final council = await query.getSingleOrNull();
    assert(council != null, 'Không có tiểu ban xét tuyển với ID $councilId');
    return council!;
  }
}

class AdmissionCouncilIdsNotifier extends AsyncNotifier<List<int>> {
  @override
  FutureOr<List<int>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    print(db);
    final query = db.admissionCouncil.select().map((c) => c.id);
    final ids = await query.get();
    print(ids);
    return ids;
  }
}
