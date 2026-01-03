import 'package:drift/drift.dart';
import 'package:fami_tools/custom_widgets.dart';
import 'package:riverpod/riverpod.dart';
import '../../business/db_v2_providers.dart';
import '../../business/view_models.dart';
import '../../business/documents.dart';

const reason = 'Thanh toán tiền bồi dưỡng hội đồng chấm luận văn thạc sĩ';

/// TODO: make this a changeable value somewhere in the DB
const paymentPerRole = {
  ThesisPaymentRole.president: 400_000,
  ThesisPaymentRole.reviewer: 400_000,
  ThesisPaymentRole.commentation: 650_000,
  ThesisPaymentRole.secretary: 400_000,
  ThesisPaymentRole.member: 300_000,
};

final thesisIdsProvider = StreamProvider<List<int>>(
  (Ref ref) async* {
    final db = await ref.watch(mainDatabaseProvider.future);
    final stmt = db.thesis.select().join([
      innerJoin(db.student, db.thesis.studentId.equalsExp(db.student.id)),
      innerJoin(
        db.document,
        db.thesis.councilDecisionId.equalsExp(db.document.id),
      ),
    ]);

    stmt.where(db.thesis.paymentStatus.equals(PaymentStatus.unpaid.value));
    stmt.where(
      db.thesis.defenseStatus.equals(ThesisStatus.defenseIntended.value) |
          db.thesis.defenseStatus.equals(ThesisStatus.defenseApplied.value) |
          db.thesis.defenseStatus.equals(ThesisStatus.defenseApproved.value) |
          db.thesis.defenseStatus.equals(ThesisStatus.defenseFailed.value),
    );

    stmt.orderBy([
      OrderingTerm(expression: db.document.signedDate, mode: OrderingMode.asc),
      OrderingTerm(
        expression: db.document.officialCode,
        mode: OrderingMode.asc,
      ),
    ]);

    final mapped = stmt.map((r) => r.read(db.thesis.id));
    await for (final ids in mapped.watch()) {
      yield ids.whereType<int>().toList();
    }
  },
);

final studentsProvider = StreamProvider<List<ThesisViewModel>>(
  (ref) async* {
    final ids = await ref.watch(thesisIdsProvider.future);
    final viewModels = <ThesisViewModel>[];
    for (final id in ids.whereType<int>()) {
      final vm = await ref.watch(ThesisViewModel.providerById(id).future);
      viewModels.add(vm);
    }
    yield viewModels;
  },
);

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

final paymentAtmPdfProvider = FutureProvider.family<PdfFile, PdfConfig>(
  (ref, config) async {
    final model = await ref.watch(paymentAtmModel.future);
    return model.pdf(config);
  },
);

final paymentRequestPdfProvider = FutureProvider.family(
  (ref, PdfConfig config) async {
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

    final pdf = await model.pdf;
    return pdf;
  },
);

final doubleCheckModelProvider = FutureProvider(
  (Ref ref) async {
    final models = await ref.watch(studentsProvider.future);

    final entries = <PaymentDoubleCheckEntry>[];
    for (final model in models) {
      entries.addAll([
        PaymentDoubleCheckEntry(
          teacher: model.requirePresident,
          roles: {ThesisPaymentRole.president},
          paymentPerRole: paymentPerRole,
        ),
        PaymentDoubleCheckEntry(
          teacher: model.requireFirstReviewer,
          roles: {
            ThesisPaymentRole.reviewer,
            ThesisPaymentRole.commentation,
          },
          paymentPerRole: paymentPerRole,
        ),
        PaymentDoubleCheckEntry(
          teacher: model.requireSecondReviewer,
          roles: {
            ThesisPaymentRole.reviewer,
            ThesisPaymentRole.commentation,
          },
          paymentPerRole: paymentPerRole,
        ),
        PaymentDoubleCheckEntry(
          teacher: model.requireSecretary,
          roles: {ThesisPaymentRole.secretary},
          paymentPerRole: paymentPerRole,
        ),
        PaymentDoubleCheckEntry(
          teacher: model.requireMember,
          roles: {ThesisPaymentRole.member},
          paymentPerRole: paymentPerRole,
        ),
      ]);
    }

    final model = PaymentDoubleCheckModel(
      title: reason,
      roles: ThesisPaymentRole.values,
      entries: entries,
    );

    return model;
  },
);

final paymentDoubleCheckPdfProvider = FutureProvider.family(
  (ref, PdfConfig config) async {
    final model = await ref.watch(doubleCheckModelProvider.future);
    final pdf = await model.pdf(config: config);
    return pdf;
  },
);

final paymentDoubleCheckSummaryPdfProvider = FutureProvider.family(
  (ref, PdfConfig config) async {
    final model = await ref.watch(doubleCheckModelProvider.future);
    final pdf = await model.pdf(config: config);
    return pdf;
  },
);

final paymentListingModel = FutureProvider<PaymentListingModel>(
  (ref) async {
    final models = await ref.watch(studentsProvider.future);
    final insiderEntries = <PaymentListingEntry>[];
    final outsiderEntries = <PaymentListingEntry>[];
    for (final model in models) {
      final councilDecision = model.requireCouncilDecision.document;
      final reason =
          "Thanh toán tiền bồi dưỡng hội đồng chấm luận văn thạc sĩ theo QĐ ${councilDecision.fullLabel}";

      int insiderAmount = 0;
      int outsiderAmount = 0;
      for (final role in ThesisPaymentRole.values) {
        final paymentAmount = paymentPerRole[role] ?? 0;
        final teachers = switch (role) {
          ThesisPaymentRole.president => {model.requirePresident},
          ThesisPaymentRole.reviewer => {
            model.requireFirstReviewer,
            model.requireSecondReviewer,
          },
          ThesisPaymentRole.commentation => {
            model.requireFirstReviewer,
            model.requireSecondReviewer,
          },
          ThesisPaymentRole.secretary => {model.requireSecretary},
          ThesisPaymentRole.member => {model.requireMember},
        };

        for (final teacher in teachers) {
          if (teacher.isOutsider) {
            outsiderAmount += paymentAmount;
          } else {
            insiderAmount += paymentAmount;
          }
        }
      }

      insiderEntries.add(
        PaymentListingModel.entry(reason: reason, amount: insiderAmount),
      );
      outsiderEntries.add(
        PaymentListingModel.entry(reason: reason, amount: outsiderAmount),
      );
    }

    final listingModel = PaymentListingModel(
      reason: reason,
      insiderEntries: insiderEntries,
      outsiderEntries: outsiderEntries,
    );

    return listingModel;
  },
);

final paymentListingPdfProvider = FutureProvider.family(
  (ref, PdfConfig config) async {
    final model = await ref.watch(paymentListingModel.future);
    final pdf = await model.pdf(config: config);
    return pdf;
  },
);
