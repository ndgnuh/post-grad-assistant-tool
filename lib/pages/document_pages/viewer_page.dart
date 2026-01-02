import 'package:fami_tools/custom_widgets.dart';
import 'package:fami_tools/shortcuts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdfrx/pdfrx.dart';

import '../../business/view_models.dart';

class DocumentViewerPage extends StatelessWidget {
  static const routeName = '/document/viewer';
  const DocumentViewerPage({super.key, required this.documentId});

  final int documentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: _WithDocumentBuilder(
            documentId: documentId,
            builder: (context, DocumentViewModel document) {
              return Text(document.document.title);
            },
          ),
        ),
      ),
      body: CommonShortcuts(
        onSave: (context) async {
          final ref = ProviderScope.containerOf(context);
          final model = await ref.read(
            DocumentViewModel.provider(documentId).future,
          );
          FilePicker.platform.saveFile(
            dialogTitle: 'Lưu văn bản',
            fileName: '${model.document.title}.pdf',
            bytes: model.contentData,
          );
        },
        child: ConstrainedBody(
          child: Center(
            child: _WithDocumentBuilder(
              documentId: documentId,
              builder: (context, model) {
                final content = model.contentData;
                if (content == null) {
                  return Text("Không có nội dung để hiển thị.");
                } else {
                  return PdfViewer.data(
                    content,
                    sourceName: model.document.title,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _WithDocumentBuilder extends ConsumerWidget {
  final int documentId;
  final Widget Function(BuildContext, DocumentViewModel) builder;

  const _WithDocumentBuilder({
    required this.documentId,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentAsyncValue = ref.watch(
      DocumentViewModel.provider(documentId),
    );

    return documentAsyncValue.when(
      data: (document) => builder(context, document),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
