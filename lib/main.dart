import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart' as p;
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'drawer.dart';
import 'extensions.dart';
import 'pages.dart';
import 'datamodels.dart';
import 'bedrock.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Helper>(create: (BuildContext context) => Helper(context)),
        FutureProvider<List<TieuBanXetTuyen>>(
          create: (_) => Repository.allTieuBanXetTuyen(),
          initialData: [],
        ),
        FutureProvider<List<NienKhoa>>(
          initialData: [],
          create: (context) => Repository.allNienKhoa(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppState(),
          lazy: true,
        ),
      ],
      child: Consumer<AppState>(
        builder: (context, model, child) => FutureBuilder(
          future: model.init(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return MaterialApp(
                  initialRoute: initialRoute,
                  onGenerateRoute: onGenerateRoute,
                );
              default:
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Loading data"),
                          CircularProgressIndicator.adaptive(),
                        ],
                      ),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
