// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content_database.dart';

// ignore_for_file: type=lint
class $DocumentContentTable extends DocumentContent
    with TableInfo<$DocumentContentTable, DocumentContentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentContentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<Uint8List> content = GeneratedColumn<Uint8List>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, fileName, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_content';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentContentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentContentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentContentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}content'],
      )!,
    );
  }

  @override
  $DocumentContentTable createAlias(String alias) {
    return $DocumentContentTable(attachedDatabase, alias);
  }
}

class DocumentContentData extends DataClass
    implements Insertable<DocumentContentData> {
  final int id;
  final String fileName;
  final Uint8List content;
  const DocumentContentData({
    required this.id,
    required this.fileName,
    required this.content,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['file_name'] = Variable<String>(fileName);
    map['content'] = Variable<Uint8List>(content);
    return map;
  }

  DocumentContentCompanion toCompanion(bool nullToAbsent) {
    return DocumentContentCompanion(
      id: Value(id),
      fileName: Value(fileName),
      content: Value(content),
    );
  }

  factory DocumentContentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentContentData(
      id: serializer.fromJson<int>(json['id']),
      fileName: serializer.fromJson<String>(json['fileName']),
      content: serializer.fromJson<Uint8List>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fileName': serializer.toJson<String>(fileName),
      'content': serializer.toJson<Uint8List>(content),
    };
  }

  DocumentContentData copyWith({
    int? id,
    String? fileName,
    Uint8List? content,
  }) => DocumentContentData(
    id: id ?? this.id,
    fileName: fileName ?? this.fileName,
    content: content ?? this.content,
  );
  DocumentContentData copyWithCompanion(DocumentContentCompanion data) {
    return DocumentContentData(
      id: data.id.present ? data.id.value : this.id,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentContentData(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fileName, $driftBlobEquality.hash(content));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentContentData &&
          other.id == this.id &&
          other.fileName == this.fileName &&
          $driftBlobEquality.equals(other.content, this.content));
}

class DocumentContentCompanion extends UpdateCompanion<DocumentContentData> {
  final Value<int> id;
  final Value<String> fileName;
  final Value<Uint8List> content;
  const DocumentContentCompanion({
    this.id = const Value.absent(),
    this.fileName = const Value.absent(),
    this.content = const Value.absent(),
  });
  DocumentContentCompanion.insert({
    this.id = const Value.absent(),
    required String fileName,
    required Uint8List content,
  }) : fileName = Value(fileName),
       content = Value(content);
  static Insertable<DocumentContentData> custom({
    Expression<int>? id,
    Expression<String>? fileName,
    Expression<Uint8List>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileName != null) 'file_name': fileName,
      if (content != null) 'content': content,
    });
  }

  DocumentContentCompanion copyWith({
    Value<int>? id,
    Value<String>? fileName,
    Value<Uint8List>? content,
  }) {
    return DocumentContentCompanion(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (content.present) {
      map['content'] = Variable<Uint8List>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentContentCompanion(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

abstract class _$FileContentDatabase extends GeneratedDatabase {
  _$FileContentDatabase(QueryExecutor e) : super(e);
  $FileContentDatabaseManager get managers => $FileContentDatabaseManager(this);
  late final $DocumentContentTable documentContent = $DocumentContentTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [documentContent];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$DocumentContentTableCreateCompanionBuilder =
    DocumentContentCompanion Function({
      Value<int> id,
      required String fileName,
      required Uint8List content,
    });
typedef $$DocumentContentTableUpdateCompanionBuilder =
    DocumentContentCompanion Function({
      Value<int> id,
      Value<String> fileName,
      Value<Uint8List> content,
    });

class $$DocumentContentTableFilterComposer
    extends Composer<_$FileContentDatabase, $DocumentContentTable> {
  $$DocumentContentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentContentTableOrderingComposer
    extends Composer<_$FileContentDatabase, $DocumentContentTable> {
  $$DocumentContentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentContentTableAnnotationComposer
    extends Composer<_$FileContentDatabase, $DocumentContentTable> {
  $$DocumentContentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<Uint8List> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$DocumentContentTableTableManager
    extends
        RootTableManager<
          _$FileContentDatabase,
          $DocumentContentTable,
          DocumentContentData,
          $$DocumentContentTableFilterComposer,
          $$DocumentContentTableOrderingComposer,
          $$DocumentContentTableAnnotationComposer,
          $$DocumentContentTableCreateCompanionBuilder,
          $$DocumentContentTableUpdateCompanionBuilder,
          (
            DocumentContentData,
            BaseReferences<
              _$FileContentDatabase,
              $DocumentContentTable,
              DocumentContentData
            >,
          ),
          DocumentContentData,
          PrefetchHooks Function()
        > {
  $$DocumentContentTableTableManager(
    _$FileContentDatabase db,
    $DocumentContentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentContentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentContentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentContentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<Uint8List> content = const Value.absent(),
              }) => DocumentContentCompanion(
                id: id,
                fileName: fileName,
                content: content,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fileName,
                required Uint8List content,
              }) => DocumentContentCompanion.insert(
                id: id,
                fileName: fileName,
                content: content,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentContentTableProcessedTableManager =
    ProcessedTableManager<
      _$FileContentDatabase,
      $DocumentContentTable,
      DocumentContentData,
      $$DocumentContentTableFilterComposer,
      $$DocumentContentTableOrderingComposer,
      $$DocumentContentTableAnnotationComposer,
      $$DocumentContentTableCreateCompanionBuilder,
      $$DocumentContentTableUpdateCompanionBuilder,
      (
        DocumentContentData,
        BaseReferences<
          _$FileContentDatabase,
          $DocumentContentTable,
          DocumentContentData
        >,
      ),
      DocumentContentData,
      PrefetchHooks Function()
    >;

class $FileContentDatabaseManager {
  final _$FileContentDatabase _db;
  $FileContentDatabaseManager(this._db);
  $$DocumentContentTableTableManager get documentContent =>
      $$DocumentContentTableTableManager(_db, _db.documentContent);
}
