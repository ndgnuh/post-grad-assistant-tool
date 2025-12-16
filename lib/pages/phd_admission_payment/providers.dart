import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:fami_tools/business/selection_models.dart';
import 'package:riverpod/riverpod.dart';

import '../../business/documents.dart';
import '../../business/view_models.dart';

class PaymentModel {
  final List<PhdStudentViewModel> viewModels;
  final String myName;
  final String myFaculty;

  PaymentModel({
    required this.viewModels,
    required this.myName,
    required this.myFaculty,
  });

  String get paymentReason =>
      "Thanh toán chấm đề cương nghiên cứu sinh cho ${viewModels.length} NCS";

  int get paymentAmount {
    int total = 0;
    for (final vm in viewModels) {
      final policy = vm.admissionPaymentPolicy;
      total += policy.presidentPayment;
      total += policy.secretaryPayment;
      total += policy.memberPayment * 3;
      total += policy.helperPayment;
    }
    return total;
  }

  PaymentRequestModel get paymentRequestModel {
    return PaymentRequestModel(
      requesterName: myName,
      requesterFalcuty: myFaculty,
      paymentReason: paymentReason,
      paymentAmount: paymentAmount,
    );
  }

  PaymentAtmModel get paymentAtmModel {
    final entries = <PaymentAtmEntry>[];
    for (final vm in viewModels) {
      final policy = vm.admissionPaymentPolicy;
      assert(vm.admissionPresident != null, "Chưa có chủ tịch hội đồng");
      assert(vm.admissionSecretary != null, "Chưa có thư ký hội đồng");
      assert(vm.admissionMember1 != null, "Chưa có ủy viên hội đồng 1");
      assert(vm.admissionMember2 != null, "Chưa có ủy viên hội đồng 2");
      assert(vm.admissionMember3 != null, "Chưa có ủy viên hội đồng 3");
      entries.addAll([
        PaymentAtmEntry(
          teacher: vm.admissionPresident!,
          amount: policy.presidentPayment,
        ),
        PaymentAtmEntry(
          teacher: vm.admissionSecretary!,
          amount: policy.secretaryPayment,
        ),
        PaymentAtmEntry(
          teacher: vm.admissionMember1!,
          amount: policy.memberPayment,
        ),
        PaymentAtmEntry(
          teacher: vm.admissionMember2!,
          amount: policy.memberPayment,
        ),
        PaymentAtmEntry(
          teacher: vm.admissionMember3!,
          amount: policy.memberPayment,
        ),
        if (policy.helperPayment > 0 && vm.admissionHelper != null)
          PaymentAtmEntry(
            teacher: vm.admissionHelper!,
            amount: policy.helperPayment,
          ),
      ]);
    }

    return PaymentAtmModel(
      entries: entries,
      reason: paymentReason,
    );
  }

  Future<PdfFile> get paymentRequestPdf => paymentRequestModel.pdf;
  Future<PdfFile> get paymentAtmPdf => paymentAtmModel.pdf;
  XlsxFile get paymentAtmXlsx => paymentAtmModel.xlsx;
}

final phdCohortSelectionProvider = AsyncNotifierProvider(
  () => PhdCohortSelectionModelNotifier('admission-payment'),
);

final phdStudentIdsProvider = FutureProvider<List<int>>(
  (ref) async {
    final model = await ref.watch(phdCohortSelectionProvider.future);
    final cohort = model.selected;

    if (cohort == null) {
      return <int>[];
    }

    final ids = await ref.watch(_idsProvider(cohort).future);
    return ids;
  },
);

final _idsProvider = AsyncNotifierProvider.family(
  (PhdCohortData cohort) => PhdStudentIdsNotifier(
    cohort: cohort,
    paymentStatus: PaymentStatus.unpaid,
  ),
);

final paymentModelProvider = FutureProvider<PaymentModel>(
  (ref) async {
    final ids = await ref.watch(phdStudentIdsProvider.future);
    final viewModels = await Future.wait([
      for (final id in ids)
        ref.watch(PhdStudentViewModel.providerById(id).future),
    ]);
    final myName = await ref.watch(myNameProvider.future);
    final myFaculty = await ref.watch(myFacultyProvider.future);

    assert(myName != null);
    assert(myFaculty != null);

    return PaymentModel(
      viewModels: viewModels,
      myName: myName!,
      myFaculty: myFaculty!,
    );
  },
);

final paymentRequestProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentModelProvider.future);
    return model.paymentRequestModel;
  },
);

final paymentRequestPdfProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentRequestProvider.future);
    return model.pdf;
  },
);

final paymentRequestDocxProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentRequestProvider.future);
    return model.docx;
  },
);

final paymentAtmProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentModelProvider.future);
    return model.paymentAtmModel;
  },
);

final paymentAtmPdfProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentAtmProvider.future);
    return model.pdf;
  },
);

final paymentAtmXlsxProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentAtmProvider.future);
    return model.xlsx;
  },
);
