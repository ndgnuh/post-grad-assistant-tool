import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:fami_tools/business/documents.dart';

class ThesisViewModel {
  final ThesisData thesis;
  final TeacherData supervisor;
  final StudentData student;
  final TeacherData president;
  final TeacherData secretary;
  final TeacherData firstReviewer;
  final TeacherData secondReviewer;
  final TeacherData member;

  const ThesisViewModel({
    required this.thesis,
    required this.supervisor,
    required this.student,
    required this.president,
    required this.secretary,
    required this.firstReviewer,
    required this.secondReviewer,
    required this.member,
  });
}

class ThesisPaymentModel {
  final String myName;
  final String myFaculty;
  final String reason;
  final List<ThesisViewModel> thesisViewModels;

  ThesisPaymentModel({
    this.reason = "HỘI ĐỒNG CHẤM LUẬN VĂN THẠC SĨ",
    required this.thesisViewModels,
    required this.myName,
    required this.myFaculty,
  });

  int get totalPaymentAmount {
    int total = 0;
    for (final _ in thesisViewModels) {
      total += 0; // Total payment per thesis
    }
    return total;
  }

  /// Payment request model
  PaymentRequestModel get paymentRequestModel {
    return PaymentRequestModel(
      requesterName: myName,
      requesterFalcuty: myFaculty,
      paymentReason: reason,
      paymentAmount: totalPaymentAmount,
    );
  }

  /* All the generated documents */
  Future<PdfFile> get paymentRequestPdf => paymentRequestModel.pdf;
  Future<DocxFile> get paymentRequestDocx => paymentRequestModel.docx;
  Future<PdfFile> get paymentAtmPdf => paymentAtmModel.buildPdf();
  Future<XlsxFile> get paymentAtmXlsx => paymentAtmModel.xlsx;

  /// Model used to build Payment ATM document (PDF/Excel)
  PaymentAtmModel get paymentAtmModel {
    final teachers = <TeacherData>{};
    final timesPresident = <TeacherData, int>{};
    final timesSecretary = <TeacherData, int>{};
    final timesReviewer = <TeacherData, int>{};
    final timesMember = <TeacherData, int>{};

    for (final thesisViewModel in thesisViewModels) {
      final president = thesisViewModel.president;
      final secretary = thesisViewModel.secretary;
      final reviewer1 = thesisViewModel.firstReviewer;
      final reviewer2 = thesisViewModel.secondReviewer;
      final member = thesisViewModel.member;

      teachers.add(president);
      teachers.add(secretary);
      teachers.add(reviewer1);
      teachers.add(reviewer2);
      teachers.add(member);

      timesPresident[president] = (timesPresident[president] ?? 0) + 1;
      timesSecretary[secretary] = (timesSecretary[secretary] ?? 0) + 1;
      timesReviewer[reviewer1] = (timesReviewer[reviewer1] ?? 0) + 1;
      timesReviewer[reviewer2] = (timesReviewer[reviewer2] ?? 0) + 1;
      timesMember[member] = (timesMember[member] ?? 0) + 1;
    }

    final moneyPerRole = (
      president: 400_000,
      secretary: 400_000,
      reviewer: 1_050_000,
      member: 300_000,
    );

    final entries = <PaymentAtmEntry>[];
    final sortedTeachers = teachers.toList(growable: false);
    sortedTeachers.sort((a, b) {
      final c1 = a.isOutsider ? 1 : 0;
      final c2 = b.isOutsider ? 1 : 0;
      if (c1 != c2) return c1 - c2;

      final aFirstName = a.name.split(" ").last;
      final bFirstName = b.name.split(" ").last;

      return aFirstName.compareTo(bFirstName);
    });
    for (final teacher in sortedTeachers) {
      final timesAsPresident = timesPresident[teacher] ?? 0;
      final timesAsSecretary = timesSecretary[teacher] ?? 0;
      final timesAsReviewer = timesReviewer[teacher] ?? 0;
      final timesAsMember = timesMember[teacher] ?? 0;

      final totalAmount =
          (timesAsPresident * moneyPerRole.president) +
          (timesAsSecretary * moneyPerRole.secretary) +
          (timesAsReviewer * moneyPerRole.reviewer) +
          (timesAsMember * moneyPerRole.member);

      final entry = PaymentAtmEntry(
        teacher: teacher,
        amount: totalAmount,
      );
      entries.add(entry);
    }

    return PaymentAtmModel(
      reason: reason,
      entries: entries,
    );
  }
}
