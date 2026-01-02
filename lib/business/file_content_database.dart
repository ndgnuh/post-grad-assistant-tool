import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:drift_flutter/drift_flutter.dart';

part 'file_content_database.g.dart';

class DocumentContent extends Table {
  IntColumn get id => integer().autoIncrement()();
  BlobColumn get content => blob()();
}

@DriftDatabase(tables: [DocumentContent])
class FileContentDatabase extends _$FileContentDatabase {
  FileContentDatabase(super.executor);

  @override
  int get schemaVersion => 1;

  static FileContentDatabase initialize(String databasePath) {
    final executor = driftDatabase(
      name: 'file-content-database',
      native: DriftNativeOptions(
        databasePath: () => Future.value(databasePath),
      ),
    );
    return FileContentDatabase(executor);
  }

  static Future<File> createTemporaryDatabase() async {
    final tempDirectory = await getTemporaryDirectory();
    final tempDatabasePath = path.join(
      tempDirectory.path,
      'file_content_database.sqlite3',
    );

    final executor = driftDatabase(
      name: "file_content_database.sqlite3",
      native: DriftNativeOptions(
        databasePath: () => Future.value(tempDatabasePath),
      ),
    );
    print(executor);
    final db = FileContentDatabase(executor);

    await db.documentContent.select().get();
    final file = File(tempDatabasePath);
    await db.close();
    return file;
  }
}
