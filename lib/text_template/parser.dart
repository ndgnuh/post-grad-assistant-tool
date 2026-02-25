import 'tokenizer.dart';
import 'model.dart';

class TemplateParser {
  final String source;
  final List<TemplateToken> tokens;
  final List<List<TemplateNode>> _scopes = [];
  int _position = 0;

  TemplateParser({required this.source}) : tokens = tokenize(source);

  /// Next character
  void advance() => _position++;

  TemplateToken get currentToken =>
      _position < tokens.length ? tokens[_position] : tokens.last;

  bool get notEof => _position < tokens.length - 1;

  /// Scoping
  List<TemplateNode> get currentScope => _scopes.last;

  /// New scope
  void pushScope() => _scopes.add(<TemplateNode>[]);

  /// Pop scope
  List<TemplateNode> popScope() => _scopes.removeLast();

  /// Add to current scope
  void add(TemplateNode node) {
    currentScope.add(node);
  }

  TextTemplate parse() {
    // reset state
    _scopes.clear();
    _position = 0;

    pushScope();
    while (notEof) {
      final node = _parseFromToken(currentToken);
      add(node);
    }

    return TextTemplate(nodes: currentScope);
  }

  TemplateNode _parseFromToken(TemplateToken token) {
    switch (token) {
      case TemplateTextToken(:final text):
        advance();
        return TemplateFreeText(text);
      case TemplateVarStartToken():
        return _parseVariable();
      case TemplateVarEndToken token:
        return unexpect(token);
      case TemplateEofToken token:
        return unexpect(token);
    }
  }

  TemplateNode unexpect(TemplateToken token) {
    throw "Unexpected token: $token at ${token.row}:${token.column}";
  }

  TemplateNode _parseVariable() {
    // consume [[
    advance();

    // Expect text token for variable name
    final name = switch (currentToken) {
      TemplateTextToken(:final text) => text.trim(),
      _ => throw "Expected variable name after '[['",
    };

    advance(); // consume variable name

    // Expect ]]
    switch (currentToken) {
      case TemplateVarEndToken():
        advance(); // consume ]]
        return TemplateVariable(name);
      default:
        throw "Expected ']]' after variable name";
    }
  }
}
