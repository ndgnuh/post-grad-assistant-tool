import 'package:drift/drift.dart';

import './business_enums.dart';
import './drift_orm.steps.dart';

export './business_enums.dart';

part 'drift_orm.g.dart';

// const falseExpr = Constant(false);
// const trueExpr = Constant(true);

typedef Cohort = NienKhoa;
typedef CourseClassCompanion = LopTinChiCompanion;
// Alias because the original name is not english
typedef Student = HocVien;
typedef StudentCompanion = HocVienCompanion;
typedef Thesis = Detaithacsi;

@DriftDatabase(include: {"database_v1.drift"})
class MyDriftDatabase extends _$MyDriftDatabase {
  MyDriftDatabase(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await customStatement('PRAGMA foreign_keys = ON');
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 1) {
        m.renameTable(giangvien, 'teachers');
      }
    },
  );
}

extension Translation on MyDriftDatabase {
  Cohort get cohort => nienKhoa;
  Student get student => hocVien;
  Thesis get thesis => detaithacsi;
}
