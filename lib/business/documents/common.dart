import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;

import 'utilities/pdf_widgets.dart';
export 'utilities/pdf_widgets.dart' show pt, inch, cm;

typedef PdfBuilder = FutureOr<PdfFile> Function(PdfConfig config);

class PdfConfig {
  final double baseFontSize;
  // pdf and flutter have different EdgeInsets classes.
  // so we assume symmetric margins here for simplicity.

  final double verticalMargin;
  final double horizontalMargin;
  final PdfPageFormat pageFormat;
  final double verticalTableCellPadding;
  final double horizontalTableCellPadding;

  const PdfConfig({
    this.baseFontSize = 12 * pt,
    this.verticalMargin = 1 * inch,
    this.horizontalMargin = 1 * inch,
    this.verticalTableCellPadding = 6 * pt,
    this.horizontalTableCellPadding = 6 * pt,
    this.pageFormat = PdfPageFormat.a4,
  });

  PdfConfig copyWith({
    double? baseFontSize,
    double? verticalMargin,
    double? horizontalMargin,
    PdfPageFormat? pageFormat,
    double? verticalTableCellPadding,
    double? horizontalTableCellPadding,
  }) {
    return PdfConfig(
      baseFontSize: baseFontSize ?? this.baseFontSize,
      verticalMargin: verticalMargin ?? this.verticalMargin,
      horizontalMargin: horizontalMargin ?? this.horizontalMargin,
      pageFormat: pageFormat ?? this.pageFormat,
      verticalTableCellPadding:
          verticalTableCellPadding ?? this.verticalTableCellPadding,
      horizontalTableCellPadding:
          horizontalTableCellPadding ?? this.horizontalTableCellPadding,
    );
  }

  @override
  String toString() {
    return 'PdfConfig(baseFontSize: $baseFontSize, verticalMargin: $verticalMargin, horizontalMargin: $horizontalMargin, pageFormat: $pageFormat, verticalTableCellPadding: $verticalTableCellPadding, horizontalTableCellPadding: $horizontalTableCellPadding)';
  }
}

sealed class InMemoryDocument {
  final String name;
  final Uint8List bytes;
  const InMemoryDocument({required this.name, required this.bytes});

  /// File name extension (with dot), e.g. ".xlsx"
  String get extension;

  /// Get file name from document name
  String get fileName => name.endsWith(extension) ? name : "$name$extension";

  Future<void> save({required String directory}) {
    final file = File(p.join(directory, fileName));
    return file.writeAsBytes(bytes);
  }
}

/// Excel file in memory
class XlsxFile extends InMemoryDocument {
  const XlsxFile({required super.name, required super.bytes});

  @override
  String get extension => ".xlsx";
}

/// Word document file in memory
class DocxFile extends InMemoryDocument {
  const DocxFile({required super.name, required super.bytes});

  @override
  String get extension => ".docx";
}

/// PDF file in memory, has [config] for storing PDF generation settings
class PdfFile extends InMemoryDocument {
  final PdfConfig config;

  @override
  String get extension => ".pdf";

  const PdfFile({
    required super.name,
    required super.bytes,
    this.config = const PdfConfig(),
  });
}
