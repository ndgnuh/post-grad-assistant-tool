import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers/database.dart';
import '../../custom_widgets.dart';

final searchQueryProvider = NotifierProvider(
  TextNotifier.new,
);

/// Returns a tuple:
/// - [bool]: whether to prompt user input (true if search query is empty)
/// - [List<int>]: list of teacher IDs matching the search query
final teacherIdsProvider = FutureProvider((ref) async {
  final db = await ref.watch(mainDatabaseProvider.future);
  final searchText = ref.watch(searchQueryProvider);

  final stmt = switch (searchText.trim().isEmpty) {
    true => db.teacher.select(),
    false => db.searchTeachers(searchText: searchText),
  };

  stmt.orderBy([
    (t) => OrderingTerm(expression: t.name),
  ]);

  final mapStmt = stmt.map((r) => r.id);
  final ids = await mapStmt.get();

  return (false, ids);
});
