import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

class PhdStudentViewModel {
  final PhdStudentData student;
  final PhdCohortData? cohort;
  final TeacherData supervisor;
  final TeacherData? secondarySupervisor;

  final TeacherData? admissionPresident;
  final TeacherData? admissionSecretary;
  final TeacherData? admissionMember1;
  final TeacherData? admissionMember2;
  final TeacherData? admissionMember3;
  final TeacherData? admissionHelper;

  final PhdAdmissionPaymentPolicyData? admissionPaymentPolicy;

  static final providerById = _byIdProvider;

  PhdStudentViewModel({
    required this.student,
    required this.cohort,
    required this.supervisor,
    required this.secondarySupervisor,
    required this.admissionPresident,
    required this.admissionSecretary,
    required this.admissionMember1,
    required this.admissionMember2,
    required this.admissionMember3,
    required this.admissionPaymentPolicy,
    required this.admissionHelper,
  });
}

final _byIdProvider = FutureProvider.family<PhdStudentViewModel, int>((
  ref,
  int id,
) async {
  final PhdStudentData student = await ref.watch(
    phdStudentByIdProvider(id).future,
  );
  final cohort = await ref.watch(phdCohortByIdProvider(student.cohort).future);

  final supervisor = await ref.watch(
    teacherByIdProvider(student.supervisorId).future,
  );

  final secondarySupervisor = switch (student.secondarySupervisorId) {
    null => null,
    int secId => await ref.watch(teacherByIdProvider(secId).future),
  };

  final admissionPresident = switch (student.admissionPresidentId) {
    null => null,
    int id => await ref.watch(teacherByIdProvider(id).future),
  };
  final admissionSecretary = switch (student.admissionSecretaryId) {
    null => null,
    int id => await ref.watch(teacherByIdProvider(id).future),
  };

  final admissionMember1 = switch (student.admission1stMemberId) {
    null => null,
    int id => await ref.watch(teacherByIdProvider(id).future),
  };

  final admissionMember2 = switch (student.admission2ndMemberId) {
    null => null,
    int id => await ref.watch(teacherByIdProvider(id).future),
  };

  final admissionMember3 = switch (student.admission3rdMemberId) {
    null => null,
    int id => await ref.watch(teacherByIdProvider(id).future),
  };

  final admissionHelper = switch (student.admissionHelperId) {
    null => null,
    int id => await ref.watch(teacherByIdProvider(id).future),
  };

  final admissionPaymentPolicy = switch (student.admissionPaymentPolicy) {
    int id => await ref.watch(phdAdmissionPaymentPolicyByIdProvider(id).future),
    null => null,
  };

  return PhdStudentViewModel(
    student: student,
    cohort: cohort,
    supervisor: supervisor,
    secondarySupervisor: secondarySupervisor,
    admissionPresident: admissionPresident,
    admissionSecretary: admissionSecretary,
    admissionMember1: admissionMember1,
    admissionMember2: admissionMember2,
    admissionMember3: admissionMember3,
    admissionHelper: admissionHelper,
    admissionPaymentPolicy: admissionPaymentPolicy,
  );
});
