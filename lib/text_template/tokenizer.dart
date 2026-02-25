sealed class TemplateToken {
  final int row;
  final int column;
  const TemplateToken({required this.row, required this.column});

  @override
  String toString() {
    return '$runtimeType Token at [$row:$column]';
  }
}

class TemplateTextToken extends TemplateToken {
  final String text;
  TemplateTextToken({
    required this.text,
    required super.row,
    required super.column,
  });
}

class TemplateVarStartToken extends TemplateToken {
  TemplateVarStartToken({required super.row, required super.column});
}

class TemplateVarEndToken extends TemplateToken {
  TemplateVarEndToken({required super.row, required super.column});
}

class TemplateEofToken extends TemplateToken {
  TemplateEofToken({required super.row, required super.column});
}

class RowColumnTracker {
  int position = 0;
  final int maxPosition;
  int row = 0;
  int column = 0;

  /// saved row/column
  int savedRow = 0;
  int savedColumn = 0;

  RowColumnTracker({required this.maxPosition});

  bool get notEof => position < maxPosition;

  void advance(String ch) {
    position += ch.length;
    switch (ch) {
      case "\n" || "\r":
        row += 1;
        column = 0;
        break;
      default:
        column += 1;
        break;
    }
  }

  void save() {
    savedRow = row;
    savedColumn = column;
  }

  void saveNext(String nextCh) {
    switch (nextCh) {
      case "\n" || "\r":
        savedRow = row + 1;
        savedColumn = 0;
        break;
      default:
        savedRow = row;
        savedColumn = column + 1;
        break;
    }
  }
}

List<TemplateToken> tokenize(String content) {
  final tracker = RowColumnTracker(maxPosition: content.length);

  final tokens = <TemplateToken>[];
  final buffer = StringBuffer();

  void commit() {
    final content = buffer.toString();
    final column = tracker.savedColumn;
    final row = tracker.savedRow;
    tokens.add(TemplateTextToken(text: content, column: column, row: row));
    buffer.clear();
  }

  while (tracker.notEof) {
    final ch = content[tracker.position];
    // last character, just write and advance
    if (tracker.position + 1 >= content.length) {
      buffer.write(ch);
      tracker.advance(ch);
      continue;
    }

    // Peak next character
    final nch = content[tracker.position + 1];
    final cat = "$ch$nch";

    if (cat == "[[") {
      // Commit and add variable start token
      commit();
      // consume [
      tracker.advance(ch);
      final row = tracker.row;
      final column = tracker.column;
      tracker.advance(nch);
      // Add token
      final token = TemplateVarStartToken(row: row, column: column);
      tokens.add(token);
      // Save position after consuming
      tracker.saveNext(nch);
    } else if (cat == "]]") {
      // Commit and add variable end token
      commit();

      // consume ]]
      tracker.saveNext(ch);
      tracker.advance(ch);
      tracker.advance(nch);
      // Add token
      final token = TemplateVarEndToken(
        row: tracker.savedRow,
        column: tracker.savedColumn,
      );
      tokens.add(token);
      tracker.saveNext(nch);
    } else {
      buffer.write(ch);
      tracker.advance(ch);
    }
  }

  // commit remaining buffer
  commit();
  tokens.add(TemplateEofToken(row: tracker.row, column: tracker.column));

  return tokens;
}
