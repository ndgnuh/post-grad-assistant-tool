import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/db_v2_providers.dart';
import 'setting_pages.dart';

class FileDatabaseImportButtonBuilder extends ConsumerWidget {
  final Widget Function(BuildContext, String?, VoidCallback) builder;
  const FileDatabaseImportButtonBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DatabaseImportButtonBuilder(
      provider: fileContentDatabasePathProvider,
      builder: builder,
    );
  }
}

class AppDatabaseImportButtonBuilder extends ConsumerWidget {
  final Widget Function(BuildContext, String?, VoidCallback) builder;
  const AppDatabaseImportButtonBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DatabaseImportButtonBuilder(
      provider: appDatabasePathProvider,
      builder: builder,
    );
  }
}

class _DatabaseImportButtonBuilder extends ConsumerWidget {
  final AsyncNotifierProvider<DatabasePathNotifier, String?> provider;
  final Widget Function(BuildContext, String?, VoidCallback) builder;
  const _DatabaseImportButtonBuilder({
    required this.builder,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);
    final databasePathAsync = ref.watch(provider);
    final databasePath = switch (databasePathAsync) {
      AsyncLoading() => null,
      AsyncError() => null,
      AsyncData(:final value) => value,
    };

    callback() async {
      final newDatabasePath = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        dialogTitle: 'Chọn file cơ sở dữ liệu',
        withData: false,
      );
      final dbPath = newDatabasePath?.files.single.path;
      if (dbPath == null) return;

      final notifer = ref.read(provider.notifier);
      notifer.setDatabasePath(dbPath);

      navigator.pushNamed(InitialLoadingPage.routeName);
    }

    return builder(context, databasePath, callback);
  }
}
