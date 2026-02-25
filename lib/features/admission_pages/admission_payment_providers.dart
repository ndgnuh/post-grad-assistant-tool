import 'dart:typed_data';

import '../../business/documents/pdf_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../business/db_v2_providers.dart';
import '../../business/documents/models/document_models.dart';
import '../../business/documents.dart';
import 'providers.dart';

const _memberPay = 60_000;
const _perCouncilPay = _presidentPay + _secretaryPay + _memberPay * 3;
const _presidentPay = 70_000;
const _secretaryPay = 70_000;

final paymentListingPdfProvider = FutureProvider<PdfFile>((ref) async {
  final councilSelecionModel = await ref.watch(
    admissionCouncilSelectionProvider.future,
  );
  final maybeCouncil = councilSelecionModel.selected;
  assert(maybeCouncil != null, "Chưa chọn hội đồng tuyển sinh");
  final council = maybeCouncil!;

  // List students of this council
  final ids = await ref.watch(
    paymentStudentIdsProvider(council).future,
  );
  final students = await Future.wait(
    ids.map(
      (id) => ref.watch(studentByIdProvider(id).future),
    ),
  );

  // Teachers in the council
  final entries = <PaymentListingEntry>[];
  final estDate = council.establishmentDecisionDate;
  final estCode = council.establishmentDecisionId;
  final estDateStr = DateFormat("dd/MM/yyyy").format(estDate);
  for (final student in students) {
    final PaymentListingEntry entry = (
      amount: _perCouncilPay,
      reason:
          "Thanh toán tiền cho tiểu ban xét tuyển thạc sĩ theo định hướng nghiên cứu của thí sinh ${student.name}, theo Quyết định số $estCode ngày $estDateStr",
    );
    entries.add(entry);
  }

  /// Creating the PDF model
  final model = AdmissionPaymentListingModel(
    establishmentDecisionCode: estCode,
    establishmentDecisionDate: estDate,
    paymentPerStudent: _perCouncilPay,
    studentNames: students.map((e) => e.name).toList(),
  );
  return admissionPaymentListingPdf(model: model);
});

final paymentTablePdfProvider = FutureProvider<Uint8List>((ref) async {
  final councilSelecionModel = await ref.watch(
    admissionCouncilSelectionProvider.future,
  );
  final maybeCouncil = councilSelecionModel.selected;
  assert(maybeCouncil != null, "Chưa chọn hội đồng tuyển sinh");
  final council = maybeCouncil!;

  // Number of students
  final ids = await ref.watch(
    paymentStudentIdsProvider(council).future,
  );
  final numStudents = ids.length;

  // Teachers in the council
  final president = await ref.watch(
    teacherByIdProvider(council.presidentId).future,
  );
  final secretary = await ref.watch(
    teacherByIdProvider(council.secretaryId).future,
  );
  final member1 = await ref.watch(
    teacherByIdProvider(council.member1Id).future,
  );
  final member2 = await ref.watch(
    teacherByIdProvider(council.member2Id).future,
  );
  final member3 = await ref.watch(
    teacherByIdProvider(council.member3Id).future,
  );

  final model = AdmissionPaymentTableModel(
    establishmentDecisionCode: council.establishmentDecisionId,
    establishmentDecisionDate: council.establishmentDecisionDate,
    president: president,
    secretary: secretary,
    member1: member1,
    member2: member2,
    member3: member3,
    numberOfStudents: numStudents,
    presidentAllowance: _presidentPay,
    secretaryAllowance: _secretaryPay,
    memberAllowance: _memberPay,
  );
  return admissionPaymentTablePdf(model: model);
});

final paymentAtmProvider = FutureProvider<PaymentAtmModel>((ref) async {
  final councilSelecionModel = await ref.watch(
    admissionCouncilSelectionProvider.future,
  );
  final maybeCouncil = councilSelecionModel.selected;
  assert(maybeCouncil != null, "Chưa chọn hội đồng tuyển sinh");
  final council = maybeCouncil!;

  // Number of students
  final ids = await ref.watch(
    paymentStudentIdsProvider(council).future,
  );
  final numStudents = ids.length;

  // Teachers in the council
  final president = await ref.watch(
    teacherByIdProvider(council.presidentId).future,
  );
  final secretary = await ref.watch(
    teacherByIdProvider(council.secretaryId).future,
  );
  final member1 = await ref.watch(
    teacherByIdProvider(council.member1Id).future,
  );
  final member2 = await ref.watch(
    teacherByIdProvider(council.member2Id).future,
  );
  final member3 = await ref.watch(
    teacherByIdProvider(council.member3Id).future,
  );

  final model = PaymentAtmModel(
    reason: _paymentReason(council.year),
    entries: [
      PaymentAtmEntry(
        teacher: president,
        amount: _presidentPay * numStudents,
      ),
      PaymentAtmEntry(
        teacher: secretary,
        amount: _secretaryPay * numStudents,
      ),
      PaymentAtmEntry(
        teacher: member1,
        amount: _memberPay * numStudents,
      ),
      PaymentAtmEntry(
        teacher: member2,
        amount: _memberPay * numStudents,
      ),
      PaymentAtmEntry(
        teacher: member3,
        amount: _memberPay * numStudents,
      ),
    ],
  );

  return model;
});

final paymentAtmPdfProvider = FutureProvider<PdfFile>((ref) async {
  final model = await ref.watch(paymentAtmProvider.future);
  return model.buildPdf();
});

final paymentAtmXlsxProvider = FutureProvider<XlsxFile>((ref) async {
  final model = await ref.watch(paymentAtmProvider.future);
  return model.xlsx;
});

final paymentRequestProvider = FutureProvider((ref) async {
  final myName = await ref.watch(myNameProvider.future);
  final myOrganization = await ref.watch(myFacultyProvider.future);
  final councilSelecionModel = await ref.watch(
    admissionCouncilSelectionProvider.future,
  );
  final council = councilSelecionModel.selected!;

  // Amount
  final ids = await ref.watch(
    paymentStudentIdsProvider(council).future,
  );
  final amount = _perCouncilPay * ids.length;

  final reason = _paymentReason(council.year);
  final model = PaymentRequestModel(
    requesterName: myName,
    requesterFalcuty: myOrganization!,
    paymentReason: reason,
    paymentAmount: amount,
  );
  return model;
});

final paymentRequestPdfProvider = FutureProvider((ref) async {
  final model = await ref.watch(paymentRequestProvider.future);
  return model.pdf;
});

final paymentRequestDocxProvider = FutureProvider((ref) async {
  final model = await ref.watch(paymentRequestProvider.future);
  return model.docx;
});

final paymentStudentIdsProvider = AsyncNotifierProvider.family(
  (AdmissionCouncilData council) =>
      StudentIdsNotifier(admissionCouncil: council),
);

final saveDirectoryProvider = NotifierProvider(
  SaveDirectoryNotifier.new,
);

String _paymentReason(Object year, [bool linebreak = false]) =>
    "Bồi dưỡng tiểu ban xét tuyển thạc sĩ${linebreak ? '\n' : ' '}theo định hướng nghiên cứu năm $year";

class SaveDirectoryNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void set(String? directory) => state = directory;
}
