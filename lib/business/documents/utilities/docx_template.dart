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

    // Find all w.sdt fields
    // =====================
    // <w:sdt>
    //   <w:sdtPr>
    //     <w:alias w:val="ct-title"/>
    //     <w15:appearance w15:val="boundingBox"/>
    //     <w:label w:val="0"/>
    //     <w:lock w:val="unlocked"/>
    //     <w:placeholder>
    //       <w:docPart w:val="5067de56ce63492eaa8c236da629d290"/>
    //     </w:placeholder>
    //     <w:tag w:val="ct-tag"/>
    //     <w:rPr>
    //       <w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:eastAsia="Times New Roman" w:cs="Times New Roman"/>
    //       <w:b w:val="0"/>
    //     </w:rPr>
    //   </w:sdtPr>
    //   <w:sdtContent>
    //     <w:r>
    //       <w:rPr>
    //         <w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:eastAsia="Times New Roman" w:cs="Times New Roman"/>
    //         <w:b w:val="0"/>
    //       </w:rPr>
    //       <w:t xml:space="preserve">Ct-filled</w:t>
    //     </w:r>
    //   </w:sdtContent>
    // </w:sdt>
    final contentControls = renderedDocument.findAllElements("w:sdt").toList();
    for (final element in contentControls) {
      /// The name helps debugging the template
      final innerText = element.innerText;

      /// Find the w:tag element to get the name
      /// This corresponds to the tag name of the content control
      final tagElement = element.findAllElements("w:tag").firstOrNull;
      assert(
        tagElement != null,
        "Content control without tag found nere $innerText",
      );
      final tagName = tagElement!.getAttribute("w:val");
      assert(
        tagName != null,
        "Content control without tag name found nere $innerText",
      );

      // remove the "showing placeholder" element or set it to false
      final showingPlcHdr = element
          .findAllElements("w:showingPlcHdr")
          .firstOrNull;
      if (showingPlcHdr != null) {
        showingPlcHdr.setAttribute("w:val", "false");
      }

      // Create jinja template to fill the value
      // This is better than simple replacement because expressions can be used
      final tagTemplate = jinjaEnv.fromString("{{ $tagName }}");
      final tagValue = tagTemplate.render(context);

      // Replace filled content with the rendered value
      // the content are stored in w:sdtContent/w:t
      final sdtContent = element.findAllElements("w:sdtContent").firstOrNull;
      if (sdtContent == null) {
        /// Create stdContent if not exists
        final sdtContentElement = XmlElement(
          XmlName('w:sdtContent'),
          [],
          [
            XmlElement(
              XmlName('w:r'),
              [],
              [
                XmlElement(
                  XmlName('w:t'),
                  [XmlAttribute(XmlName('xml:space'), 'preserve')],
                  [XmlText(tagValue)],
                ),
              ],
            ),
          ],
        );
        element.children.add(sdtContentElement);
      } else {
        final stdContentText = sdtContent.findAllElements("w:t").first;
        stdContentText.innerText = tagValue;
      }
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

Uint8List fillDocxTemplate(
  Uint8List templateBytes,
  Map<String, Object?> context,
) {
  final template = DocxTemplate.fromBytes(templateBytes);
  return template.render(context);
}
