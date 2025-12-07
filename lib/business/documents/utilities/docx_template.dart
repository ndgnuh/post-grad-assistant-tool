import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:jinja/jinja.dart';

import 'package:xml/xml.dart';
import 'package:archive/archive.dart';

const placeholderPattern = r'{{\s*([\w\.]+)\s*}}';
const listPattern = r'{%\s*map\(([\w\.]+)\)\s*%}';
const archiveDocumentPath = 'word/document.xml';

extension DocxReader on File {
  /// If the file is an .docx file, reads and returns the main document.xml as an XmlDocument.
  /// This file is received by unzipping the .docx file and extracting 'word/document.xml'.
  XmlDocument readDocxDocumentSync() {
    final bytes = readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);
    final documentFile = archive.findFile(archiveDocumentPath);
    assert(documentFile != null, 'document.xml not found in docx file');
    final documentXml = utf8.decode(documentFile!.readBytes()!);
    return XmlDocument.parse(documentXml);
  }
}

class PlaceholderElement {
  final String name;
  final XmlElement element;

  PlaceholderElement(this.name, this.element);
}

class ListElemenent {
  final String name;
  final XmlElement element;

  ListElemenent(this.name, this.element);
}

XmlElement getParagraph(XmlElement textElement) {
  XmlElement? parent = textElement.parentElement;
  while (parent != null && parent.name.local != 'w:p') {
    parent = parent.parentElement;
  }
  if (parent == null) {
    throw Exception('No paragraph found for the given text element.');
  }
  return parent;
}

class DocxTemplate {
  late final Archive file;
  late final XmlDocument document;

  DocxTemplate.fromBytes(Uint8List bytes) {
    file = ZipDecoder().decodeBytes(bytes);
    document = XmlDocument.parse(
      utf8.decode(
        file.findFile('word/document.xml')!.readBytes()!,
      ),
    );
  }

  List<ListElemenent> get listElements {
    final textElements = document.findAllElements('w:t');
    final listElements = <ListElemenent>[];

    for (final element in textElements) {
      final match = RegExp(
        r'{%\s*map\(([\w\.]+)\)\s*%}',
      ).firstMatch(element.value ?? '');
      if (match != null) {
        final listName = match.group(1);
        if (listName != null) {
          listElements.add(ListElemenent(listName, getParagraph(element)));
        }
      }
    }

    return listElements;
  }

  /// Render to docx document, for now only simple placeholders are supported
  Uint8List render(Map<String, dynamic> context) {
    final renderedDocument = document.copy();
    final jinjaEnv = Environment();

    // Convert list element to jinja loop, list is an illusion
    // Each list element is define as a paragraph, with number style
    // The ilvl is the level of the list, numId is the list style
    // <w:p>
    //   <w:pPr>
    //     <w:pStyle w:val="BodyText"/>
    //     <w:numPr>
    //       <w:ilvl w:val="0"/>
    //       <w:numId w:val="3"/>
    //     </w:numPr>
    //     <w:bidi w:val="0"/>
    //     <w:jc w:val="start"/>
    //     <w:rPr/>
    //   </w:pPr>
    //   <w:bookmarkStart w:id="4" w:name="__DdeLink__12_2808997459"/>
    //   <w:r>
    //     <w:rPr/>
    //     <w:t>{% map(myList) %} {{ item.name }}: {{ item.description }}</w:t>
    //   </w:r>
    //   <w:bookmarkEnd w:id="4"/>
    // </w:p>

    /// Find all w.sdt fields
    /// The content control must be pre-filled with jinja placeholder (without the {{ }})
    final contentControls = renderedDocument.findAllElements("w:sdt").toList();
    for (final element in contentControls) {
      final text = element.findAllElements("w:t").first;
      final name = text.innerText.trim();
      final template = jinjaEnv.fromString("{{ $name }}");
      final rendered = template.render(context);
      text.innerText = rendered;
    }

    // Replace simple placeholders
    // final textElements = renderedDocument.findAllElements('w:t');
    // for (final element in textElements) {
    //   try {
    //     final template = jinjaEnv.fromString(element.innerText);
    //     final rendered = template.render(context);
    //     element.innerText = rendered;
    //   } catch (e) {
    //     // If rendering fails, keep the original text}
    //     print(element.innerText);
    //     print('Error rendering template: $e');
    //   }
    // }

    final result = Archive();
    for (final file in file.files) {
      result.addFile(file);
    }
    final documentFile = ArchiveFile.string(
      archiveDocumentPath,
      renderedDocument.toXmlString(),
    );
    result.addFile(documentFile);

    return ZipEncoder().encode(result) as Uint8List;
  }
}
