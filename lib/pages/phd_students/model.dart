import 'package:drift/drift.dart' show Value;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../services/database.dart'
    show databaseProvider, readOnlyDatabaseProvider;
import '../../business/domain_objects.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
abstract class PhdStudent with _$PhdStudent {
  const factory PhdStudent({
    required int id,
    required String cohorts,
    String? managementId,
    String? admissionId,
    required String name,
    required Gender gender,
    DateTime? dateOfBirth,
    String? placeOfBirth,
    required String phone,
    required String privateEmail,
    required String majorName,
    required int majorId,
    required String majorSpecialize,
    int? admissionPresidentId,
    int? admissionSecretaryId,
    int? admission1stMemberId,
    int? admission2ndMemberId,
    int? admission3rdMemberId,
    @Default(false) bool admissionPaid,
    required String thesis,
    required int supervisorId,
    int? secondarySupervisorId,
    required String schoolEmail,
    required DateTime createdTime,
    required DateTime updatedTime,
  }) = _PhdStudent;

  factory PhdStudent.fromJson(Map<String, dynamic> json) =>
      _$PhdStudentFromJson(json);
}

@riverpod
Future<List<String>> allPhdCohorts(Ref ref) async {
  final db = await ref.watch(readOnlyDatabaseProvider.future);
  final result = await db.rawQuery('SELECT DISTINCT cohorts FROM phd_student');
  return result.map((e) => e['cohorts'] as String).toList();
}

// @riverpod
// Future<List<PhdStudent>> phdStudentsByCohorts(Ref ref, String cohorts) async {
//   final db = await ref.watch(readOnlyDatabaseProvider.future);
//   final result = await db.query(
//     'phd_student',
//     where: 'cohorts = ?',
//     whereArgs: [cohorts],
//   );
//   return result.map((e) => PhdStudent.fromJson(e)).toList();
// }

// Future<int> createPhdStudent(Ref ref, PhdStudent student) async {
//   final db = await ref.watch(databaseProvider.future);
//   final companion = PhdStudentCompanion.insert(
//     cohorts: Value(student.cohorts),
//     managementId: Value(student.managementId),
//     admissionId: Value(student.admissionId),
//     name: Value,
//   );
//
//   db.into(db.phd_student).insert(companion);
//   final id = await db.insert('phd_student', student.toJson());
//   return id;
// }
