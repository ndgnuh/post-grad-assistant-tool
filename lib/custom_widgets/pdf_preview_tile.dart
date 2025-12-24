import 'package:fami_tools/business/documents.dart';
import 'package:fami_tools/pages/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

@Deprecated('Use [PdfViewerTile] from custom_widgets/pdf_viewer.dart instead')
class PdfPreviewTile extends StatelessWidget {
  final AsyncValue<PdfFile?> pdfFileAsync;
  final Widget title;
  final Widget? subtitle;

  const PdfPreviewTile({
    super.key,
    required this.pdfFileAsync,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final nav = AppNavigator(context);
    switch (pdfFileAsync) {
      case AsyncLoading():
        return ListTile(
          leading: CircularProgressIndicator(),
          title: title,
          subtitle: subtitle,
          enabled: false,
        );
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print('PdfPreviewTile error: $error');
          print(stackTrace);
        }
        return ListTile(
          leading: Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.error,
          ),
          title: title,
          subtitle: Text('Lỗi: $error'),
          enabled: false,
        );
      case AsyncData(:final value):
        return ListTile(
          leading: Icon(Icons.picture_as_pdf),
          title: title,
          subtitle: subtitle,
          enabled: value != null,
          onTap: () {
            nav.toPdfPreviewPage(
              title: value!.name,
              pdfData: value.bytes,
              sourceName: value.name,
            );
          },
        );
    }
  }
}
