// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:fami_tools/business/main_database.dart';
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
    final oldNienKhoaData = <v1.NienKhoaData>[];
    final expectedNewNienKhoaData = <v2.NienKhoaData>[];

    final oldGiangvienData = <v1.GiangvienData>[];
    final expectedNewGiangvienData = <v2.GiangvienData>[];

    final oldTieuBanXetTuyenData = <v1.TieuBanXetTuyenData>[];
    final expectedNewTieuBanXetTuyenData = <v2.TieuBanXetTuyenData>[];

    final oldHocVienData = <v1.HocVienData>[];
    final expectedNewHocVienData = <v2.HocVienData>[];

    final oldHockyData = <v1.HockyData>[];
    final expectedNewHockyData = <v2.HockyData>[];

    final oldHocphanData = <v1.HocphanData>[];
    final expectedNewHocphanData = <v2.HocphanData>[];

    final oldDetaithacsiData = <v1.DetaithacsiData>[];
    final expectedNewDetaithacsiData = <v2.DetaithacsiData>[];

    final oldPhdCohortData = <v1.PhdCohortData>[];
    final expectedNewPhdCohortData = <v2.PhdCohortData>[];

    final oldPhdStudentData = <v1.PhdStudentData>[];
    final expectedNewPhdStudentData = <v2.PhdStudentData>[];

    final oldDangKyGiangDayData = <v1.DangKyGiangDayData>[];
    final expectedNewDangKyGiangDayData = <v2.DangKyGiangDayData>[];

    final oldLopTinChiData = <v1.LopTinChiData>[];
    final expectedNewLopTinChiData = <v2.LopTinChiData>[];

    final oldTeachingAssignmentData = <v1.TeachingAssignmentData>[];
    final expectedNewTeachingAssignmentData = <v2.TeachingAssignmentData>[];

    final oldDangKyHocData = <v1.DangKyHocData>[];
    final expectedNewDangKyHocData = <v2.DangKyHocData>[];

    final oldFtsDeTaiThacSiData = <v1.FtsDeTaiThacSiData>[];
    final expectedNewFtsDeTaiThacSiData = <v2.FtsDeTaiThacSiData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.nienKhoa, oldNienKhoaData);
        batch.insertAll(oldDb.giangvien, oldGiangvienData);
        batch.insertAll(oldDb.tieuBanXetTuyen, oldTieuBanXetTuyenData);
        batch.insertAll(oldDb.hocVien, oldHocVienData);
        batch.insertAll(oldDb.hocky, oldHockyData);
        batch.insertAll(oldDb.hocphan, oldHocphanData);
        batch.insertAll(oldDb.detaithacsi, oldDetaithacsiData);
        batch.insertAll(oldDb.phdCohort, oldPhdCohortData);
        batch.insertAll(oldDb.phdStudent, oldPhdStudentData);
        batch.insertAll(oldDb.dangKyGiangDay, oldDangKyGiangDayData);
        batch.insertAll(oldDb.lopTinChi, oldLopTinChiData);
        batch.insertAll(oldDb.teachingAssignment, oldTeachingAssignmentData);
        batch.insertAll(oldDb.dangKyHoc, oldDangKyHocData);
        batch.insertAll(oldDb.ftsDeTaiThacSi, oldFtsDeTaiThacSiData);
      },
      validateItems: (newDb) async {
        expect(
          expectedNewNienKhoaData,
          await newDb.select(newDb.nienKhoa).get(),
        );
        expect(
          expectedNewGiangvienData,
          await newDb.select(newDb.giangvien).get(),
        );
        expect(
          expectedNewTieuBanXetTuyenData,
          await newDb.select(newDb.tieuBanXetTuyen).get(),
        );
        expect(expectedNewHocVienData, await newDb.select(newDb.hocVien).get());
        expect(expectedNewHockyData, await newDb.select(newDb.hocky).get());
        expect(expectedNewHocphanData, await newDb.select(newDb.hocphan).get());
        expect(
          expectedNewDetaithacsiData,
          await newDb.select(newDb.detaithacsi).get(),
        );
        expect(
          expectedNewPhdCohortData,
          await newDb.select(newDb.phdCohort).get(),
        );
        expect(
          expectedNewPhdStudentData,
          await newDb.select(newDb.phdStudent).get(),
        );
        expect(
          expectedNewDangKyGiangDayData,
          await newDb.select(newDb.dangKyGiangDay).get(),
        );
        expect(
          expectedNewLopTinChiData,
          await newDb.select(newDb.lopTinChi).get(),
        );
        expect(
          expectedNewTeachingAssignmentData,
          await newDb.select(newDb.teachingAssignment).get(),
        );
        expect(
          expectedNewDangKyHocData,
          await newDb.select(newDb.dangKyHoc).get(),
        );
        expect(
          expectedNewFtsDeTaiThacSiData,
          await newDb.select(newDb.ftsDeTaiThacSi).get(),
        );
      },
    );
  });
}
