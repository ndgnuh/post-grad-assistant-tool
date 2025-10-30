import 'dart:async';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import './../db_v2_providers.dart';

final thesisByIdProvider = AsyncNotifierProvider.family(
  ThesisByIdNotifier.new,
);

final thesisMemberProvider = AsyncNotifierProvider.family(
  ThesisMemberProvider.new,
);

final thesisPresidentProvider = AsyncNotifierProvider.family(
  ThesisPresidentProvider.new,
);

final thesisReviewer1Provider = AsyncNotifierProvider.family(
  ThesisReviewer1Provider.new,
);

final thesisReviewer2Provider = AsyncNotifierProvider.family(
  ThesisReviewer2Provider.new,
);

final thesisSecretaryProvider = AsyncNotifierProvider.family(
  ThesisSecretaryProvider.new,
);

final trackedThesisIdsProvider = AsyncNotifierProvider(
  () => ThesisIdsNotifier(tracking: true),
);

class ThesisByIdNotifier extends AsyncNotifier<ThesisData?> {
  final int id;
  ThesisByIdNotifier(this.id);

  @override
  FutureOr<ThesisData?> build() async {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.select();
    stmt.where((r) => r.id.equals(id));
    return await stmt.getSingleOrNull();
  }
}

sealed class ThesisCouncilMemberProvider extends AsyncNotifier<TeacherData?> {
  final int thesisId;
  final CouncilRole role;

  ThesisCouncilMemberProvider(this.thesisId, this.role);

  Future<void> assign(int? teacherId) async {
    // await assignTeacherInRole(
    //   ref: ref,
    //   thesisId: thesisId,
    //   role: role,
    //   teacherId: teacherId,
    // );
    // ref.invalidateSelf();
  }

  @override
  Future<TeacherData?> build() async {
    // FIXME: proper implementation
    return null;
    // return await getTeacherInRole(
    //   ref: ref,
    //   thesisId: thesisId,
    //   role: role,
    // );
  }

  Future<void> unassign() => assign(null);
}

class ThesisMemberProvider extends ThesisCouncilMemberProvider {
  ThesisMemberProvider(int thesisId) : super(thesisId, CouncilRole.member);
}

class ThesisPresidentProvider extends ThesisCouncilMemberProvider {
  ThesisPresidentProvider(int thesisId)
    : super(thesisId, CouncilRole.president);
}

class ThesisReviewer1Provider extends ThesisCouncilMemberProvider {
  ThesisReviewer1Provider(int thesisId)
    : super(thesisId, CouncilRole.reviewer1);
}

class ThesisReviewer2Provider extends ThesisCouncilMemberProvider {
  ThesisReviewer2Provider(int thesisId)
    : super(thesisId, CouncilRole.reviewer2);
}

class ThesisSecretaryProvider extends ThesisCouncilMemberProvider {
  ThesisSecretaryProvider(int thesisId)
    : super(thesisId, CouncilRole.secretary);
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

  Future<void> track(int thesisId) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    await db.trackThesis(thesisId: thesisId);
    ref.invalidateSelf();
  }

  Future<void> untrack(int thesisId) async {
    final db = await ref.watch(mainDatabaseProvider.future);
    await db.untrackThesis(thesisId: thesisId);
    ref.invalidateSelf();
  }
}
