import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ColumnMap = (String, String);

class ColumnMapNotifier extends Notifier<ColumnMap> {
  final String dbName;
  final String initialMapping;
  ColumnMapNotifier(this.dbName, this.initialMapping);

  @override
  ColumnMap build() => (dbName, initialMapping);

  void set(String mapping) {
    state = (dbName, mapping);
  }
}
