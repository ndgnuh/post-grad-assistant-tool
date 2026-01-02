import 'dart:typed_data';

import 'package:fami_tools/custom_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/db_v2_providers.dart';

class DocumentViewModel {
  final DocumentData document;
  final Uint8List? contentData;
  DocumentViewModel({required this.document, this.contentData});

  /// Provide [DocumentViewModel] for a specific document ID
  static final provider = FutureProvider.family.autoDispose(
    (ref, int documentId) async {
      final db = await ref.watch(mainDatabaseProvider.future);
      final fileDb = await ref.watch(fileDatabaseProvider.future);

      // Fetch document
      final documentQuery = db.select(db.document);
      documentQuery.where((doc) => doc.id.equals(documentId));
      final document = await documentQuery.getSingleOrNull();
      if (document == null) {
        throw UserFacingException(
          "Không tìm thấy văn bản với ID $documentId",
        );
      }

      // Watch document information
      if (ref.isFirstBuild) {
        final stream = documentQuery.watch();
        stream.listen((event) {
          ref.invalidateSelf();
        });
        ref.onDispose(() => stream.drain());
      }

      // Fetch content data if exists
      late final Uint8List? contentData;
      if (document.contentId == null) {
        contentData = null;
      } else {
        final contentQuery = fileDb.select(fileDb.documentContent);
        contentQuery.where(
          (content) => content.id.equals(document.contentId!),
        );

        // Watch content information
        if (ref.isFirstBuild) {
          final stream = contentQuery.watch();
          stream.listen((event) {
            ref.invalidateSelf();
          });
          ref.onDispose(() => stream.drain());
        }

        contentData = (await contentQuery.getSingleOrNull())?.content;
      }

      // Return the view model
      return DocumentViewModel(
        document: document,
        contentData: contentData,
      );
    },
  );
}
