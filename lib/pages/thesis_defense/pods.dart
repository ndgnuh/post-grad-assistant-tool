import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../business/domain_objects.dart';
import '../../business/drift_orm.dart';
import './payment_pdf.dart';

part 'pods.g.dart';

const trackingColumn = "flag_tracking";

enum CouncilRole {
  president,
  reviewer1,
  reviewer2,
  secretary,
  member,
}

@riverpod
class TrackedThesisIds extends _$TrackedThesisIds {
  @override
  Future<List<int>> build() async {
    final db = await ref.watch(myDriftDatabaseProvider.future);
    return await db.getTrackingThesisIds().get();
  }

  Future<void> untrack(int thesisId) async {
    final db = await ref.watch(myDriftDatabaseProvider.future);
    await db.untrackThesis(thesisId: thesisId);
    ref.invalidateSelf();
  }

  Future<void> track(int thesisId) async {
    final db = await ref.watch(myDriftDatabaseProvider.future);
    await db.trackThesis(thesisId: thesisId);
    ref.invalidateSelf();
  }
}

@riverpod
class TrackedThesesViewModel extends _$TrackedThesesViewModel {
  @override
  Future<List<ThesisViewModel>> build() async {
    final List<int> thesisIds = await ref.watch(
      trackedThesisIdsProvider.future,
    );
    final futures = thesisIds.map((int id) {
      final provider = thesisViewModelByIdProvider(id).future;
      return ref.watch(provider);
    }).toList();
    final thesisViewModels = await Future.wait(futures);

    // Sort by defense date and by name
    thesisViewModels.sort((a, b) {
      final dateA = a.thesis.ngayBaoVe ?? DateTime(1900);
      final dateB = b.thesis.ngayBaoVe ?? DateTime(1900);
      final comp1 = dateA.compareTo(dateB);

      final nameA = a.student?.hoTen.split(' ').last ?? '';
      final nameB = b.student?.hoTen.split(' ').last ?? '';
      final comp2 = nameA.compareTo(nameB);
      return comp1 != 0 ? comp1 : comp2;
    });

    return thesisViewModels;
  }
}

class ThesisViewModel {
  final Thesis thesis;
  final Student? student;
  final Teacher supervisor;
  final Teacher? president;
  final Teacher? reviewer1;
  final Teacher? reviewer2;
  final Teacher? secretary;
  final Teacher? member;
  final String? group;
  final Ref ref;

  ThesisViewModel({
    required this.ref,
    required this.thesis,
    required this.supervisor,
    this.student,
    this.president,
    this.reviewer1,
    this.reviewer2,
    this.secretary,
    this.member,
    this.group,
  });

  int get thesisId => thesis.id!;

  Future<void> assignPresident(int teacherId) async {
    await thesis.updateChuTich(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
  }

  Future<void> assignReviewer1(int teacherId) async {
    await thesis.updatePhanBien1(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
  }

  Future<void> assignReviewer2(int? teacherId) async {
    await thesis.updatePhanBien2(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }

  Future<void> assignSecretary(int? teacherId) async {
    await thesis.updateThuKy(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }

  Future<void> assignMember(int? teacherId) async {
    await thesis.updateUyVien(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }
}

@riverpod
class ThesisById extends _$ThesisById {
  @override
  Future<Thesis> build(int id) async {
    final thesis = await Thesis.getById(id);
    return thesis;
  }
}

@riverpod
class ThesisViewModelById extends _$ThesisViewModelById {
  @override
  late int thesisId;
  @override
  Future<ThesisViewModel> build(int thesisId) async {
    this.thesisId = thesisId;

    final thesis = await ref.watch(thesisByIdProvider(thesisId).future);
    final student = thesis.hocVien;
    final supervisor = thesis.giangVien;

    final presidentProvider = thesisCouncilMemberProvider(
      (thesisId: thesisId, role: CouncilRole.president),
    );
    final reviewer1Provider = thesisCouncilMemberProvider(
      (thesisId: thesisId, role: CouncilRole.reviewer1),
    );
    final reviewer2Provider = thesisCouncilMemberProvider(
      (thesisId: thesisId, role: CouncilRole.reviewer2),
    );
    final secretaryProvider = thesisCouncilMemberProvider(
      (thesisId: thesisId, role: CouncilRole.secretary),
    );
    final memberProvider = thesisCouncilMemberProvider(
      (thesisId: thesisId, role: CouncilRole.member),
    );

    await ref.watch(presidentProvider.future);
    await ref.watch(reviewer1Provider.future);
    await ref.watch(reviewer2Provider.future);
    await ref.watch(secretaryProvider.future);
    await ref.watch(memberProvider.future);

    // TODO: update everything to the drift database
    // For compat reason, this is not assigned to a variable
    final president = await thesis.chuTich;
    final reviewer1 = await thesis.phanBien1;
    final reviewer2 = await thesis.phanBien2;
    final secretary = await thesis.thuKy;
    final member = await thesis.uyVien;

    return ThesisViewModel(
      ref: ref,
      supervisor: supervisor,
      thesis: thesis,
      student: student,
      president: president,
      reviewer1: reviewer1,
      reviewer2: reviewer2,
      secretary: secretary,
      member: member,
      group: thesis.group,
    );
  }

  Future<void> assignPresident(int teacherId) async {
    final thesis = state.value!.thesis;
    await thesis.updateChuTich(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }

  Future<void> assignReviewer1(int teacherId) async {
    final thesis = state.value!.thesis;
    await thesis.updatePhanBien1(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }

  Future<void> assignReviewer2(int teacherId) async {
    final thesis = state.value!.thesis;
    await thesis.updatePhanBien2(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }

  Future<void> assignSecretary(int teacherId) async {
    final thesis = state.value!.thesis;
    await thesis.updateThuKy(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }

  Future<void> assignMember(int teacherId) async {
    final thesis = state.value!.thesis;
    await thesis.updateUyVien(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }
}

@riverpod
Future<List<Thesis>> thesesByIds(Ref ref, List<int> ids) async {
  final futures = ids.map((int id) {
    final provider = thesisByIdProvider(id).future;
    return ref.watch(provider);
  }).toList();
  final theses = await Future.wait(futures);

  // Sort by defense date and by name
  return theses..sort((a, b) {
    final dateA = a.ngayBaoVe ?? DateTime(1900);
    final dateB = b.ngayBaoVe ?? DateTime(1900);
    final comp1 = dateA.compareTo(dateB);

    final nameA = a.hocVien?.hoTen.split(' ').last ?? '';
    final nameB = b.hocVien?.hoTen.split(' ').last ?? '';
    final comp2 = nameA.compareTo(nameB);
    return comp1 != 0 ? comp1 : comp2;
  });
}

@riverpod
Future<ThesisPaymentPdfModel> paymentViewModel(Ref ref) async {
  final thesesIds = await ref.watch(trackedThesisIdsProvider.future);
  final theses = await ref.watch(thesesByIdsProvider(thesesIds).future);
  return await ThesisPaymentPdfModel.createFrom(
    theses: theses,
    paymentReason: "Hội đồng chấm luận văn thạc sĩ",
  );
}

@riverpod
class ThesisCouncilMember extends _$ThesisCouncilMember {
  late CouncilRole role;
  late int thesisId;
  late MyDriftDatabase db;

  @override
  Future<TeacherData?> build(({int thesisId, CouncilRole role}) args) async {
    role = args.role;
    thesisId = args.thesisId;
    db = await ref.watch(myDriftDatabaseProvider.future);

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

  Future<void> unassign() => assign(null);

  Future<void> assign(int? teacherId) async {
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
    ref.invalidateSelf();
  }
}
