import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../../services/database.dart';
import '../domain_objects.dart';
import './../db_v1_providers.dart';

final admissionCouncilsProvider = AsyncNotifierProvider(
  AdmissionCouncils.new,
);
final admissionStudentIdsProvider = AsyncNotifierProvider(
  AdmissionStudentIds.new,
);
final admissionStudentsProvider = AsyncNotifierProvider(
  AdmissionStudents.new,
);
final directAdmissionStudentsProvider = AsyncNotifierProvider(
  DirectAdmissionStudents.new,
);
final interviewAdmissionStudentsProvider = AsyncNotifierProvider(
  InterviewAdmissionStudents.new,
);
final latestAdmissionCouncilProvider = AsyncNotifierProvider(
  LatestAdmissionCouncil.new,
);

class AdmissionCouncils extends AsyncNotifier<List<AdmissionCouncil>> {
  @override
  FutureOr<List<AdmissionCouncil>> build() async {
    return await AdmissionCouncil.all();
  }
}

class LatestAdmissionCouncil extends AsyncNotifier<AdmissionCouncil?> {
  @override
  FutureOr<AdmissionCouncil?> build() async {
    final councils = await ref.watch(admissionCouncilsProvider.future);
    if (councils.isEmpty) return null;
    councils.sort((a, b) => b.id.compareTo(a.id));
    return councils.first;
  }
}

class AdmissionStudentIds extends AsyncNotifier<List<int>> {
  @override
  FutureOr<List<int>> build() async {
    return await dbSession((db) async {
      final rows = await db.query(
        Student.table,
        columns: ['id'],
        where: 'maTrangThai = ?',
        whereArgs: [TrangThaiHocVien.xetTuyen.value],
        orderBy: 'idDienTuyenSinh DESC, soHoSo ASC',
      );
      return [for (final row in rows) row['id'] as int];
    });
  }
}

class AdmissionStudents extends AsyncNotifier<List<Student>> {
  @override
  FutureOr<List<Student>> build() async {
    final ids = await ref.watch(admissionStudentIdsProvider.future);
    final students = <Student>[];
    for (final id in ids) {
      final student = await ref.watch(studentByIdProvider(id).future);
      students.add(student);
    }
    return students;
  }
}

class DirectAdmissionStudents extends AsyncNotifier<List<Student>> {
  @override
  FutureOr<List<Student>> build() async {
    final students = await ref.watch(admissionStudentsProvider.future);
    return [
      for (final s in students)
        if (s.dienTuyenSinh == AdmissionType.tichHop) s,
    ];
  }
}

class InterviewAdmissionStudents extends AsyncNotifier<List<Student>> {
  @override
  FutureOr<List<Student>> build() async {
    final students = await ref.watch(admissionStudentsProvider.future);
    return [
      for (final s in students)
        if (s.dienTuyenSinh == AdmissionType.xetTuyen) s,
    ];
  }
}
