import 'package:path/path.dart';
import 'package:riverpod/riverpod.dart';

import '../domain_objects.dart' show CouncilRole;
import '../drift_orm.dart';
import './../db_v2_providers.dart';

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
  TrackedThesisIds.new,
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

class TrackedThesisIds extends AsyncNotifier<List<int>> {
  @override
  Future<List<int>> build() async {
    final db = await ref.watch(driftDatabaseProvider.future);
    return await db.getTrackingThesisIds().get();
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

// class ThesisById extends AsyncNotifier<ThesisData?> {
//   final int thesisId;
//
//   ThesisById({required this.thesisId});
//
//   @override
//   Future<ThesisData?> build() async {
//     final db = await ref.watch(driftDatabaseProvider.future);
//   }
// }

// class ThesisCouncilMember extends AsyncNotifier<TeacherData?> {
//   final int thesisId;
//
//   ThesisCouncilMember(({final CouncilRole role, final int thesisId}) {
//       this.role = role;
//         this.thesisId = thesisId;
//         }
//
//   @override
//   Future<TeacherData?> build() async {
//     final db = await ref.watch(driftDatabaseProvider.future);
//
//     final id = await switch (role) {
//       CouncilRole.president =>
//         db.getThesisPresidentId(thesisId: thesisId).getSingleOrNull(),
//       CouncilRole.reviewer1 =>
//         db.getThesis1stReviewerId(thesisId: thesisId).getSingleOrNull(),
//       CouncilRole.reviewer2 =>
//         db.getThesis2ndReviewerId(thesisId: thesisId).getSingleOrNull(),
//       CouncilRole.secretary =>
//         db.getThesisSecretaryId(thesisId: thesisId).getSingleOrNull(),
//       CouncilRole.member =>
//         db.getThesisMemberId(thesisId: thesisId).getSingleOrNull(),
//     };
//     if (id == null) return null;
//
//     return await ref.watch(teacherByIdProvider(id).future);
//   }
//
//   Future<void> unassign() => assign(null);
//
//   Future<void> assign(int? teacherId) async {
//     final db = await ref.read(driftDatabaseProvider.future);
//     switch (role) {
//       case CouncilRole.president:
//         await db.setThesisPresidentId(
//           thesisId: thesisId,
//           teacherId: teacherId,
//         );
//       case CouncilRole.reviewer1:
//         await db.setThesis1stReviewerId(
//           thesisId: thesisId,
//           teacherId: teacherId,
//         );
//       case CouncilRole.reviewer2:
//         await db.setThesis2ndReviewerId(
//           thesisId: thesisId,
//           teacherId: teacherId,
//         );
//       case CouncilRole.secretary:
//         await db.setThesisSecretaryId(
//           thesisId: thesisId,
//           teacherId: teacherId,
//         );
//       case CouncilRole.member:
//         await db.setThesisMemberId(
//           thesisId: thesisId,
//           teacherId: teacherId,
//         );
//     }
//     ref.invalidateSelf();
//   }
// }
