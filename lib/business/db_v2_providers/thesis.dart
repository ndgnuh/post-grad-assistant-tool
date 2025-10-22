import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fami_tools/pages/theses/widgets.dart';
import 'package:riverpod/riverpod.dart';

import '../domain_objects.dart' show CouncilRole;
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

Future<void> assignTeacherInRole({
  required Ref ref,
  required int thesisId,
  required CouncilRole role,
  required int? teacherId,
}) async {
  final db = await ref.read(driftDatabaseProvider.future);
  switch (role) {
    case CouncilRole.president:
      await db.setThesisPresidentId(
        thesisId: thesisId,
        teacherId: teacherId,
      );
    case CouncilRole.reviewer1:
      await db.setThesis1stReviewerId(
        thesisId: thesisId,
        teacherId: teacherId,
      );
    case CouncilRole.reviewer2:
      await db.setThesis2ndReviewerId(
        thesisId: thesisId,
        teacherId: teacherId,
      );
    case CouncilRole.secretary:
      await db.setThesisSecretaryId(
        thesisId: thesisId,
        teacherId: teacherId,
      );
    case CouncilRole.member:
      await db.setThesisMemberId(
        thesisId: thesisId,
        teacherId: teacherId,
      );
  }
}

Future<TeacherData?> getTeacherInRole({
  required Ref ref,
  required int thesisId,
  required CouncilRole role,
}) async {
  final db = await ref.watch(driftDatabaseProvider.future);

  final id = await switch (role) {
    CouncilRole.president =>
      db.getThesisPresidentId(thesisId: thesisId).getSingleOrNull(),
    CouncilRole.reviewer1 =>
      db.getThesis1stReviewerId(thesisId: thesisId).getSingleOrNull(),
    CouncilRole.reviewer2 =>
      db.getThesis2ndReviewerId(thesisId: thesisId).getSingleOrNull(),
    CouncilRole.secretary =>
      db.getThesisSecretaryId(thesisId: thesisId).getSingleOrNull(),
    CouncilRole.member =>
      db.getThesisMemberId(thesisId: thesisId).getSingleOrNull(),
  };
  if (id == null) return null;

  return await ref.watch(teacherByIdProvider(id).future);
}

class ThesisByIdNotifier extends AsyncNotifier<ThesisData?> {
  final int id;
  ThesisByIdNotifier(this.id);

  @override
  FutureOr<ThesisData?> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    final stmt = db.detaithacsi.select();
    stmt.where((r) => r.id.equals(id));
    return await stmt.getSingleOrNull();
  }
}

sealed class ThesisCouncilMemberProvider extends AsyncNotifier<TeacherData?> {
  final int thesisId;
  final CouncilRole role;

  ThesisCouncilMemberProvider(this.thesisId, this.role);

  assign(int? teacherId) async {
    await assignTeacherInRole(
      ref: ref,
      thesisId: thesisId,
      role: role,
      teacherId: teacherId,
    );
    ref.invalidateSelf();
  }

  @override
  Future<TeacherData?> build() async {
    return await getTeacherInRole(
      ref: ref,
      thesisId: thesisId,
      role: role,
    );
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
    final db = await ref.watch(driftDatabaseProvider.future);
    final stmt = db.detaithacsi.select();

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
    final db = await ref.watch(driftDatabaseProvider.future);
    await db.trackThesis(thesisId: thesisId);
    ref.invalidateSelf();
  }

  Future<void> untrack(int thesisId) async {
    final db = await ref.watch(driftDatabaseProvider.future);
    await db.untrackThesis(thesisId: thesisId);
    ref.invalidateSelf();
  }
}
