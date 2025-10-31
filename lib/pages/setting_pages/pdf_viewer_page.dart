import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdfrx/pdfrx.dart';

import '../../custom_widgets.dart';

class PdfDataPreviewPage extends StatelessWidget {
  final Uint8List pdfData;
  final String sourceName;
  final String title;

  const PdfDataPreviewPage({
    super.key,
    required this.sourceName,
    required this.pdfData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    saveFile() async {
      final savePath = await FilePicker.platform.saveFile(
        fileName: sourceName,
        bytes: pdfData,
      );

      switch (savePath) {
        case String path:
          if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
            await File(path).writeAsBytes(pdfData);
          }
          messenger.showSnackBar(
            SnackBar(content: Text("Đã lưu file tại $path")),
          );
      }
    }

    final fabClass =
        (Platform.isMacOS || Platform.isWindows || Platform.isLinux)
        ? FloatingActionButton.large
        : FloatingActionButton.new;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(
            child: PdfViewer.data(pdfData, sourceName: sourceName),
          ),
        ],
      ),
      floatingActionButton: fabClass(
        onPressed: saveFile,
        child: const Icon(Symbols.save),
      ),
    );
  }
}
