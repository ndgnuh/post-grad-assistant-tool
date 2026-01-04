import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/pages/pages.dart';
import 'package:flutter/services.dart';
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

Stream<List<int>> fetchPaymentThesisIds(AppDatabase db) async* {
  final stmt = db.selectOnly(db.thesis).join([
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

  stmt.addColumns([db.thesis.id]);

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
}

final thesisIdsProvider = StreamProvider<List<int>>(
  (Ref ref) async* {
    final db = await ref.watch(mainDatabaseProvider.future);
    yield* fetchPaymentThesisIds(db);
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

final paymentAtmPdfProvider = FutureProvider(
  (ref) async {
    final config = ref.watch(paymentAtmPdfConfigProvider);
    final model = await ref.watch(paymentAtmModel.future);

    return model.buildPdf(config);
  },
);

final totalAmountProvider = FutureProvider<int>(
  (ref) async {
    final ids = await ref.watch(thesisIdsProvider.future);
    final roles = [
      ThesisPaymentRole.president,
      ThesisPaymentRole.reviewer,
      ThesisPaymentRole.commentation,
      ThesisPaymentRole.reviewer,
      ThesisPaymentRole.commentation,
      ThesisPaymentRole.secretary,
      ThesisPaymentRole.member,
    ];

    final paymentPerThesis = [
      for (final role in roles) paymentPerRole[role] ?? 0,
    ].reduce((acc, v) => acc + v);

    final totalAmount = ids.length * paymentPerThesis;
    return totalAmount;
  },
);

final paymentRequestProvider = FutureProvider(
  (ref) async {
    final paymentAmount = await ref.watch(totalAmountProvider.future);
    final myName = await ref.watch(myNameProvider.future);
    final myFaculty = await ref.watch(myFacultyProvider.future);
    final model = PaymentRequestModel(
      paymentReason: reason,
      requesterName: myName,
      requesterFalcuty: myFaculty!,
      paymentAmount: paymentAmount,
    );

    return model;
  },
);

final paymentRequestPdfProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentRequestProvider.future);
    final pdf = await model.pdf;
    return pdf;
  },
);

final paymentRequestDocxProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentRequestProvider.future);
    return await model.docx;
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

final paymentDoubleCheckPdfProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(doubleCheckModelProvider.future);
    final config = ref.watch(paymentDoubleCheckPdfConfigProvider);
    final pdf = await model.pdf(config: config);
    return pdf;
  },
);

final paymentDoubleCheckSummaryPdfProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(doubleCheckModelProvider.future);
    final config = ref.watch(paymentDoubleCheckSummaryPdfConfigProvider);
    final pdf = await model.summaryPdf(config: config);
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

final paymentListingPdfProvider = FutureProvider(
  (ref) async {
    final model = await ref.watch(paymentListingModel.future);
    final config = ref.watch(paymentListingPdfConfigProvider);
    final pdf = await model.pdf(config: config);
    return pdf;
  },
);

final paymentSpendingDecisionDocxProvider = FutureProvider(
  (Ref ref) async {
    final managementRegulation = await ref.watch(
      regulationProvider(DocumentArchetype.organizationRegulation).future,
    );
    print(managementRegulation);

    final financialManagementRegulation = await ref.watch(
      regulationProvider(
        DocumentArchetype.financialManagementRegulation,
      ).future,
    );
    print(financialManagementRegulation);

    final internalSpendingRegulation = await ref.watch(
      regulationProvider(
        DocumentArchetype.internalSpendingRegulation,
      ).future,
    );
    print(internalSpendingRegulation);

    final totalAmount = await ref.watch(totalAmountProvider.future);

    final model = MscThesisSpendingDecisionDocument(
      internalSpendingRegulation: internalSpendingRegulation,
      financialManagementRegulation: financialManagementRegulation,
      managementRegulation: managementRegulation,
      totalAmount: totalAmount,
    );

    final docx = await model.buildDocx();
    return docx;
  },
);

final paymentAtmXlsxProvider = FutureProvider<XlsxFile>(
  (ref) async {
    final model = await ref.watch(paymentAtmModel.future);
    return model.xlsx;
  },
);

final paymentDoubleCheckXlsxProvider = FutureProvider<XlsxFile>(
  (ref) async {
    final model = await ref.watch(doubleCheckModelProvider.future);
    return model.xlsx;
  },
);

final paymentAtmPdfConfigProvider = NotifierProvider(
  () => StateNotifier(initialValue: PaymentAtmModel.defaultPdfConfig),
);

final paymentRequestPdfConfigProvider = NotifierProvider(
  () => StateNotifier(initialValue: PdfConfig()),
);

final paymentListingPdfConfigProvider = NotifierProvider(
  () => StateNotifier(initialValue: PaymentListingModel.defaultPdfConfig),
);

final paymentDoubleCheckPdfConfigProvider = NotifierProvider(
  () => StateNotifier(initialValue: PdfConfig()),
);

final paymentDoubleCheckSummaryPdfConfigProvider = NotifierProvider(
  () => StateNotifier(initialValue: PdfConfig()),
);

final allDocumentsProvider = FutureProvider<List<InMemoryDocument>>(
  (ref) async {
    final providers = [
      paymentAtmXlsxProvider,
      paymentAtmPdfProvider,
      paymentListingPdfProvider,
      paymentDoubleCheckPdfProvider,
      paymentDoubleCheckSummaryPdfProvider,
      paymentRequestPdfProvider,
      paymentRequestDocxProvider,
      paymentSpendingDecisionDocxProvider,
    ];

    final futures = <Future<InMemoryDocument>>[
      for (final provider in providers) ref.watch(provider.future),
    ];

    return Future.wait(futures);
  },
);
