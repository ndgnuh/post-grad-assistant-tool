import "dart:convert" show utf8;
import "dart:io" show File;

import "package:archive/archive.dart";
import "package:jinja/jinja.dart";
import "package:xml/xml.dart";

Future<void> renderDocxFromContext({
  required String templatePath,
  required String outputPath,
  required Map<String, Object?> context,
}) async {
  // Open docx file
  final template = File(templatePath);
  final bytes = await template.readAsBytes();
  final archive = ZipDecoder().decodeBytes(bytes);

  // Load document xml
  final documentXmlFile = archive.findFile("word/document.xml");
  final xmlBytes = documentXmlFile!.readBytes();
  final xmlString = utf8.decode(xmlBytes);
  final xmlObj = XmlDocument.parse(xmlString);

  // Render the xml object
  _renderFromXmlTemplate(xmlObj, context);

  // Store the xml file to the archive what write the output
  final renderedXml = ArchiveFile.string(
    "word/document.xml",
    xmlObj.toXmlString(pretty: true),
  );
  archive.addFile(renderedXml);
  final outputBytes = ZipEncoder().encodeBytes(archive);
  await File(outputPath).writeAsBytes(outputBytes);
}

XmlDocument _renderFromXmlTemplate(
  XmlDocument xmlDoc,
  Map<String, Object?> context,
) {
  // Render simple variables using jinja
  final env = Environment();
  final templateJinja = env.fromString(xmlDoc.innerXml);
  xmlDoc.innerXml = templateJinja.render(context);

  // Search and render row template
  final matchRow = RegExp(r'{\[\s*([a-zA-Z0-9_]+)\.([a-zA-Z0-9_$]+)\s*\]}');
  final trows = xmlDoc.findAllElements("w:tr");
  for (final row in trows) {
    // Check if the row is a template row
    final innerText = row.innerText;
    final isTemplate = matchRow.hasMatch(innerText);
    if (!isTemplate) {
      continue;
    }

    // Use the item name from first matched marker
    final matches = matchRow.allMatches(innerText);
    final itemName = matchRow.firstMatch(innerText)?[1] as String;
    final items = context[itemName] as List<Map<String, Object?>>;

    // Render rows
    final renderedRows = <XmlElement>[];
    for (final (index, item) in items.indexed) {
      final renderedRow = row.copy();

      // Special: $index -> index of row
      renderedRow.innerXml = renderedRow.innerXml.replaceAll(
        RegExp(r'{\[\s*.+\$index\s*\]}'),
        (1 + index).toString(),
      );

      // Replace each marker with actual content
      for (final match in matches) {
        final matchedWhole = match[0]; // Eg: {[ item.name ]}
        final matchedName = match[1]; // Eg: item
        final matchedProp = match[2]; // Eg: name
        if (matchedName != itemName) {
          throw "The row template must all have the same row indentifier name";
        }

        renderedRow.innerXml = renderedRow.innerXml.replaceFirst(
          matchedWhole as String,
          item[matchedProp]?.toString() ?? "",
        );
      }

      // Store rendered row
      renderedRows.add(renderedRow);
    }

    // Delete the template row and
    // append the rendered rows
    final parent = row.parent as XmlElement;
    row.remove();
    parent.children.addAll(renderedRows);
    break;
  }
  return xmlDoc;
}
