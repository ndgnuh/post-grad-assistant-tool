import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'pages/pages.dart' as pages;
import 'pages/pages.dart';
import 'business/db_v2_providers.dart';
import 'preferences.dart';
import 'shortcuts.dart';
import 'themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    await hotKeyManager.unregisterAll();

    /// Hotkey for going back
    await hotKeyManager.register(
      HotKey(
        key: PhysicalKeyboardKey.arrowLeft,
        modifiers: const [HotKeyModifier.alt],
        scope: HotKeyScope.inapp,
        identifier: 'go-back',
      ),
      keyDownHandler: (hotKey) {
        //TODO
      },
    );

    /// C-g for the go-to dialog
    await hotKeyManager.register(
      HotKey(
        key: PhysicalKeyboardKey.keyG,
        modifiers: [HotKeyModifier.control],
        scope: HotKeyScope.inapp,
        identifier: 'go-to',
      ),
      keyDownHandler: (hotKey) {
        final currentContext = navigationKey.currentState?.context;
        switch (currentContext) {
          case BuildContext context:
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Go to'),
                content: SizedBox(
                  height: 300,
                  width: 300,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        title: const Text('Home'),
                        onTap: () {
                          Navigator.of(context).pop();
                          navigationKey.currentState?.pushNamed('/');
                        },
                      ),
                      ListTile(
                        title: const Text('Settings'),
                        onTap: () {
                          Navigator.of(context).pop();
                          navigationKey.currentState?.pushNamed('/settings');
                        },
                      ),
                      ListTile(
                        title: const Text('About'),
                        onTap: () {
                          Navigator.of(context).pop();
                          navigationKey.currentState?.pushNamed('/about');
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              ),
            );
        }
      },
    );

    /// Hotkey for opening the menu <C-w>
    await hotKeyManager.register(
      HotKey(
        key: PhysicalKeyboardKey.keyW,
        modifiers: [HotKeyModifier.control],
        scope: HotKeyScope.inapp,
        identifier: 'open-menu',
      ),
      keyDownHandler: (hotKey) {
        print("OPEN MENU");
        final context = navigationKey.currentState?.context;
        print(context);
        if (context != null) {
          Scaffold.of(context).openDrawer();
        }
      },
    );

    registerCommonShortcuts({
      required String identifier,
      required key,
      required Function(CommonShortcuts) callback,
      modifiers = const [HotKeyModifier.control],
    }) async {
      await hotKeyManager.register(
        HotKey(
          key: key,
          modifiers: modifiers,
          scope: HotKeyScope.inapp,
          identifier: identifier,
        ),
        keyDownHandler: (hotKey) {
          final state = shortcutStateKey.currentState?.widget;
          switch (state) {
            case CommonShortcuts state:
              callback(state);
          }
        },
      );
    }

    registerCommonShortcuts(
      identifier: 'create-new',
      key: PhysicalKeyboardKey.keyN,
      callback: (state) => state.onCreateNew?.call(),
    );

    registerCommonShortcuts(
      identifier: 'import',
      key: PhysicalKeyboardKey.keyI,
      callback: (state) => state.onImport?.call(),
    );

    registerCommonShortcuts(
      identifier: 'paste',
      key: PhysicalKeyboardKey.keyV,
      callback: (state) => state.onPaste?.call(),
    );

    registerCommonShortcuts(
      identifier: 'search',
      key: PhysicalKeyboardKey.keyF,
      callback: (state) => state.onSearch?.call(),
    );
  }

  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }

  // final AcademicGroupNames = [
  //   "Khoa học dữ liệu và ứng dụng",
  //   "Cơ sở toán học cho tin học và hệ thống thông tin",
  //   "Tối ưu và tính toán khoa học",
  //   "Xác suất thống kê và ứng dụng",
  //   "Giải tích",
  //   "Đại số",
  // ];

  // final db = orm.AppDatabaseV2();
  // for (final group in AcademicGroupNames) {
  //   final insertion = db
  //       .into(db.academicGroup)
  //       .insert(
  //         orm.AcademicGroupCompanion.insert(
  //           title: group,
  //         ),
  //       );
  //
  //   await insertion;
  // }
  // db
  //     .into(db.profile)
  //     .insert(
  //       orm.ProfileCompanion.insert(
  //         name: 'Default User',
  //         phoneNumber: orm.Value('0123456789'),
  //         address: orm.Value('123 Default St.'),
  //         email: orm.Value('default'),
  //         gender: orm.Gender.unknown,
  //       ),
  //     );

  const app = MyApp();
  runApp(
    ProviderScope(
      // child: GlobalTextScalingWrapper(child: app),
      child: app,
    ),
  );
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class ErrorPage extends StatelessWidget {
  final Object error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Lỗi: $error'),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final databaseAsync = ref.watch(nullableDatabaseProvider);
    switch (databaseAsync) {
      case AsyncLoading():
        return LoadingPage();
      case AsyncError(:final error):
        return ErrorPage(error: error);
      default:
    }

    final database = databaseAsync.value;
    final initialRoute = switch (database) {
      null => intialSettingsRoute,
      _ => pages.initialRoute,
    };

    final isDarkModeState = ref.watch(isDarkModeProvider);

    final isDarkMode = switch (isDarkModeState) {
      AsyncData(:final value) => value,
      _ => false,
    };

    // Function to get lighter color from a color
    final themes = Themes(context);
    final locale = Locale('vi', 'VN');

    final globalKey = GlobalKey();
    final messengerKey = GlobalKey<ScaffoldMessengerState>();

    return SafeArea(
      child: MaterialApp(
        key: globalKey,
        scaffoldMessengerKey: messengerKey,
        navigatorKey: navigationKey,
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.arrowLeft):
              const GoBackIntent(),
        },
        actions: {
          GoBackIntent: CallbackAction<GoBackIntent>(
            onInvoke: (intent) {
              final navigator = navigationKey.currentState!;
              final messenger = messengerKey.currentState!;

              if (navigator.canPop() == false) {
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text('Không có trang để quay lại'),
                    duration: Duration(seconds: 1),
                  ),
                );
              } else {
                navigator.pop();
              }

              return null;
            },
          ),
        },
        locale: locale,
        darkTheme: themes.dark,
        theme: themes.light,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        initialRoute: initialRoute,
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
