import 'package:fami_tools/business/copy_pasta.dart';
import 'package:fami_tools/business/selection_models.dart';
import 'package:fami_tools/business/view_models.dart';
import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers.dart';
import '../../business/documents.dart';

final _name = "msc-thesis-assignment";

final assignmentModelProvider = FutureProvider((Ref ref) async {
  final cohortModel = await ref.watch(cohortSelectionProvider.future);
  assert(cohortModel.selected != null, "Chưa chọn khóa học");
  final selectedCohort = cohortModel.selected!;

  final studentIds = await ref.watch(
    studentIdsByCohortProvider(selectedCohort).future,
  );
  final thesesVms = <StudentViewModel>[];
  for (final studentId in studentIds) {
    final vm = await ref.watch(StudentViewModel.providerById(studentId).future);
    thesesVms.add(vm);
  }

  return ThesisAssignmentModel(
    theses: thesesVms,
    cohort: selectedCohort,
  );
});

final assignmentPdfProvider = FutureProvider.family<PdfFile, PdfConfig>(
  (Ref ref, PdfConfig config) async {
    final model = await ref.watch(assignmentModelProvider.future);
    return model.pdf(config);
  },
);

final assignmentXlsxProvider = FutureProvider<XlsxFile?>((Ref ref) async {
  final model = await ref.watch(assignmentModelProvider.future);
  return model.xlsx;
});

final cohortSelectionProvider = AsyncNotifierProvider(
  () => CohortSelectionModelNotifier(_name),
);

final assignmentViewModelProvider = FutureProvider.family(
  (ref, int studentId) async {
    final student = await ref.watch(studentByIdProvider(studentId).future);

    /// Get thesis
    final thesisId = await ref.watch(
      thesisIdByStudentProvider(studentId).future,
    );
    if (thesisId == null) {
      return AssignmentModel(
        student: student,
        thesis: null,
        supervisor: null,
      );
    }

    final thesis = await ref.watch(
      thesisByIdProvider(thesisId).future,
    );
    final supervisor = await ref.watch(
      teacherByIdProvider(thesis.supervisorId).future,
    );

    return AssignmentModel(
      student: student,
      thesis: thesis,
      supervisor: supervisor,
    );
  },
);

final assignmentProcessingEmailProvider = FutureProvider(
  (Ref ref) async {
    final cohortModel = await ref.watch(cohortSelectionProvider.future);
    final selectedCohort = cohortModel.selected;
    if (selectedCohort == null) return null;

    final cohort = selectedCohort.id;
    final cohortYear = int.parse(
      cohort.replaceFirst("CH", "").replaceAll("A", "").replaceFirst("B", ""),
    );

    /// TODO: proper specialist info retrieval
    final String specialistEmail;
    final String specialistName;
    if (cohortYear % 2 == 0) {
      specialistEmail = "lan.dothuy@hust.edu.vn";
      specialistName = "Đỗ Thúy Lan";
    } else {
      specialistEmail = "giang.lethu1@hust.edu.vn";
      specialistName = "Lê Thu Giang";
    }

    final myName = await ref.watch(myNameProvider.future);
    final myFaculty = await ref.watch(myFacultyProvider.future);
    final mySupervisorId = await ref.watch(mySupervisorIdProvider.future);
    final mySupervisor = await ref.watch(
      teacherByIdProvider(mySupervisorId!).future,
    );
    final mySupervisorEmail = mySupervisor.email!;

    return Email(
      recipients: {specialistEmail},
      ccRecipients: {mySupervisorEmail},
      subject: "Giao đề tài luận văn thạc sĩ khóa $cohort - $myFaculty",
      body:
          """Kính gửi cô $specialistName,

Em gửi danh sách học viên, đề tài luận văn cao học và người hướng dẫn của học viên cao học $myFaculty, khóa $cohort. File đính kèm trong email ạ.

Trân trọng,
$myName""",
    );
  },
);

final studentIdsProvider = FutureProvider<List<int>?>((ref) async {
  /// Return null so that the UI prompt
  /// the user to select cohort
  final cohortModel = await ref.watch(cohortSelectionProvider.future);
  final selectedCohort = cohortModel.selected;
  if (selectedCohort == null) return null;

  /// Get student ids by cohort
  final studentIds = await ref.read(
    studentIdsByCohortProvider(selectedCohort).future,
  );

  return studentIds;
});

class AssignmentModel {
  final StudentData student;
  final ThesisData? thesis;
  final TeacherData? supervisor;
  AssignmentModel({
    required this.student,
    this.thesis,
    this.supervisor,
  });
}

final supervisorsEmailProvider = FutureProvider<Email>((ref) async {
  final model = await ref.watch(assignmentModelProvider.future);

  if (model == null) {
    return Email(
      recipients: {},
      ccRecipients: {},
      subject: "",
      body: "",
    );
  }

  // Cohort information
  final cohort = model.cohort.id;

  // Supervisor emails
  final supervisorEmails = <String>{};
  for (final thesis in model.theses) {
    final supervisor = thesis.supervisor;
    if (supervisor == null) continue;

    final supervisorEmail = supervisor!.workEmail ?? supervisor.personalEmail;
    assert(
      supervisorEmail != null,
      "Giảng viên hướng dẫn ${supervisor.name} không có email",
    );
    supervisorEmails.add(supervisorEmail!);

    final secondarySupervisor = thesis.secondarySupervisor;
    if (secondarySupervisor?.email != null) {
      supervisorEmails.add(secondarySupervisor!.email!);
    }
  }

  // My information
  final myName = await ref.watch(myNameProvider.future);
  final myFaculty = await ref.watch(myFacultyProvider.future);

  // My supervisor
  final mySupervisor = await ref.watch(mySupervisorProvider.future);

  return Email(
    recipients: supervisorEmails,
    ccRecipients: {mySupervisor.workEmail ?? mySupervisor.personalEmail ?? ""},
    subject: "Thông tin giao đề tài luận văn thạc sĩ khóa $cohort - $myFaculty",
    body:
        """Kính gửi các Thầy, Cô,
Em gửi danh sách học viên, đề tài luận văn cao học và người hướng dẫn của học viên cao học khóa $cohort. File danh sách được đính kèm trong email ạ.

Trước đó em có yêu cầu học viên bàn bạc chi tiết với Thầy, Cô để đăng ký tên đề tài chính xác.
Tuy nhiên vẫn mong Thầy, Cô kiểm tra lại và phản hồi giúp em nếu có sai sót trước khi gửi lên Ban Đào tạo ạ.
Em cảm ơn Thầy, Cô ạ.

Trân trọng,
$myName""",
  );
});
