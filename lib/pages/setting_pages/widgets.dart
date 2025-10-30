import 'package:fami_tools/path_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/db_v2_providers.dart';
import 'setting_pages.dart';

class FileDatabaseImportButtonBuilder extends ConsumerWidget {
  final Widget Function(BuildContext, String?, VoidCallback) builder;
  final bool navigateOnImport;
  const FileDatabaseImportButtonBuilder({
    super.key,
    required this.builder,
    this.navigateOnImport = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DatabaseImportButtonBuilder(
      provider: fileDatabasePathProvider,
      builder: builder,
      navigateOnImport: navigateOnImport,
    );
  }
}

class AppDatabaseImportButtonBuilder extends ConsumerWidget {
  final Widget Function(BuildContext, String?, VoidCallback) builder;
  final bool navigateOnImport;
  const AppDatabaseImportButtonBuilder({
    super.key,
    required this.builder,
    this.navigateOnImport = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _DatabaseImportButtonBuilder(
      provider: mainDatabasePathProvider,
      builder: builder,
      navigateOnImport: navigateOnImport,
    );
  }
}

class _DatabaseImportButtonBuilder extends ConsumerWidget {
  final bool navigateOnImport;
  final AsyncNotifierProvider<StringPreferenceNotifier, String?> provider;
  final Widget Function(BuildContext, String?, VoidCallback) builder;
  const _DatabaseImportButtonBuilder({
    required this.builder,
    required this.provider,
    this.navigateOnImport = false,
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
      final dbPath = await pickFilePath(
        context: context,
        allowedExtensions: {'sqlite3', 'sqlite', 'db'},
      );
      if (dbPath == null) return;

      final notifer = ref.read(provider.notifier);
      notifer.set(dbPath);

      if (navigateOnImport && context.mounted) {
        navigator.pushNamed(InitialLoadingPage.routeName);
      }
    }

    return builder(context, databasePath, callback);
  }
}

class AppDataDirectoryPicker extends ConsumerWidget {
  final Widget Function(
    BuildContext context,
    String? value,
    VoidCallback callback,
  )
  builder;
  const AppDataDirectoryPicker({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final directoryPathAsync = ref.watch(appDataDirectoryProvider);

    String? directoryPath = switch (directoryPathAsync) {
      AsyncLoading() => null,
      AsyncError() => null,
      AsyncData(:final value) => value,
    };

    void callback() async {
      final selectedDirectory = await FilePicker.platform.getDirectoryPath();
      if (selectedDirectory == null) return;

      final notifier = ref.read(appDataDirectoryProvider.notifier);
      await notifier.set(selectedDirectory);
    }

    return builder(context, directoryPath, callback);
  }
}
