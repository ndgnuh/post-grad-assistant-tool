import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import './../db_v2_providers.dart';

final thesisByIdProvider = AsyncNotifierProvider.family(
  ThesisByIdNotifier.new,
);

final thesisIdByStudentProvider = AsyncNotifierProvider.family(
  ThesisIdNotifier.new,
);

final trackedThesisIdsProvider = AsyncNotifierProvider(
  () => ThesisIdsNotifier(tracking: true),
);

class ThesisByIdNotifier extends AsyncNotifier<ThesisData> {
  final int id;
  ThesisByIdNotifier(this.id);

  @override
  FutureOr<ThesisData> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.select();
    stmt.where((r) => r.id.equals(id));
    final thesis = await stmt.getSingleOrNull();
    assert(thesis != null, 'Thesis with id $id not found');
    return thesis!;
  }

  void updateThesis(ThesisCompanion companion) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.update();
    stmt.where((r) => r.id.equals(id));
    final thesis = await stmt.writeReturning(companion);
    state = AsyncData(thesis.first);
  }

  void registerForDefense() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(MscDefenseStatus.registered),
    ),
  );

  void applyForDefense() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(MscDefenseStatus.applied),
    ),
  );

  void markAsDefended() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(MscDefenseStatus.defended),
    ),
  );

  void resetDefenseStatus() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(MscDefenseStatus.normal),
    ),
  );

  void cancelDefenseRegistration() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(MscDefenseStatus.normal),
    ),
  );

  /// Unassign the thesis from the student.
  void unassignStudent() => updateThesis(
    ThesisCompanion(
      studentId: const Value.absent(),
    ),
  );

  /// Assign thesis to a student.
  void assignToStudent(int studentId) => updateThesis(
    ThesisCompanion(
      studentId: Value(studentId),
    ),
  );
}

class ThesisIdNotifier extends AsyncNotifier<int?> {
  final int studentId;
  ThesisIdNotifier(this.studentId);

  @override
  Future<int?> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.select();
    stmt.where((r) => r.studentId.equals(studentId));
    return await stmt.map((r) => r.id).getSingleOrNull();
  }
}

class ThesisIdsNotifier extends AsyncNotifier<List<int>> {
  // null means dont apply the filter
  final bool? tracking;
  final bool? assigned;
  final int? studentId;
  final bool? ignore;

  ThesisIdsNotifier({
    this.tracking,
    this.assigned,
    this.studentId,
    this.ignore = false,
  });

  @override
  Future<List<int>> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.select();

    switch (ignore) {
      case true:
        stmt.where((r) => r.flagIgnore.equals(true));
      case false:
        stmt.where((r) => r.flagIgnore.equalsNullable(false));
      default:
    }

    if (tracking != null) {
      stmt.where((r) => r.flagTracking.equalsNullable(tracking!));
    }

    switch (assigned) {
      case true:
        stmt.where((r) => r.studentId.isNotNull());
      case false:
        stmt.where((r) => r.studentId.isNull());
      default:
    }

    if (studentId != null) {
      stmt.where((r) => r.studentId.equalsNullable(studentId!));
    }

    stmt.orderBy([
      (r) => OrderingTerm(expression: r.supervisorId),
      (r) => OrderingTerm(expression: r.studentId),
    ]);

    return await stmt.map((r) => r.id).get();
  }
}
