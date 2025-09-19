import 'package:fami_tools/business/db_v2_providers/thesis.dart';
import 'package:fami_tools/pages/admission/_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/domain_objects.dart';
import './payment_pdf.dart';

export '../../business/db_v1_providers.dart'
    hide teacherByIdProvider, TeacherById;
export '../../business/db_v2_providers.dart';

const trackingColumn = "flag_tracking";

final paymentViewModelProvider = AsyncNotifierProvider(
  PaymentViewModelNotifier.new,
);
final thesisViewModelByIdProvider = AsyncNotifierProvider.family(
  ThesisViewModelById.new,
);
final trackedThesesViewModelsProvider = AsyncNotifierProvider(
  TrackedThesesViewModel.new,
);

class PaymentViewModelNotifier extends AsyncNotifier<ThesisPaymentPdfModel> {
  @override
  Future<ThesisPaymentPdfModel> build() async {
    final thesesIds = await ref.watch(trackedThesisIdsProvider.future);
    final theses = <Thesis>[];
    for (final id in thesesIds) {
      final thesis = await ref.watch(thesisByIdProvider(id).future);
      theses.add(thesis);
    }
    return await ThesisPaymentPdfModel.createFrom(
      theses: theses,
      paymentReason: "Hội đồng chấm luận văn thạc sĩ",
    );
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

  Future<void> assignMember(int? teacherId) async {
    await thesis.updateUyVien(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
  }

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
}

class ThesisViewModelById extends AsyncNotifier<ThesisViewModel> {
  final int thesisId;
  ThesisViewModelById(this.thesisId);

  Future<void> assignMember(int teacherId) async {
    final thesis = state.value!.thesis;
    await thesis.updateUyVien(teacherId);
    ref.invalidate(thesisByIdProvider(thesisId));
    ref.invalidateSelf();
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

  @override
  Future<ThesisViewModel> build() async {
    final thesis = await ref.watch(thesisByIdProvider(thesisId).future);
    final student = thesis.hocVien;
    final supervisor = thesis.giangVien;

    // This returns [TeacherData], while the ViewModel uses [Teacher] (v1).
    await ref.watch(thesisPresidentProvider(thesisId).future);
    await ref.watch(thesisReviewer1Provider(thesisId).future);
    await ref.watch(thesisReviewer2Provider(thesisId).future);
    await ref.watch(thesisSecretaryProvider(thesisId).future);
    await ref.watch(thesisMemberProvider(thesisId).future);

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
}

class TrackedThesesViewModel extends AsyncNotifier<List<ThesisViewModel>> {
  @override
  Future<List<ThesisViewModel>> build() async {
    // Get tracked Ids
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
