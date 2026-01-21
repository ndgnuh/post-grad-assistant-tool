import 'dart:async';
import 'dart:io';

import 'setting_pages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as path;

import '../../business/db_v2_providers.dart';
import '../../business/file_content_database.dart';
import '../../custom_widgets.dart';
import 'providers.dart';
import 'widgets.dart';

final initialSetupViewModelProvider = AsyncNotifierProvider(
  InitialSetupViewModelNotifier.new,
);

final expansionNotifierProvider = NotifierProvider.family(
  ExpansionNotifier.new,
);

class ExpansionNotifier extends Notifier<bool> {
  final int index;
  ExpansionNotifier(this.index);

  @override
  bool build() => false;

  void set(int index, bool isExpanded) => state = isExpanded;
}

class InitialSetupViewModel {
  final String? appDataDirectory;
  final String? mainDatabasePath;
  final String? fileDatabasePath;
  final bool storagePermissionGranted;
  final List<bool> expanded;

  bool get ok =>
      appDataDirectory != null &&
      mainDatabasePath != null &&
      fileDatabasePath != null &&
      storagePermissionGranted;

  InitialSetupViewModel copyWith({
    String? appDataDirectory,
    String? mainDatabasePath,
    String? fileDatabasePath,
    bool? storagePermissionGranted,
    List<bool>? expanded,
  }) {
    return InitialSetupViewModel(
      appDataDirectory: appDataDirectory ?? this.appDataDirectory,
      mainDatabasePath: mainDatabasePath ?? this.mainDatabasePath,
      fileDatabasePath: fileDatabasePath ?? this.fileDatabasePath,
      storagePermissionGranted:
          storagePermissionGranted ?? this.storagePermissionGranted,
      expanded: expanded ?? this.expanded,
    );
  }

  const InitialSetupViewModel({
    this.appDataDirectory,
    this.mainDatabasePath,
    this.fileDatabasePath,
    this.storagePermissionGranted = false,
    this.expanded = const [false, false],
  });
}

class InitialSetupViewModelNotifier
    extends AsyncNotifier<InitialSetupViewModel> {
  @override
  FutureOr<InitialSetupViewModel> build() async {
    final appDataDir = await ref.watch(appDataDirectoryProvider.future);
    final mainDbPath = await ref.watch(mainDatabasePathProvider.future);
    final fileDbPath = await ref.watch(fileDatabasePathProvider.future);
    final storagePermissionGranted = await ref.watch(
      storagePermissionGrantedProvider.future,
    );
    return InitialSetupViewModel(
      appDataDirectory: appDataDir,
      mainDatabasePath: mainDbPath,
      fileDatabasePath: fileDbPath,
      storagePermissionGranted: storagePermissionGranted,
    );
  }

  Future<void> pickAppDataDirectory() async {
    final result = await FilePicker.platform.getDirectoryPath(
      dialogTitle: "Chọn thư mục dữ liệu ứng dụng",
      lockParentWindow: true,
    );

    if (result != null) {
      final notifier = ref.read(appDataDirectoryProvider.notifier);
      await notifier.set(result);
    }
  }

  Future<void> expandPanel(int index, bool isExpanded) async {
    final currentState = state.value!;
    final newExpanded = List<bool>.from(currentState.expanded);
    newExpanded[index] = isExpanded;
    state = AsyncData(
      currentState.copyWith(expanded: newExpanded),
    );
  }

  Future<void> pickMainDatabaseFile(BuildContext context) async {
    final appDataDir = await ref.watch(appDataDirectoryProvider.future);
    if (appDataDir == null) {
      throw Exception("App data directory is not set");
    }

    final file = await FilesystemPicker.open(
      context: context,
      title: "Chọn cơ sở dữ liệu chính",
      rootDirectory: Directory(appDataDir),
      fsType: FilesystemType.file,
      pickText: "Chọn",
    );

    print(file);

    if (file != null) {
      final notifier = ref.read(mainDatabasePathProvider.notifier);
      await notifier.set(file);
    }
  }
}

class InitialSetupPage extends ConsumerWidget {
  static const String routeName = "/initial/setup";

  const InitialSetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(initialSetupViewModelProvider);
    switch (modelAsync) {
      case AsyncLoading():
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case AsyncError(:final error, :final stackTrace):
        return Scaffold(
          body: Center(
            child: Text("Lỗi khởi tạo: $error\n$stackTrace"),
          ),
        );
      default:
    }

    final model = modelAsync.value!;
    final notifier = ref.read(initialSetupViewModelProvider.notifier);

    return Scaffold(
      body: ConstrainedBody(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.gutter),
          child: Column(
            spacing: context.gutter,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Xin chào",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Hãy thiết lập một số cài đặt cần thiết cho ứng dụng.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Thư mục lưu dữ liệu"),
                    trailing: Icon(Symbols.edit),
                    leading: Icon(Symbols.folder),
                    subtitle: Text(switch (model.appDataDirectory) {
                      null => "Chưa chọn",
                      String path => path,
                    }),
                    onTap: () => notifier.pickAppDataDirectory(),
                  ),

