// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:fami_sdh/business/main_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'generated/schema.dart';

import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // The following template shows how to write tests ensuring your migrations
  // preserve existing data.
  // Testing this can be useful for migrations that change existing columns
  // (e.g. by alterating their type or constraints). Migrations that only add
  // tables or columns typically don't need these advanced tests. For more
  // information, see https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  // TODO: This generated template shows how these tests could be written. Adopt
  // it to your own needs when testing migrations with data integrity.
  test('migration from v1 to v2 does not corrupt data', () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    // TODO: Fill these lists
    final oldTeacherGroupData = <v1.TeacherGroupData>[];
    final expectedNewTeacherGroupData = <v2.TeacherGroupData>[];

    final oldTeacherData = <v1.TeacherData>[];
    final expectedNewTeacherData = <v2.TeacherData>[];

    final oldCourseData = <v1.CourseData>[];
    final expectedNewCourseData = <v2.CourseData>[];

    final oldPreferenceData = <v1.PreferenceData>[];
    final expectedNewPreferenceData = <v2.PreferenceData>[];

    final oldDocumentRoleData = <v1.DocumentRoleData>[];
    final expectedNewDocumentRoleData = <v2.DocumentRoleData>[];

    final oldDocumentData = <v1.DocumentData>[];
    final expectedNewDocumentData = <v2.DocumentData>[];

    final oldCohortData = <v1.CohortData>[];
    final expectedNewCohortData = <v2.CohortData>[];

    final oldAdmissionCouncilData = <v1.AdmissionCouncilData>[];
    final expectedNewAdmissionCouncilData = <v2.AdmissionCouncilData>[];

    final oldStudentData = <v1.StudentData>[];
    final expectedNewStudentData = <v2.StudentData>[];

    final oldSemesterData = <v1.SemesterData>[];
    final expectedNewSemesterData = <v2.SemesterData>[];

    final oldThesisData = <v1.ThesisData>[];
    final expectedNewThesisData = <v2.ThesisData>[];

    final oldAcademicGroupData = <v1.AcademicGroupData>[];
    final expectedNewAcademicGroupData = <v2.AcademicGroupData>[];

    final oldPhdCohortData = <v1.PhdCohortData>[];
    final expectedNewPhdCohortData = <v2.PhdCohortData>[];

    final oldPhdAdmissionPaymentPolicyData =
        <v1.PhdAdmissionPaymentPolicyData>[];
    final expectedNewPhdAdmissionPaymentPolicyData =
        <v2.PhdAdmissionPaymentPolicyData>[];

    final oldPhdStudentData = <v1.PhdStudentData>[];
    final expectedNewPhdStudentData = <v2.PhdStudentData>[];

    final oldTeachingRegistrationData = <v1.TeachingRegistrationData>[];
    final expectedNewTeachingRegistrationData = <v2.TeachingRegistrationData>[];

    final oldCourseLimitingData = <v1.CourseLimitingData>[];
    final expectedNewCourseLimitingData = <v2.CourseLimitingData>[];

    final oldCourseClassData = <v1.CourseClassData>[];
    final expectedNewCourseClassData = <v2.CourseClassData>[];

    final oldTeachingAssignmentData = <v1.TeachingAssignmentData>[];
    final expectedNewTeachingAssignmentData = <v2.TeachingAssignmentData>[];

    final oldStudyRegistrationData = <v1.StudyRegistrationData>[];
    final expectedNewStudyRegistrationData = <v2.StudyRegistrationData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.teacherGroup, oldTeacherGroupData);
        batch.insertAll(oldDb.teacher, oldTeacherData);
        batch.insertAll(oldDb.course, oldCourseData);
        batch.insertAll(oldDb.preference, oldPreferenceData);
        batch.insertAll(oldDb.documentRole, oldDocumentRoleData);
        batch.insertAll(oldDb.document, oldDocumentData);
        batch.insertAll(oldDb.cohort, oldCohortData);
        batch.insertAll(oldDb.admissionCouncil, oldAdmissionCouncilData);
        batch.insertAll(oldDb.student, oldStudentData);
        batch.insertAll(oldDb.semester, oldSemesterData);
        batch.insertAll(oldDb.thesis, oldThesisData);
        batch.insertAll(oldDb.academicGroup, oldAcademicGroupData);
        batch.insertAll(oldDb.phdCohort, oldPhdCohortData);
        batch.insertAll(
          oldDb.phdAdmissionPaymentPolicy,
          oldPhdAdmissionPaymentPolicyData,
        );
        batch.insertAll(oldDb.phdStudent, oldPhdStudentData);
        batch.insertAll(
          oldDb.teachingRegistration,
          oldTeachingRegistrationData,
        );
        batch.insertAll(oldDb.courseLimiting, oldCourseLimitingData);
        batch.insertAll(oldDb.courseClass, oldCourseClassData);
        batch.insertAll(oldDb.teachingAssignment, oldTeachingAssignmentData);
        batch.insertAll(oldDb.studyRegistration, oldStudyRegistrationData);
      },
      validateItems: (newDb) async {
        expect(
          expectedNewTeacherGroupData,
          await newDb.select(newDb.teacherGroup).get(),
        );
        expect(expectedNewTeacherData, await newDb.select(newDb.teacher).get());
        expect(expectedNewCourseData, await newDb.select(newDb.course).get());
        expect(
          expectedNewPreferenceData,
          await newDb.select(newDb.preference).get(),
        );
        expect(
          expectedNewDocumentRoleData,
          await newDb.select(newDb.documentRole).get(),
        );
        expect(
          expectedNewDocumentData,
          await newDb.select(newDb.document).get(),
        );
        expect(expectedNewCohortData, await newDb.select(newDb.cohort).get());
        expect(
          expectedNewAdmissionCouncilData,
          await newDb.select(newDb.admissionCouncil).get(),
        );
        expect(expectedNewStudentData, await newDb.select(newDb.student).get());
        expect(
          expectedNewSemesterData,
          await newDb.select(newDb.semester).get(),
        );
        expect(expectedNewThesisData, await newDb.select(newDb.thesis).get());
        expect(
          expectedNewAcademicGroupData,
          await newDb.select(newDb.academicGroup).get(),
        );
        expect(
          expectedNewPhdCohortData,
          await newDb.select(newDb.phdCohort).get(),
        );
        expect(
          expectedNewPhdAdmissionPaymentPolicyData,
          await newDb.select(newDb.phdAdmissionPaymentPolicy).get(),
        );
        expect(
          expectedNewPhdStudentData,
          await newDb.select(newDb.phdStudent).get(),
        );
        expect(
          expectedNewTeachingRegistrationData,
          await newDb.select(newDb.teachingRegistration).get(),
        );
        expect(
          expectedNewCourseLimitingData,
          await newDb.select(newDb.courseLimiting).get(),
        );
        expect(
          expectedNewCourseClassData,
          await newDb.select(newDb.courseClass).get(),
        );
        expect(
          expectedNewTeachingAssignmentData,
          await newDb.select(newDb.teachingAssignment).get(),
        );
        expect(
          expectedNewStudyRegistrationData,
          await newDb.select(newDb.studyRegistration).get(),
        );
      },
    );
  });
}
