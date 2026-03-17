import 'package:riverpod/riverpod.dart';

import '../../../business/db_v2_providers.dart';
import '../data/dao.dart';

/// Provide list of admission councils
final councilsProvider = StreamProvider((ref) async* {
  final db = await ref.watch(mainDatabaseProvider.future);
  yield* db.watchAdmissionCouncils();
});
