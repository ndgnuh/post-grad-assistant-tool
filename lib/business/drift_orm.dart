import 'package:drift/drift.dart';

import './business_enums.dart';

export './business_enums.dart';

part 'drift_orm.g.dart';

const falseExpr = Constant(false);
const trueExpr = Constant(true);

typedef Cohort = NienKhoa;
typedef CourseClassCompanion = LopTinChiCompanion;
// Alias because the original name is not english
typedef Student = HocVien;
typedef StudentCompanion = HocVienCompanion;
typedef Thesis = Detaithacsi;

@DriftDatabase(include: {"file_db.drift"})
class FilesDatabase extends _$FilesDatabase {
  FilesDatabase(super.excecutor);

  @override
  int get schemaVersion => 1;
}

@DriftDatabase(include: {"database_v1.drift"})
class MyDriftDatabase extends _$MyDriftDatabase {
  MyDriftDatabase(super.excecutor);

  @override
  int get schemaVersion => 1;
}

extension Translation on MyDriftDatabase {
  Cohort get cohort => nienKhoa;
  Student get student => hocVien;
  Thesis get thesis => detaithacsi;
}
