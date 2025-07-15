import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'business/drift_orm.dart';

import 'pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    databaseFactory = databaseFactoryFfi;
  }

  final database = AppDatabase();
  // final students = await database.select(database.hocVien).get();
  //
  // final ncms = [
  //   'Khoa học dữ liệu và ứng dụng',
  //   'Cơ sở toán học cho tin học và hệ thống thông tin',
  //   'Tối ưu và tính toán khoa học',
  //   'Xác suất thống kê và ứng dụng',
  //   'Giải tích',
  //   'Đại số'
  // ];
  // for (final ncm in ncms) {
  //   final ncmcomp = NhomChuyenMonCompanion.insert(tenNhom: ncm);
  //   await database.into(database.nhomChuyenMon).insert(ncmcomp);
  // }
  // print(await database.select(database.nhomChuyenMon).get());

  // sqfliteFfiInit();
  final app = Provider<AppDatabase>(
    create: (_) => database,
    child: const MyApp(),
    dispose: (context, db) => db.close(),
  );
  runApp(app);
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
