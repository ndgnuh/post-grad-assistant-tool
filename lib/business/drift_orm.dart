import 'package:drift/drift.dart';
import 'package:fami_tools/business/business_enums.dart';

export './business_enums.dart';

part 'drift_orm.g.dart';

// const falseExpr = Constant(false);
// const trueExpr = Constant(true);

typedef Cohort = NienKhoa;
typedef CourseClassCompanion = LopTinChiCompanion;
// Alias because the original name is not english
typedef Thesis = Detaithacsi;

@DriftDatabase(include: {"database_v1.drift"})
class MyDriftDatabase extends _$MyDriftDatabase {
  MyDriftDatabase(super.executor);

  @override
  int get schemaVersion => 2;
}

extension Translation on MyDriftDatabase {
  Cohort get cohort => nienKhoa;
  Thesis get thesis => detaithacsi;
}
