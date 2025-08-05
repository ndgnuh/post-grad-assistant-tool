import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'business/drift_orm.dart';
import 'pages.dart';
import 'shortcuts.dart';
import 'themes.dart';
import 'preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    await hotKeyManager.unregisterAll();
  }

  /// Hotkey for going back
  await hotKeyManager.register(
    HotKey(
      key: PhysicalKeyboardKey.arrowLeft,
      modifiers: const [HotKeyModifier.alt],
      scope: HotKeyScope.inapp,
      identifier: 'go-back',
    ),
    keyDownHandler: (hotKey) {
      if (Get.isDialogOpen ?? false) {
        Get.back(closeOverlays: true);
      } else {
        Get.back();
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
        print(state);
        print(state?.onCreateNew);
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

  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }

  const app = MyApp();

  runApp(app);
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Function to get lighter color from a color

    final colorScheme = ColorScheme.of(context);

    final locale = Locale.fromSubtags(languageCode: "vi-VN");

    final themes = Themes();
    Get.put<Themes>(themes);

    return SafeArea(
      child: GetMaterialApp(
        locale: locale,
        theme: themes.light,
        darkTheme: themes.dark,
        onReady: () async {
          final isDarkMode = await getDarkMode();
          if (isDarkMode) {
            Get.changeThemeMode(ThemeMode.dark);
            Get.changeTheme(themes.dark);
          } else {
            Get.changeThemeMode(ThemeMode.light);
            Get.changeTheme(themes.light);
          }
        },
        initialRoute: initialRoute,
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
