import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final documentByIdProvider = FutureProvider.family<DocumentData, int>(
  (Ref ref, int id) async {
    final db = await ref.watch(mainDatabaseProvider.future);

    final stmt = db.document.select();
    stmt.where((d) => d.id.equals(id));

    final doc = await stmt.getSingleOrNull();
    if (doc == null) {
      throw Exception('Document with ID $id not found');
    }
    return doc;
  },
);

final documentContentProvider = FutureProvider.family<Uint8List?, int>(
  (Ref ref, int contentId) async {
    final db = await ref.watch(nullableFileDatabaseProvider.future);
    if (db == null) {
      return null;
    }

    final stmt = db.documentContent.select();
    stmt.where((c) => c.id.equals(contentId));

    final content = await stmt.getSingleOrNull();
    return content?.content;
  },
);
