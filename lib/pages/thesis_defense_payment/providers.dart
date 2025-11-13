import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:fami_tools/business/excel_files.dart';
import 'package:fami_tools/custom_widgets.dart';
import 'package:riverpod/riverpod.dart';

import 'models.dart';

/// Provide excel payment model
final paymentAtmExcelProvider = FutureProvider<ExcelFile>((ref) async {
  final paymentModel = await ref.watch(paymentModelProvider.future);
  final atmModel = paymentModel.paymentAtmModel;
  return ExcelFile.payment.atmTable(model: atmModel);
});

final paymentModelProvider = FutureProvider<ThesisPaymentModel>((ref) async {
  final ids = await ref.watch(paymentRequiredIdsProvider.future);
  final thesisViewModels = <ThesisViewModel>[];

  for (final id in ids) {
    final model = await ref.watch(thesisViewModelProvider(id).future);
    thesisViewModels.add(model);
  }

  final myName = await ref.watch(myNameProvider.future);
  final myFaculty = await ref.watch(myFacultyProvider.future);

  assert(myName != null);
  assert(myFaculty != null);

  return ThesisPaymentModel(
    myName: myName!,
    myFaculty: myFaculty!,
    thesisViewModels: thesisViewModels,
  );
});

final paymentRequiredIdsProvider = AsyncNotifierProvider(
  ThesisIdsNotifier.paymentRequired,
);

final saveDirectoryNotifier = NotifierProvider(
  DirectoryNotifier.new,
);

final thesisViewModelProvider = FutureProvider.family((
  ref,
  int thesisId,
) async {
  final thesis = await ref.watch(thesisByIdProvider(thesisId).future);

  final student = await ref.watch(
    studentByIdProvider(thesis.studentId!).future,
  );

  final supervisor = await ref.watch(
    teacherByIdProvider(thesis.supervisorId).future,
  );
  final president = await ref.watch(
    teacherByIdProvider(thesis.presidentId!).future,
  );
  final secretary = await ref.watch(
    teacherByIdProvider(thesis.secretaryId!).future,
  );
  final firstReviewer = await ref.watch(
    teacherByIdProvider(thesis.firstReviewerId!).future,
  );
  final secondReviewer = await ref.watch(
    teacherByIdProvider(thesis.secondReviewerId!).future,
  );
  final member = await ref.watch(
    teacherByIdProvider(thesis.memberId!).future,
  );

  return ThesisViewModel(
    thesis: thesis,
    supervisor: supervisor,
    student: student,
    president: president,
    secretary: secretary,
    firstReviewer: firstReviewer,
    secondReviewer: secondReviewer,
    member: member,
  );
});
