import 'package:fami_tools/business/db_v2_providers.dart';
import 'package:riverpod/riverpod.dart';

final initialSetupDoneProvider = FutureProvider<bool>((ref) async {
  final appDataDir = await ref.watch(appDataDirectoryProvider.future);
  final mainDb = await ref.watch(nullableMainDatabaseProvider.future);
  final fileDb = await ref.watch(nullableFileDatabaseProvider.future);

  if (appDataDir == null) return false;
  if (mainDb == null) return false;
  if (fileDb == null) return false;
  return true;
});
