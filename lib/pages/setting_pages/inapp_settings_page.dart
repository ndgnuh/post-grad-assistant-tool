// Setting pages
import 'dart:io';

import 'package:external_path/external_path.dart' as ext_path;
import '../../shortcuts.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../business/db_v2_providers.dart';
import '../../custom_widgets.dart';
import 'widgets.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  static final tabs = [
    Tab(text: "Chung"),
    Tab(text: "Tương tác"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: CommonShortcuts(
        child: Scaffold(
          appBar: ConstrainedAppBar(
            withTabBar: true,
            child: AppBar(
              title: const Text("Cài đặt"),
              bottom: TabBar(isScrollable: true, tabs: tabs),
            ),
          ),
          body: ConstrainedBody(
            child: TabBarView(
              children: [
                _CommonSettingsView(),
                _InterpersonalSettingsView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TeacherCardSection extends ConsumerWidget {
  final String title;
  final AsyncValue<TeacherData?> Function(WidgetRef ref) getTeacherData;
  final IntDatabasePreferenceNotifier Function(WidgetRef ref) getNotifier;

  const _TeacherCardSection({
    required this.title,
    required this.getTeacherData,
    required this.getNotifier,
  });

  Widget get dummyWidget => Skeletonizer(
    child: CardSection(
      title: title,
      children: [
        ListTile(
          title: Text("Họ tên"),
          subtitle: Text("Nguyễn Văn A"),
        ),
        ListTile(
          title: Text("Email"),
          subtitle: Text("a.nguyenvan@hust.edu.vn"),
        ),
        ListTile(
          title: Text("Đơn vị công tác"),
          subtitle: Text("Khoa/Trường/Viện"),
        ),
      ],
    ),
  );

  Future<List<Widget>> Function(BuildContext, SearchController)
  makeSuggestionBuilder(WidgetRef ref) {
    Future<List<Widget>> suggesionBuilder(context, controller) async {
      final db = await ref.read(
        mainDatabaseProvider.future,
      );
      final teachers = await db
          .searchTeachers(searchText: controller.text)
          .get();

      final notifier = getNotifier(ref);
      return [
        for (final teacher in teachers)
          ListTile(
            title: Text(teacher.name),
            subtitle: Text(teacher.falcuty ?? ""),
            onTap: () {
              notifier.set(teacher.id);
              controller.closeView("");
            },
          ),
      ];
    }

    return suggesionBuilder;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherAsync = getTeacherData(ref);

    switch (teacherAsync) {
      case AsyncLoading():
        return dummyWidget;
      case AsyncError(:final error) when error is UnsetPreference:
        return CardSection(
          title: title,
          children: [
            SearchAnchor(
              suggestionsBuilder: makeSuggestionBuilder(ref),
              builder: (context, controller) => ListTile(
                title: Text("Click để cài đặt"),
                subtitle: Text("Tìm và chọn từ danh sách giảng viên"),
                trailing: Icon(Symbols.chevron_forward),
                onTap: () => controller.openView(),
              ),
            ),
          ],
        );
      case AsyncError(:final error):
        return CardSection(
          title: title,
          children: [
            ListTile(
              title: Text("Lỗi"),
              subtitle: ErrorWidget(error),
            ),
          ],
        );
      default:
    }

    final teacher = teacherAsync.value!;

    return CardSection(
      title: title,
      children: [
        ListTile(
          title: Text("Họ tên"),
          subtitle: Text(teacher.name),
        ),
        ListTile(
          title: Text("Đơn vị công tác"),
          subtitle: Text(teacher.falcuty ?? "N/A"),
        ),
        ListTile(
          title: Text("Email"),
          subtitle: Text(teacher.workEmail ?? teacher.personalEmail ?? "N/A"),
        ),
        SearchAnchor(
          suggestionsBuilder: makeSuggestionBuilder(ref),
          builder: (context, controller) => ListTile(
            leading: Icon(Symbols.edit),
            title: Text("Thay đổi"),
            subtitle: Text("Tìm và chọn từ danh sách giảng viên"),
            trailing: Icon(Symbols.chevron_forward),
            onTap: () => controller.openView(),
          ),
        ),
      ],
    );
  }
}

class _InterpersonalSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          _TeacherCardSection(
            title: "Quản lý trực tiếp",
            getTeacherData: (ref) => ref.watch(mySupervisorProvider),
            getNotifier: (ref) => ref.read(mySupervisorIdProvider.notifier),
          ),

          //
          CardSection(
            title: "Chuyên viên xử lý hồ sơ (khóa chẵn)",
            children: [],
          ),

          CardSection(
            title: "Chuyên viên xử lý hồ sơ (khóa lẻ)",
            children: [],
          ),

          //
          CardSection(
            title: "Chuyên viên học tập",
            children: [],
          ),
        ],
      ),
    );
  }
}

class _CommonSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          CardSection(
            title: "Cài đặt chung",
            children: [
              AppDataDirectoryPicker(
                builder: (context, dbPath, callback) => ListTile(
                  leading: const Icon(Symbols.folder_open),
                  title: const Text("Thư mục lưu dữ liệu"),
                  trailing: const Icon(Symbols.edit),
                  subtitle: Text(dbPath ?? "Chưa chọn thư mục"),
                  onTap: callback,
                ),
              ),
              AppDatabaseImportButtonBuilder(
                builder: (context, dbPath, callback) => ListTile(
                  title: const Text("CSDL chính"),
                  subtitle: Text(dbPath ?? "Chưa chọn CSDL"),
                  onTap: callback,
                ),
              ),
              FileDatabaseImportButtonBuilder(
                builder: (context, dbPath, callback) => ListTile(
                  title: const Text("CSDL file"),
                  subtitle: Text(dbPath ?? "Chưa chọn CSDL"),
                  onTap: callback,
                ),
              ),
              _DarkModeSwitchTile(),
            ],
          ),

          /// Interpersonnal settings
          _TeacherCardSection(
            title: "Danh tính của tôi",
            getTeacherData: (ref) => ref.watch(myDataProvider),
            getNotifier: (ref) => ref.read(myIdProvider.notifier),
          ),

          /// Misc
          CardSection(
            title: "Khác",
            children: [
              ListTile(
                title: Text("Chọn file (test)"),
                onTap: () async {
                  late Directory rootDirectory;
                  if (Platform.isAndroid || Platform.isIOS) {
                    final storages = await ext_path
                        .ExternalPath.getExternalStorageDirectories();
                    rootDirectory = Directory(
                      storages?.first ?? '/storage/emulated/0',
                    );
                  } else {
                    final downloadsDir = await getDownloadsDirectory();
                    rootDirectory = downloadsDir ?? Directory.current;
                  }

                  final filePath = await FilesystemPicker.openBottomSheet(
                    // ignore: use_build_context_synchronously
                    context: context,
                    rootDirectory: rootDirectory,
                    fsType: FilesystemType.all,
                    pickText: "Chọn file",
                    folderIconColor: Colors.blue,
                    showGoUp: true,
                    permissionText: "Ứng dụng cần quyền truy cập bộ nhớ",
                  );
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text("Chose file: $filePath"),
                    ),
                  );
                },
              ),
              AboutListTile(
                icon: const Icon(Symbols.info),
                applicationName: "FaMI-PGMS",
                applicationVersion: "0.20251229",
                applicationLegalese: "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DarkModeSwitchTile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkModeState = ref.watch(isDarkModeProvider);

    final isDarkMode = switch (isDarkModeState) {
      AsyncData(:final value) => value ?? false,
      _ => false,
    };

    return SwitchListTile(
      value: isDarkMode,
      title: const Text("Dark mode"),
      subtitle: switch (isDarkMode) {
        true => const Text("Dark mode is enabled"),
        false => const Text("Dark mode is disabled"),
      },
      onChanged: (shouldBeDark) async {
        final notifier = ref.read(isDarkModeProvider.notifier);
        await notifier.set(shouldBeDark);
        ref.invalidate(isDarkModeProvider);
      },
    );
  }
}
