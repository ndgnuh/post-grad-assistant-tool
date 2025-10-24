import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

import '../../custom_widgets.dart';

class PdfDataViewerPage extends StatelessWidget {
  final Uint8List pdfData;
  final String title;

  const PdfDataViewerPage({
    super.key,
    required this.pdfData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstrainedAppBar(
        child: AppBar(
          title: Text(title),
        ),
      ),
      body: ConstrainedBody(
        child: Expanded(
          child: PdfViewer.data(
            pdfData,
            sourceName: "$title.pdf",
          ),
        ),
      ),
    );
  }
}
