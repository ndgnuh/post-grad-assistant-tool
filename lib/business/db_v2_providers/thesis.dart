import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import './../db_v2_providers.dart';

final thesisByIdProvider = AsyncNotifierProvider.family(
  ThesisByIdNotifier.new,
);

final thesisMutationProvider = AsyncNotifierProvider.family(
  ThesisMutationNotifier.new,
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

  Future<void> updateInfo({
    String? vietnameseTitle,
    String? englishTitle,
    int? secondarySupervisorId,
    int? supervisorId,
  }) async {
    final companion = ThesisCompanion(
      vietnameseTitle: vietnameseTitle != null
          ? Value(vietnameseTitle)
          : const Value.absent(),
      englishTitle: englishTitle != null
          ? Value(englishTitle)
          : const Value.absent(),
      secondarySupervisorId: secondarySupervisorId != null
          ? Value(secondarySupervisorId)
          : const Value.absent(),
      supervisorId: supervisorId != null
          ? Value(supervisorId)
          : const Value.absent(),
    );
    updateThesis(companion);
  }

  void applyForDefense() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(ThesisStatus.defenseApplied),
    ),
  );

  void assignFirstReviewer(int teacherId) => updateThesis(
    ThesisCompanion(
      firstReviewerId: Value(teacherId),
    ),
  );

  void assignMember(int teacherId) => updateThesis(
    ThesisCompanion(
      memberId: Value(teacherId),
    ),
  );

  void assignPresident(int teacherId) => updateThesis(
    ThesisCompanion(
      presidentId: Value(teacherId),
    ),
  );

  void assignSecondReviewer(int teacherId) => updateThesis(
    ThesisCompanion(
      secondReviewerId: Value(teacherId),
    ),
  );

  void assignSecretary(int teacherId) => updateThesis(
    ThesisCompanion(
      secretaryId: Value(teacherId),
    ),
  );

  /// Assign thesis to a student.
  void assignToStudent(int studentId) => updateThesis(
    ThesisCompanion(
      studentId: Value(studentId),
    ),
  );

  @override
  FutureOr<ThesisData> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.select();
    stmt.where((r) => r.id.equals(id));
    final thesis = await stmt.getSingleOrNull();
    assert(thesis != null, 'Thesis with id $id not found');
    return thesis!;
  }

  void cancelDefenseRegistration() {
    final value = state.value!;
    final newValue = switch (value.studentId) {
      null => ThesisStatus.unofficial,
      _ => ThesisStatus.assigned,
    };
    updateThesis(
      ThesisCompanion(
        defenseStatus: Value(newValue),
      ),
    );
  }

  void markAsDefended() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(ThesisStatus.defensePassed),
    ),
  );

  void registerForDefense() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(ThesisStatus.defenseIntended),
    ),
  );

  void resetDefenseStatus() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(ThesisStatus.assigned),
    ),
  );

  /// Unassign the thesis from the student.
  void unassignStudent() {
    updateThesis(
      ThesisCompanion(
        studentId: const Value.absent(),
      ),
    );
    ref.invalidate(thesisIdByStudentProvider(id));
  }

  void updateThesis(ThesisCompanion companion) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.update();
    stmt.where((r) => r.id.equals(id));
    final thesis = await stmt.writeReturning(companion);
    state = AsyncData(thesis.first);
  }
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
  final PaymentStatus? paymentStatus;
  final Set<ThesisStatus> defenseStatus;

  ThesisIdsNotifier({
    this.tracking,
    this.assigned,
    this.studentId,
    this.ignore = false,
    this.paymentStatus,
    this.defenseStatus = const {},
  });

  factory ThesisIdsNotifier.paymentRequired() {
    return ThesisIdsNotifier(
      paymentStatus: PaymentStatus.unpaid,
      defenseStatus: {
        ThesisStatus.defensePassed,
        ThesisStatus.defenseFailed,
      },
    );
  }

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

    switch (paymentStatus) {
      case PaymentStatus value:
        stmt.where((r) => r.paymentStatus.equals(value.value));
      default:
    }

    if (defenseStatus.isNotEmpty) {
      stmt.where((r) {
        final cond = defenseStatus
            .map((value) => r.defenseStatus.equals(value.value))
            .toList();
        return cond.reduce((a, b) => a | b);
      });
    }

    if (studentId != null) {
      stmt.where((r) => r.studentId.equalsNullable(studentId!));
    }

    stmt.orderBy([
      (r) => OrderingTerm(expression: r.supervisorId),
      (r) => OrderingTerm(expression: r.studentId),
    ]);

    final ids = await stmt.map((r) => r.id).get();
    print(ids);
    return ids;
  }
}

/// This provider does not return any data, it is used to access [Ref]
/// and invalidate other providers when mutations occur.
class ThesisMutationNotifier extends AsyncNotifier<void> {
  final int id;
  ThesisMutationNotifier(this.id);

  void applyForDefense() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(ThesisStatus.defenseApplied),
    ),
  );

  void assignFirstReviewer(int teacherId) => updateThesis(
    ThesisCompanion(
      firstReviewerId: Value(teacherId),
    ),
  );

  void assignMember(int teacherId) => updateThesis(
    ThesisCompanion(
      memberId: Value(teacherId),
    ),
  );

  void assignPresident(int teacherId) => updateThesis(
    ThesisCompanion(
      presidentId: Value(teacherId),
    ),
  );

  void assignSecondReviewer(int teacherId) => updateThesis(
    ThesisCompanion(
      secondReviewerId: Value(teacherId),
    ),
  );

  void assignSecretary(int teacherId) => updateThesis(
    ThesisCompanion(
      secretaryId: Value(teacherId),
    ),
  );

  /// Assign thesis to a student.
  void assignToStudent(int studentId) {
    updateThesis(
      ThesisCompanion(
        studentId: Value(studentId),
      ),
    );
    ref.invalidate(thesisIdByStudentProvider(id));
  }

  @override
  FutureOr<void> build() => null;

  void cancelDefenseRegistration() async {
    final newValue = ThesisStatus.assigned;
    updateThesis(
      ThesisCompanion(
        defenseStatus: Value(newValue),
      ),
    );
  }

  void markAsDefended() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(ThesisStatus.defensePassed),
    ),
  );

  void registerForDefense() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(ThesisStatus.defenseIntended),
    ),
  );

  void resetDefenseStatus() => updateThesis(
    ThesisCompanion(
      defenseStatus: Value(ThesisStatus.assigned),
    ),
  );

  /// Unassign the thesis from the student.
  void unassignStudent() => updateThesis(
    ThesisCompanion(
      studentId: const Value.absent(),
    ),
  );

  void updateThesis(ThesisCompanion companion) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.update();
    stmt.where((r) => r.id.equals(id));
    await stmt.writeReturning(companion);

    // By default, invalidate the thesisByIdProvider
    ref.invalidate(thesisByIdProvider(id));
  }
}
