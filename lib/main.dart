import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'business/drift_orm.dart';

import 'pages.dart';
import 'shortcuts.dart';
import 'preferences.dart' as preferences;

final messengerKey = GlobalKey<ScaffoldMessengerState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }

  final database = AppDatabase();

  final app = Provider<AppDatabase>(
    create: (_) => database,
    child: const MyApp(),
    dispose: (context, db) => db.close(),
  );

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Function to get lighter color from a color

    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
      seedColor: Colors.black38,
      primary: Colors.deepOrange,
    );

    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    );
    final buttonMinimumSize = Size.fromHeight(50);

    return MaterialApp(
      navigatorKey: navigationKey,
      scaffoldMessengerKey: messengerKey,
      initialRoute: initialRoute,
      shortcuts: {
        SingleActivator(LogicalKeyboardKey.escape): const EscapeIntent(),
        SingleActivator(LogicalKeyboardKey.arrowLeft, alt: true):
            const GoBackIntent(),
        SingleActivator(LogicalKeyboardKey.keyW, control: true):
            const OpenMenuIntent(),
        SingleActivator(LogicalKeyboardKey.keyF, control: true):
            const SearchIntent(),
      },
      actions: {
        GoBackIntent: CallbackAction(
          onInvoke: (intent) => navigationKey.currentState?.maybePop(),
        ),
        EscapeIntent: CallbackAction(
          onInvoke: (intent) {
            final state = searchAnchorKey.currentState;
            switch (searchAnchorKey.currentState) {
              case State<SearchAnchor> state2:
                state2.widget.searchController?.closeView("");
            }

            var context = globalFocusKey.currentState?.context;
            switch (context) {
              case BuildContext context:
                final focusNode = FocusScope.of(context).descendants.first;
                focusNode.requestFocus();
            }

            return null;
          },
        ),
      },
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: buttonShape,
            minimumSize: buttonMinimumSize,
          ),
        ),
        searchBarTheme: SearchBarThemeData(
          constraints: BoxConstraints.tightFor(height: 50),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: buttonShape,
            minimumSize: buttonMinimumSize,
            side: BorderSide(color: colorScheme.primary),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: buttonShape,
            minimumSize: buttonMinimumSize,
          ),
        ),
        colorScheme: colorScheme,
      ),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
