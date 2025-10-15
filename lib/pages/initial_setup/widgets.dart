import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './providers.dart';

class DirectoryPicker extends ConsumerWidget {
  const DirectoryPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final directory = ref.watch(saveDirectoryProvider);

    return ElevatedButton(
      onPressed: () {
        context.read(saveDirectoryProvider.notifier).pickDirectory();
      },
      child: const Text('Chọn Thư Mục'),
    );
  }
}
