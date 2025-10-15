import 'package:riverpod/riverpod.dart';
import 'package:file_picker/file_picker.dart';

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
