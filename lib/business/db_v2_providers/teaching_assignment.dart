import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final teachingAssignmentByClassProvider = AsyncNotifierProvider.family(
  TeachingAssignmentByClassNotifier.new,
);

class TeachingAssignmentByClassNotifier
    extends AsyncNotifier<List<TeachingAssignmentData>> {
  final int courseClassId;
  TeachingAssignmentByClassNotifier(this.courseClassId);

  @override
  FutureOr<List<TeachingAssignmentData>> build() async {
    final db = await ref.watch(appDatabaseProvider.future);
    final stmt = db.teachingAssignment.select();
    stmt.where(
      (t) => t.classId.equals(courseClassId),
    );
    stmt.orderBy([
      (t) => OrderingTerm(expression: t.sortOrder),
      (t) => OrderingTerm(expression: t.weight, mode: OrderingMode.desc),
    ]);

    return await stmt.get();
  }

  void setAssignment(List<TeachingAssignmentCompanion> assignments) async {
    final db = await ref.read(appDatabaseProvider.future);
    final results = <TeachingAssignmentData>[];
    await db.transaction(() async {
      final deleteStmt = db.teachingAssignment.delete();
      deleteStmt.where((t) => t.classId.equals(courseClassId));
      await deleteStmt.go();

      for (final assignment in assignments) {
        final updated = await db.teachingAssignment.insertReturning(assignment);
        results.add(updated);
      }
    });

    // Invalidate relevant providers
    state = AsyncData(results);
  }
}
