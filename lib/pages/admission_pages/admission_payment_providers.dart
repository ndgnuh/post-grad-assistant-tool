import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../business/pdfs/pdfs.dart' as pdfs;
import '../../preferences.dart';
import 'providers.dart';

const _memberPay = 60_000;
const _perCouncilPay = _presidentPay + _secretaryPay + _memberPay * 3;
const _presidentPay = 70_000;
const _secretaryPay = 70_000;

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

  final model = pdfs.AdmissionPaymentTableModel(
    president: president!,
    secretary: secretary!,
    member1: member1!,
    member2: member2!,
    member3: member3!,
    numberOfStudents: numStudents,
    presidentAllowance: _presidentPay,
    secretaryAllowance: _secretaryPay,
    memberAllowance: _memberPay,
  );
  return pdfs.admissionPaymentTablePdf(model: model);
});

final paymentAtmPdfProvider = FutureProvider<Uint8List>((ref) async {
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

  final model = pdfs.PaymentAtmModel(
    reason: _paymentReason(council.year),
    entries: [
      pdfs.PaymentAtmEntry(
        teacher: president!,
        amount: _presidentPay * numStudents,
      ),
      pdfs.PaymentAtmEntry(
        teacher: secretary!,
        amount: _secretaryPay * numStudents,
      ),
      pdfs.PaymentAtmEntry(
        teacher: member1!,
        amount: _memberPay * numStudents,
      ),
      pdfs.PaymentAtmEntry(
        teacher: member2!,
        amount: _memberPay * numStudents,
      ),
      pdfs.PaymentAtmEntry(
        teacher: member3!,
        amount: _memberPay * numStudents,
      ),
    ],
  );
  return pdfs.paymentAtmPdf(model: model);
});

final paymentRequestPdfProvider = FutureProvider((ref) async {
  final myName = await ref.watch(myNameProvider.future);
  final myOrganization = await ref.watch(myDivisionProvider.future);
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
  final pdf = pdfs.paymentRequestPdf(
    requesterName: myName!,
    requesterOrganization: myOrganization,
    paymentReason: reason,
    paymentAmount: amount,
  );
  return pdf;
});

final paymentStudentIdsProvider = AsyncNotifierProvider.family(
  (AdmissionCouncilData council) =>
      StudentIdsNotifier(admissionCouncil: council),
);

final saveDirectoryProvider = NotifierProvider(
  SaveDirectoryNotifier.new,
);

String _paymentReason(Object year) =>
    "Bồi dưỡng tiểu ban xét tuyển thạc sĩ theo định hướng nghiên cứu năm $year";

class SaveDirectoryNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void set(String? directory) => state = directory;
}
