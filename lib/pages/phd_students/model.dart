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
  /* All the fields from the phd_student table
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "cohorts" TEXT NOT NULL,
	"management_id" TEXT UNIQUE,
    "admission_id"  TEXT UNIQUE,
    "name"  TEXT NOT NULL,
    "gender" TEXT NOT NULL DEFAULT 'M',
    "date_of_birth"	TEXT,
    "place_of_birth" TEXT,
    "phone"	TEXT NOT NULL UNIQUE,
    "private_email"	TEXT NOT NULL UNIQUE,
    "major_name" TEXT NOT NULL DEFAULT 'Toán học',
    "major_id"  TEXT NOT NULL DEFAULT 9460101,
    "major_specialize"	TEXT NOT NULL DEFAULT 'N/A',
    "admission_president_id" INTEGER,
    "admission_secretary_id" INTEGER,
    "admission_1st_member_id" INTEGER,
    "admission_2nd_member_id" INTEGER,
    "admission_3rd_member_id" INTEGER,
    "admission_paid" INTEGER NOT NULL DEFAULT 0 CHECK (admission_paid IN (0, 1)),
    "thesis" TEXT NOT NULL,
    "supervisor_id"	INTEGER NOT NULL,
    "secondary_supervisor_id" INTEGER,
    "school_email" TEXT NOT NULL UNIQUE,
    "created_time" TEXT NOT NULL DEFAULT CURRENTIMTESTAMP,
    "updated_time" TEXT NOT NULL DEFAULT CURRENTIMTESTAMP,
*/
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

@riverpod
Future<List<PhdStudent>> phdStudentsByCohorts(Ref ref, String cohorts) async {
  final db = await ref.watch(readOnlyDatabaseProvider.future);
  final result = await db.query(
    'phd_student',
    where: 'cohorts = ?',
    whereArgs: [cohorts],
  );
  return result.map((e) => PhdStudent.fromJson(e)).toList();
}

Future<int> createPhdStudent(Ref ref, PhdStudent student) async {
  final db = await ref.watch(databaseProvider.future);
  final id = await db.insert('phd_student', student.toJson());
}
