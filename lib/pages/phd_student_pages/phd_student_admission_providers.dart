import 'dart:typed_data';

import 'package:fami_tools/utilities/strings.dart';
import 'package:riverpod/riverpod.dart';
import '../../business/db_v2_providers.dart';
import '../../business/pdfs/pdfs.dart' as pdfs;

final scoreSheetPdfProvider = FutureProvider.family((ref, int studentId) async {
  final provider = phdStudentByIdProvider(studentId);
  final phdStudent = await ref.watch(provider.future);
  return await pdfs.PdfFile.phdAdmission.scoreSheet(student: phdStudent);
});

final councilSuggestionPdfProvider = FutureProvider.family((
  ref,
  int studentId,
) async {
  final phdStudent = await ref.watch(phdStudentByIdProvider(studentId).future);
  final supervisor = await ref.watch(
    teacherByIdProvider(phdStudent.supervisorId).future,
  );

  final secondarySupervisor = switch (phdStudent.secondarySupervisorId) {
    null => null,
    int id => await ref.watch(teacherByIdProvider(id).future),
  };

  Future<TeacherData?> getIfNotNull(int? id) async {
    if (id == null) return null;
    return await ref.watch(teacherByIdProvider(id).future);
  }

  final president = await getIfNotNull(phdStudent.admissionPresidentId);
  final secretary = await getIfNotNull(phdStudent.admissionSecretaryId);
  final firstMember = await getIfNotNull(phdStudent.admission1stMemberId);
  final secondMember = await getIfNotNull(phdStudent.admission2ndMemberId);
  final thirdMember = await getIfNotNull(phdStudent.admission3rdMemberId);

  if (president == null ||
      secretary == null ||
      firstMember == null ||
      secondMember == null ||
      thirdMember == null) {
    return null;
  }

  return await pdfs.PdfFile.phdAdmission.councilSuggestion(
    phdStudent: phdStudent,
    supervisor: supervisor,
    secondarySupervisor: secondarySupervisor,
    president: president,
    secretary: secretary,
    firstMember: firstMember,
    secondMember: secondMember,
    thirdMember: thirdMember,
  );
});

final paymentTablePdfProvider = FutureProvider.family((
  ref,
  int studentId,
) async {
  final student = await ref.watch(phdStudentByIdProvider(studentId).future);
  if (student.admissionPresidentId == null ||
      student.admissionSecretaryId == null ||
      student.admission1stMemberId == null ||
      student.admission2ndMemberId == null ||
      student.admission3rdMemberId == null) {
    return null;
  }

  final president = await ref.watch(
    teacherByIdProvider(student.admissionPresidentId!).future,
  );
  final secretary = await ref.watch(
    teacherByIdProvider(student.admissionSecretaryId!).future,
  );
  final member1 = await ref.watch(
    teacherByIdProvider(student.admission1stMemberId!).future,
  );
  final member2 = await ref.watch(
    teacherByIdProvider(student.admission2ndMemberId!).future,
  );
  final member3 = await ref.watch(
    teacherByIdProvider(student.admission3rdMemberId!).future,
  );

  final pdfFile = await pdfs.PdfFile.phdAdmission.paymentTable(
    student: student,
    president: president,
    secretary: secretary,
    firstMember: member1,
    secondMember: member2,
    thirdMember: member3,
  );

  return pdfFile;
});
