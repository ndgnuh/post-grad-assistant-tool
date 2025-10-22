import 'dart:async';

import 'package:number_to_vietnamese_words/number_to_vietnamese_words.dart';
import 'package:riverpod/riverpod.dart';

import '../../business/copy_pasta.dart';
import '../../business/db_v2_providers.dart';
import '../../business/selection_models.dart';

final admissionCouncilArrangementEmailNotifier = AsyncNotifierProvider.family(
  AdmissionCouncilArrangementEmailNotifier.new,
);

final cohortSelectionModelProvider = AsyncNotifierProvider(
  () => PhdCohortSelectionModelNotifier("phd-students"),
);

final genderSelectionModelProvider = AsyncNotifierProvider(
  () => GenderSelectionModelNotifier("phd-students"),
);

final phdStudentListViewModelProvider = AsyncNotifierProvider(
  PhdStudentListViewModelNotifier.new,
);

class AdmissionCouncilArrangementEmailNotifier extends AsyncNotifier<Email> {
  final int phdStudentId;
  AdmissionCouncilArrangementEmailNotifier(this.phdStudentId);

  @override
  FutureOr<Email> build() async {
    final student = await ref.watch(
      phdStudentByIdProvider(phdStudentId).future,
    );
    if (student == null) {
      throw Exception("PhD student with id $phdStudentId not found");
    }

    // Supervisor, cosupervisor
    final supervisorId = student.supervisorId;
    final supervisor = await ref.watch(
      teacherByIdProvider(supervisorId).future,
    );
    assert(supervisor != null, "Supervisor with id $supervisorId not found");

    final coSupervisorId = student.secondarySupervisorId;
    final coSupervisor = switch (coSupervisorId) {
      null => null,
      int id => await ref.watch(teacherByIdProvider(id).future),
    };

    // Recipients
    final recipients = <String>{};
    switch (supervisor?.personalEmail) {
      case String email:
        recipients.add(email);
      default:
        throw Exception("Supervisor email not found");
    }

    switch ((coSupervisor, coSupervisor?.personalEmail)) {
      case (TeacherData _, String email):
        recipients.add(email);
        break;
      case (TeacherData _, null):
        throw Exception("Co-supervisor email not found");
      default:
      // Do nothing if no co-supervisor
    }

    // Teacher's pronouns
    final pronoun = Pronoun.fromGender(gender: supervisor!.gender);
    final coPronoun = switch (coSupervisor) {
      null => null,
      TeacherData t => Pronoun.fromGender(gender: t.gender),
    };
    final foldedPronouns = switch ((pronoun, coPronoun)) {
      (Pronoun p1, Pronoun p2) when p1 == p2 => "hai ${pronoun.capitalized}",
      (Pronoun p1, Pronoun p2) => "${p1.capitalized} và ${p2.capitalized}",
      (Pronoun p1, null) => p1.capitalized,
    };
    final foldedPronounsCapitalized = switch ((pronoun, coPronoun)) {
      (Pronoun p1, Pronoun p2) when p1 == p2 => "Hai ${pronoun.capitalized}",
      (Pronoun p1, Pronoun p2) => "${p1.capitalized} và ${p2.capitalized}",
      (Pronoun p1, null) => p1.capitalized,
    };

    // Compose email
    final subject = "Hội đồng xét tuyển NCS ${student.name}";
    final body = [
      "Kính gửi ${pronoun.capitalized} ${supervisor.name},",
      if (coSupervisor != null)
        "Kính gửi ${coPronoun!.capitalized} ${coSupervisor.name},",
      """
\nEm đã nhận được hồ sơ của NCS ${student.name} với đề tài "${student.thesis}", thực hiện dưới sự hướng dẫn của $foldedPronouns. $foldedPronounsCapitalized đề xuất một hội đồng để tổ chức chấm đề cương cho NCS giúp em ạ.

Hội đồng sẽ gồm 5 thành viên, bao gồm:
- 1 Chủ tịch hội đồng,
- 1 Thư ký hội đồng,
- 3 Ủy viên hội đồng.
Trong hội đồng phải có 1 thành viên không thuộc Đại học Bách khoa Hà Nội, 1 thành viên là giảng viên hướng dẫn của NCS. Em cảm ơn $foldedPronouns ạ.""",
    ].join("\n");

    return Email(subject: subject, body: body, recipients: recipients);
  }
}

class PhdStudentListViewModel {
  final String? cohort;
  final List<PhdStudentData> students;
  final Map<PhdStudentData, TeacherData> supervisors;
  final Map<PhdStudentData, TeacherData?> secondarySupervisor;

  PhdStudentListViewModel({
    required this.cohort,
    required this.students,
    required this.supervisors,
    required this.secondarySupervisor,
  });
}

class PhdStudentListViewModelNotifier
    extends AsyncNotifier<PhdStudentListViewModel> {
  @override
  Future<PhdStudentListViewModel> build() async {
    // Get selected cohort
    final cohortModel = await ref.watch(cohortSelectionModelProvider.future);
    final cohort = cohortModel.selected;

    // Get student of cohorts along with their supervisors
    final ids = switch (cohort) {
      null => await ref.watch(phdStudentIdsProvider.future),
      String cohort => await ref.watch(
        phdStudentIdsByCohortProvider(cohort).future,
      ),
    };
    final students = <PhdStudentData>[];
    final supervisors = <PhdStudentData, TeacherData>{};
    final secondarySupervisors = <PhdStudentData, TeacherData?>{};
    for (var id in ids) {
      final student = await ref.watch(phdStudentByIdProvider(id).future);
      if (student == null) continue;

      final supervisor = await ref.watch(
        teacherByIdProvider(student.supervisorId).future,
      );

      final secondarySupervisor = switch (student.secondarySupervisorId) {
        null => null,
        int id => await ref.watch(teacherByIdProvider(id).future),
      };

      if (supervisor != null) {
        students.add(student);
        supervisors[student] = supervisor;
        secondarySupervisors[student] = secondarySupervisor;
      }
    }

    return PhdStudentListViewModel(
      cohort: cohort,
      students: students,
      supervisors: supervisors,
      secondarySupervisor: secondarySupervisors,
    );
  }
}
