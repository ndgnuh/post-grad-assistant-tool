import 'package:riverpod/riverpod.dart';
import '../../business/db_v2_providers.dart';

final councilMembersProvider = FutureProvider.family((
  ref,
  int studentId,
) async {
  final phdStudent = await ref.watch(phdStudentByIdProvider(studentId).future);
  final getters = [
    (PhdStudentData phd) => phd.admissionPresidentId,
    (PhdStudentData phd) => phd.admissionSecretaryId,
    (PhdStudentData phd) => phd.admission1stMemberId,
    (PhdStudentData phd) => phd.admission2ndMemberId,
    (PhdStudentData phd) => phd.admission3rdMemberId,
  ];
  final members = <TeacherData?>[];
  for (final getId in getters) {
    final memberId = getId(phdStudent);
    switch (memberId) {
      case null:
        members.add(null);
      case int id:
        final teacher = await ref.watch(teacherByIdProvider(id).future);
        members.add(teacher);
    }
  }

  return members;
});
