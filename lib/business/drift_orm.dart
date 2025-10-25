import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'business_enums.dart' as enums;

export './business_enums.dart';

part 'drift_orm.g.dart';

// const falseExpr = Constant(false);
// const trueExpr = Constant(true);

typedef Cohort = NienKhoa;
typedef CourseClassCompanion = LopTinChiCompanion;
// Alias because the original name is not english
typedef Thesis = Detaithacsi;

@DriftDatabase(include: {"database_v1.drift"})
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 2;

  static AppDatabase intialize(String databasePath) {
    final executor = driftDatabase(
      name: 'fami-caohoc-drift',
      native: DriftNativeOptions(
        databasePath: () => Future.value(databasePath),
      ),
    );
    final db = AppDatabase(executor);
    return db;
  }

  // TODO: implement the logic to ensure the roles are in the database
  // Future<void> ensureDocumentRolesEnum() async {
  //   final role = enums.DocumentRole.values;
  //   final values = {for (final r in role) r.value};
  //   for (final role in roles) {}
  // }
}

extension Translation on AppDatabase {
  Cohort get cohort => nienKhoa;
  Thesis get thesis => detaithacsi;
}
