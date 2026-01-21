import 'package:drift/drift.dart';
import '../../custom_widgets.dart';
import 'package:riverpod/riverpod.dart';

import '../db_v2_providers.dart';

final documentByIdProvider = FutureProvider.family<DocumentData, int>(
  (Ref ref, int id) async {
    final db = await ref.watch(mainDatabaseProvider.future);

    final stmt = db.document.select();
    stmt.where((d) => d.id.equals(id));

    if (ref.isFirstBuild) {
      final stream = stmt.watch();
      stream.listen((event) {
        ref.invalidateSelf();
      });

      ref.onDispose(() {
        stream.drain();
      });
    }

    final doc = await stmt.getSingleOrNull();
    if (doc == null) {
      throw Exception('Document with ID $id not found');
    }
    return doc;
  },
);

final documentStreamProvider = StreamProvider.autoDispose.family(
  (Ref ref, int id) async* {
    final db = await ref.watch(mainDatabaseProvider.future);

    final stmt = db.document.select();
    stmt.where((d) => d.id.equals(id));

    final stream = stmt.watchSingleOrNull();

    await for (final doc in stream) {
      if (doc == null) {
        throw UserFacingException('Không tìm thấy văn bản với ID $id');
      }
      yield doc;
    }
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
    if (ref.isFirstBuild) {
      stmt.watch().listen((event) {
        ref.invalidateSelf();
      });
    }

    final content = await stmt.getSingleOrNull();
    return content?.content;
  },
);
