import 'package:drift/drift.dart';
import 'package:fami_tools/custom_widgets.dart';
import 'package:riverpod/riverpod.dart';
import '../../business/db_v2_providers.dart';
import '../../business/view_models.dart';
import '../../business/documents.dart';

const reason = 'Thanh toán tiền bồi dưỡng hội đồng chấm luận văn thạc sĩ';

final studentsProvider = FutureProvider<List<ThesisViewModel>>((ref) async {
  final db = await ref.watch(mainDatabaseProvider.future);
  final stmt = db.thesis.select().join([
    innerJoin(db.student, db.thesis.studentId.equalsExp(db.student.id)),
  ]);

  stmt.where(db.thesis.paymentStatus.equals(PaymentStatus.unpaid.value));
  stmt.where(
    db.thesis.defenseStatus.equals(ThesisStatus.defenseIntended.value) |
        db.thesis.defenseStatus.equals(ThesisStatus.defenseApplied.value) |
        db.thesis.defenseStatus.equals(ThesisStatus.defenseApproved.value) |
        db.thesis.defenseStatus.equals(ThesisStatus.defenseFailed.value),
  );

  stmt.orderBy([
    OrderingTerm(expression: db.thesis.defenseDecisionNumber),
    OrderingTerm(expression: db.thesis.defenseDate),
  ]);

  if (ref.isFirstBuild) {
    stmt.watch().listen((rows) {
      // Just to trigger updates
      ref.invalidateSelf();
    });
  }

  final ids = await stmt.map((r) => r.read(db.thesis.id)).get();

  final viewModels = <ThesisViewModel>[];
  for (final id in ids.whereType<int>()) {
    final vm = await ref.watch(ThesisViewModel.providerById(id).future);
    viewModels.add(vm);
  }
  return viewModels;
});

final paymentAtmModel = FutureProvider<PaymentAtmModel>((ref) async {
  // Get all the theses
  final students = await ref.watch(studentsProvider.future);
  final viewModels = <ThesisViewModel>[];
  for (final student in students) {
    final id = student.thesis.id;
    final modelProvider = ThesisViewModel.providerById(id);
    viewModels.add(await ref.watch(modelProvider.future));
  }

  final entries = <PaymentAtmEntry>[];
  for (final vm in viewModels) {
    entries.add(
      PaymentAtmEntry(
        teacher: vm.requirePresident,
        amount: 400_000,
      ),
    );

    entries.add(
      PaymentAtmEntry(
        teacher: vm.requireFirstReviewer,
        amount: 1_050_000,
      ),
    );

    entries.add(
      PaymentAtmEntry(
        teacher: vm.requireSecondReviewer,
        amount: 1_050_000,
      ),
    );

    entries.add(
      PaymentAtmEntry(
        teacher: vm.requireSecretary,
        amount: 400_000,
      ),
    );

    entries.add(
      PaymentAtmEntry(
        teacher: vm.requireMember,
        amount: 300_000,
      ),
    );
  }

  final model = PaymentAtmModel(
    reason: reason,
    entries: entries,
  );

  return model;
});

final paymentAtmPdf = FutureProvider.family<PdfFile, PdfConfig>(
  (ref, config) async {
    final model = await ref.watch(paymentAtmModel.future);
    return model.pdf(config);
  },
);

final paymentRequestPdfProvider = FutureProvider.family<PdfFile, PdfConfig>(
  (ref, config) async {
    final myName = await ref.watch(myNameProvider.future);
    final myFaculty = await ref.watch(myFacultyProvider.future);
    final theses = await ref.watch(studentsProvider.future);
    final model = PaymentRequestModel(
      paymentReason: reason,
      requesterName: myName,
      requesterFalcuty: myFaculty!,
      paymentAmount:
          theses.length * (400_000 + 1_050_000 + 1_050_000 + 400_000 + 300_000),
    );

    return model.pdf;
  },
);
