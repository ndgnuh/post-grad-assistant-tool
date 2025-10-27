import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'business_enums.dart' as enums;
import 'business_enums.dart';

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

  Future<List<String>> searchCourses({
    String? searchText,
    CourseCategory? category,
  }) async {
    final emptySearchText = searchText == null || searchText.isEmpty;
    // Return all course IDs if no filter is provided
    if (emptySearchText && category == null) {
      final allCourses = await select(course).map((c) => c.id).get();
      return allCourses;
    }

    // If only category is provided, filter by category
    if (emptySearchText && category != null) {
      final stmt = select(course)
        ..where((c) => c.category.equals(category.value));
      final results = await stmt.map((c) => c.id).get();
      return results;
    }

    // Try searching with FTS, if fails, fall back to normal search
    try {
      final stmt = customSelect(
        'SELECT courseId FROM course_fts WHERE course_fts MATCH ?',
        variables: [Variable<String>(searchText)],
      );
      return await stmt.map((row) => row.read<String>('courseId')).get();
    } catch (e) {
      final stmt = select(course);
      stmt.where(
        (c) =>
            c.vietnameseName.contains(searchText!) |
            c.englishName.contains(searchText) |
            c.id.contains(searchText),
      );
      final results = await stmt.map((c) => c.id).get();
      return results;
    }
  }
}

extension Translation on AppDatabase {
  Cohort get cohort => nienKhoa;
  Thesis get thesis => detaithacsi;
}