                  Divider(height: 0),
                  ListTile(
                    leading: Icon(Symbols.perm_identity),
                    trailing: Icon(Symbols.settings),
                    title: Text("Cấp quyền đọc ghi bộ nhớ"),
                    subtitle: switch (model.storagePermissionGranted) {
                      false => Text(
                        "Cấp quyền truy cập bộ nhớ máy để lưu trữ dữ liệu ứng dụng.",
                      ),
                      true => Text("Đã cấp quyền"),
                    },
                    enabled: model.storagePermissionGranted != true,
                    onTap: () => ref
                        .read(storagePermissionGrantedProvider.notifier)
                        .requestPermission(),
                  ),
                  Divider(height: 0),

                  ExpansionPanelList(
                    expansionCallback: (index, isExpanded) {
                      notifier.expandPanel(index, isExpanded);
                    },
                    children: [
                      // Main database setup
                      ExpansionPanel(
                        isExpanded: model.expanded[0],
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) => ListTile(
                          leading: Icon(Symbols.storage),
                          title: Text("Cơ sở dữ liệu chính"),
                          subtitle: switch (model.mainDatabasePath) {
                            null => Text(
                              "Lưu trữ thông tin học viên, giảng viên, lớp tín chỉ, luận văn...",
                            ),
                            String path => Text("Đã chọn: $path"),
                          },
                          selected: isExpanded,
                        ),
                        body: ListBody(
                          children: [
                            _CreateNewButton(),
                            ListTile(
                              leading: Icon(Symbols.upload),
                              title: Text("Nhập CSDL"),
                              subtitle: Text(
                                "Chọn cơ sở dữ liệu file hiện có trong máy",
                              ),
                              trailing: Icon(Symbols.chevron_right),
                              onTap: () =>
                                  notifier.pickMainDatabaseFile(context),
                            ),
                          ],
                        ),
                      ),

                      // File database setup
                      ExpansionPanel(
                        isExpanded: model.expanded[1],
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) => ListTile(
                          selected: isExpanded,
                          leading: Icon(Symbols.storage),
                          title: Text("Cơ sở dữ liệu lưu file"),
                          subtitle: Text(
                            "Lưu trữ các tập tin quyết định, thông báo...",
                          ),
                        ),
                        body: ListBody(
                          children: [
                            _CreateNewFileDatabaseButton(),
                            FileDatabaseImportButtonBuilder(
                              builder:
                                  (
                                    context,
                                    fileDatabasePath,
                                    callback,
                                  ) {
                                    return ListTile(
                                      leading: Icon(Symbols.upload),
                                      title: Text("Nhập CSDL"),
                                      subtitle: Text(
                                        switch (fileDatabasePath) {
                                          null =>
                                            "Chọn cơ sở dữ liệu file hiện có trong máy",
                                          String path => "Đã chọn: $path",
                                        },
                                      ),
                                      trailing: Icon(
                                        Symbols.chevron_right,
                                      ),
                                      onTap: callback,
                                    );
                                  },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // End of inputs
              FilledButton.icon(
                onPressed: model.ok
                    ? () {
                        Navigator.pushReplacementNamed(
                          context,
                          InitialLoadingPage.routeName,
                        );
                      }
                    : null,
                icon: Icon(Symbols.check),
                label: Text("Hoàn tất thiết lập"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateNewButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final directoryAsync = ref.read(appDataDirectoryProvider);
    final directory = switch (directoryAsync) {
      AsyncData(:final value) => value,
      _ => null,
    };

    return ListTile(
      leading: Icon(Symbols.add),
      title: Text("Tạo mới"),
      subtitle: Text(
        "Tạo cơ sở dữ liệu mới",
      ),
      enabled: directory != null,
      trailing: Icon(Symbols.chevron_right),
      onTap: () async {
        final databasePath = path.join(directory!, "student_database.db");
        final notifier = ref.read(mainDatabasePathProvider.notifier);
        notifier.set(databasePath);
      },
    );
  }
}

class _CreateNewFileDatabaseButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);
    return ListTile(
      leading: Icon(Symbols.add),
      title: Text("Tạo mới"),
      subtitle: Text("Tạo cơ sở dữ liệu mới"),
      trailing: Icon(Symbols.chevron_right),
      onTap: () async {
        final dbFile = await FileContentDatabase.createTemporaryDatabase();
        final dbFileContent = await dbFile.readAsBytes();
        final savePath = await FilePicker.platform.saveFile(
          dialogTitle: "Lưu CSDL file",
          bytes: dbFileContent,
          fileName: "file-database.sqlite3",
          lockParentWindow: true,
        );

        // Cancelled
        if (savePath == null) return;

        // The desktop is not saved for some reason...
        final outputFile = File(savePath);
        if (Platform.isLinux) {
          await outputFile.writeAsBytes(dbFileContent);
        }

        switch (savePath) {
          case String path:
            final notifier = ref.read(fileDatabasePathProvider.notifier);
            notifier.set(path);
            navigator.pushNamed(InitialLoadingPage.routeName);
        }
      },
    );
  }
}
