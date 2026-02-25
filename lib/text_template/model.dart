import 'parser.dart';

sealed class TemplateNode {
  const TemplateNode();
}

class TemplateFreeText extends TemplateNode {
  final String text;
  const TemplateFreeText(this.text);
}

class TemplateVariable extends TemplateNode {
  final String name;
  const TemplateVariable(this.name);
}

class TextTemplate {
  final List<TemplateNode> nodes;
  const TextTemplate({required this.nodes});

  @override
  String toString() {
    return 'TextTemplate(variables: $variables)';
  }

  Set<String> get variables => {
    for (final node in nodes)
      if (node is TemplateVariable) node.name,
  };

  /// Rebuild the template source
  String reconstruct() {
    final buffer = StringBuffer();
    for (final node in nodes) {
      if (node is TemplateFreeText) {
        buffer.write(node.text);
      } else if (node is TemplateVariable) {
        buffer.write("[[");
        buffer.write(node.name);
        buffer.write("]]");
      }
    }
    return buffer.toString();
  }

  /// Render the template with the given context
  String render(Map<String, String> context) {
    for (final name in variables) {
      assert(context.containsKey(name), "Missing variable '$name' in context");
    }
    final buffer = StringBuffer();
    for (final node in nodes) {
      switch (node) {
        case TemplateFreeText(:final text):
          buffer.write(text);
        case TemplateVariable(:final name):
          buffer.write(context[name]);
      }
    }
    return buffer.toString();
  }

  factory TextTemplate.parse(String source) {
    final parser = TemplateParser(source: source);
    return parser.parse();
  }
}
