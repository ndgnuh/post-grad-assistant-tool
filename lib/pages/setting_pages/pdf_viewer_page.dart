import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

import '../../custom_widgets.dart';

class PdfDataViewerPage extends StatelessWidget {
  final Uint8List pdfData;
  final String sourceName;
  final String title;

  const PdfDataViewerPage({
    super.key,
    required this.sourceName,
    required this.pdfData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Expanded(
        child: PdfViewer.data(pdfData, sourceName: sourceName),
      ),
    );
  }
}
