import 'package:meta/meta.dart';

part 'select.dart';

part 'insert.dart';

part 'update.dart';

part 'delete.dart';

const _defaultDelimiter = '?';

String _sanitize(dynamic value) {
  if (value == null) return "NULL"; // Handle null values

  if (value is num) return value.toString(); // Allow numbers directly

  if (value is bool) return value ? "1" : "0"; // Convert booleans to 1/0

  if (value is DateTime) {
    return "'${value.toIso8601String()}'"; // Format DateTime safely
  }

  if (value is String) {
    return "'${_escapeString(value)}'"; // Escape string input
  }

  throw ArgumentError("Unsupported SQL data type: ${value.runtimeType}");
}

/// Escapes special SQL characters in strings
String _escapeString(String input) {
  return input.replaceAll("'", "''"); // Escape single quotes
}

sealed class Query<R, TX> {
  final String name;
  final String delimiter;

  Query({
    required this.name,
    this.delimiter = _defaultDelimiter,
  });

  String? table;
  final List<dynamic> _values = [];
  int _conditionIndex = 1;

  @protected
  List<dynamic> get values => _values;

  String build();

  String replaceDelimiterMarkOld(String query) {
    return query.replaceAllMapped(delimiter, (match) {
      final replacement = '@${_conditionIndex++}';
      return replacement;
    });
  }

  String replaceDelimiterMark(String query, List? values) {
    switch (values) {
      case null:
        return query;
      case List values:
        int i = 0;
        return query.replaceAllMapped(delimiter, (match) {
          return _sanitize(values[i++]);
        });
    }
  }

  List<String> valuesToDelimiterOld(List<dynamic> values) {
    return values.map((e) => '@${_conditionIndex++}').toList();
  }

  List<String> valuesToDelimiter(List<dynamic> values) {
    return values.map((value) => _sanitize(value)).toList();
  }
}

mixin QueryString on Enum {
  String get toQueryString => name.toUpperCase();
}

mixin _Where<R, TX> on Query<R, TX> {
  final List<String> _condition = [];
  final List<Operator> _operators = [];

  void where(String condition, [List<dynamic>? values]) {
    _condition.add(replaceDelimiterMark(condition, values));
    _values.addAll(values ?? []);
  }

  void and() {
    _operators.add(Operator.and);
  }

  void or() {
    _operators.add(Operator.or);
  }

  String _getWhereString() {
    final joinedList = <String>[];
    for (var i = 0; i < _condition.length || i < _operators.length; i++) {
      if (i < _condition.length) {
        joinedList.add(_condition[i]);
      }
      if (i < _operators.length) {
        joinedList.add(_operators[i].toQueryString);
      }
    }
    return [for (final cond in joinedList) "($cond)"].join(' AND ');
  }
}

mixin _Returning<R, TX> on Query<R, TX> {
  final List<String> _returning = [];

  void returning(List<String> columns) {
    if (columns.isEmpty) {
      throw QueryError(
          type: name,
          method: 'returning',
          message: 'returning columns cannot be empty');
    }
    _returning.addAll(columns);
  }

  void returnAll() {
    _returning.add('*');
  }
}

enum Order with QueryString {
  asc,
  desc;

  bool get isAsc => this == Order.asc;

  bool get isDsc => this == Order.desc;
}

enum JoinType with QueryString { inner, left, right, full }

enum Operator with QueryString { and, or, not }

class QueryError implements Exception {
  final String type;
  final String method;
  final String message;

  const QueryError(
      {required this.type, required this.method, required this.message});

  @override
  String toString() {
    return "$type ERROR. method: $method, message: $message";
  }
}

class SelectQueryError extends QueryError {
  const SelectQueryError({required super.method, required super.message})
      : super(type: 'SelectQuery');
}

class InsertQueryError extends QueryError {
  const InsertQueryError({required super.method, required super.message})
      : super(type: 'InsertQuery');
}

class UpdateQueryError extends QueryError {
  const UpdateQueryError({required super.method, required super.message})
      : super(type: 'UpdateQuery');
}

class DeleteQueryError extends QueryError {
  const DeleteQueryError({required super.method, required super.message})
      : super(type: 'DeleteQuery');
}
