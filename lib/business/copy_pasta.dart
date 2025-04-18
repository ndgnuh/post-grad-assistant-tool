import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart'
    show rootBundle, Clipboard, ClipboardData;

class CopyPasta {
  final String name;
  final String content;
  CopyPasta({
    required this.name,
    required this.content,
  });

  Future<void> copyToClipboard() async {
    final data = ClipboardData(text: content);
    await Clipboard.setData(data);
  }
}

Future<List<CopyPasta>> loadCopyPasta() async {
  String yaml = await rootBundle.loadString("assets/copy-pasta.yaml");
  final data = loadYaml(yaml);
  return [
    for (final json in data)
      CopyPasta(
        name: json["name"],
        content: json["content"],
      )
  ];
}
