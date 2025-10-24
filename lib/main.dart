import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'pages/pages.dart' as pages;
import 'preferences.dart';
import 'shortcuts.dart';
import 'themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    await setupHotKeys();
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

Future<void> setupHotKeys() async {
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
      // TODO: Implement go-to dialog
      print("GO TO DIALOG");
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
      // TODO: Implement menu opening
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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkModeState = ref.watch(isDarkModeProvider);

    final isDarkMode = switch (isDarkModeState) {
      AsyncData(:final value) => value,
      _ => false,
    };

    // Function to get lighter color from a color
    final themes = Themes(context);
    final locale = Locale('vi', 'VN');

    return SafeArea(
      child: MaterialApp(
        scaffoldMessengerKey: messengerKey,
        navigatorKey: navigationKey,
        locale: locale,
        darkTheme: themes.dark,
        theme: themes.light,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        initialRoute: pages.initialLoadingRotue,
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: pages.onGenerateRoute,
      ),
    );
  }
}
