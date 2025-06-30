import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }

  sqfliteFfiInit();
  runApp(const MyApp());
}

// Login button

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
      initialRoute: initialRoute,
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
