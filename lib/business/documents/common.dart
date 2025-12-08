import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;

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

class XlsxFile extends InMemoryDocument {
  const XlsxFile({required super.name, required super.bytes});

  @override
  String get extension => ".xlsx";
}

class DocxFile extends InMemoryDocument {
  const DocxFile({required super.name, required super.bytes});

  @override
  String get extension => ".docx";
}

