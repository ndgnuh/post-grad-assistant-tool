import 'package:riverpod/riverpod.dart';

import '../../business/db_v2_providers.dart';
import 'database.dart';

final teacherManagementServiceProvider = FutureProvider((ref) async {
  final db = await ref.watch(mainDatabaseProvider.future);
  return TeacherManagementService(db: db);
});
