import 'package:fami_tools/services/database.dart';
import 'package:riverpod/riverpod.dart';
import 'package:file_picker/file_picker.dart';

import '../../business/db_v2_providers.dart';

final saveDirectoryProvider = NotifierProvider(
  SaveDirectoryNotifier.new,
);

class SaveDirectoryNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  Future<void> setDirectory(String path) async {
    state = path;
  }

  Future<void> picktDirectory() async {
    final picked = await FilePicker.platform.getDirectoryPath();
    if (picked == null) return;
    state = picked;
  }
}

final initialSetupDoneProvider = FutureProvider<bool>((ref) async {
  // TODO: implement other pages and remove this completely
  final mainDbPath = await ref.watch(appDatabasePathProvider.future);
  CompatDatabasePathInjection.instance.inject(mainDbPath);

  final mainDb = await ref.watch(nullableAppDatabaseProvider.future);

  switch (mainDb) {
    case null:
      return false;
    default:
  }

  final fileDbAsync = ref.watch(nullableFileDatabaseProvider);
  print(fileDbAsync);
  final fileDb = await ref.watch(nullableFileDatabaseProvider.future);
  switch (fileDb) {
    case null:
      return false;
    default:
  }

  return true;
});
