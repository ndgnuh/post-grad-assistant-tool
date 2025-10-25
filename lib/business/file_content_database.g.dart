// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content_database.dart';

// ignore_for_file: type=lint
class DocumentContent extends Table
    with TableInfo<DocumentContent, DocumentContentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DocumentContent(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  late final GeneratedColumn<Uint8List> content = GeneratedColumn<Uint8List>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, content];
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
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}content'],
      )!,
    );
  }

  @override
  DocumentContent createAlias(String alias) {
    return DocumentContent(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DocumentContentData extends DataClass
    implements Insertable<DocumentContentData> {
  final int? id;
  final Uint8List content;
  const DocumentContentData({this.id, required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['content'] = Variable<Uint8List>(content);
    return map;
  }

  DocumentContentCompanion toCompanion(bool nullToAbsent) {
    return DocumentContentCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      content: Value(content),
    );
  }

  factory DocumentContentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentContentData(
      id: serializer.fromJson<int?>(json['id']),
      content: serializer.fromJson<Uint8List>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'content': serializer.toJson<Uint8List>(content),
    };
  }

  DocumentContentData copyWith({
    Value<int?> id = const Value.absent(),
    Uint8List? content,
  }) => DocumentContentData(
    id: id.present ? id.value : this.id,
    content: content ?? this.content,
  );
  DocumentContentData copyWithCompanion(DocumentContentCompanion data) {
    return DocumentContentData(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentContentData(')
          ..write('id: $id, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, $driftBlobEquality.hash(content));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentContentData &&
          other.id == this.id &&
          $driftBlobEquality.equals(other.content, this.content));
}

class DocumentContentCompanion extends UpdateCompanion<DocumentContentData> {
  final Value<int?> id;
  final Value<Uint8List> content;
  const DocumentContentCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
  });
  DocumentContentCompanion.insert({
    this.id = const Value.absent(),
    required Uint8List content,
  }) : content = Value(content);
  static Insertable<DocumentContentData> custom({
    Expression<int>? id,
    Expression<Uint8List>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
    });
  }

  DocumentContentCompanion copyWith({
    Value<int?>? id,
    Value<Uint8List>? content,
  }) {
    return DocumentContentCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

abstract class _$FileContentDatabase extends GeneratedDatabase {
  _$FileContentDatabase(QueryExecutor e) : super(e);
  $FileContentDatabaseManager get managers => $FileContentDatabaseManager(this);
  late final DocumentContent documentContent = DocumentContent(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [documentContent];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $DocumentContentCreateCompanionBuilder =
    DocumentContentCompanion Function({
      Value<int?> id,
      required Uint8List content,
    });
typedef $DocumentContentUpdateCompanionBuilder =
    DocumentContentCompanion Function({
      Value<int?> id,
      Value<Uint8List> content,
    });

class $DocumentContentFilterComposer
    extends Composer<_$FileContentDatabase, DocumentContent> {
  $DocumentContentFilterComposer({
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

  ColumnFilters<Uint8List> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );
}

class $DocumentContentOrderingComposer
    extends Composer<_$FileContentDatabase, DocumentContent> {
  $DocumentContentOrderingComposer({
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

  ColumnOrderings<Uint8List> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DocumentContentAnnotationComposer
    extends Composer<_$FileContentDatabase, DocumentContent> {
  $DocumentContentAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<Uint8List> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $DocumentContentTableManager
    extends
        RootTableManager<
          _$FileContentDatabase,
          DocumentContent,
          DocumentContentData,
          $DocumentContentFilterComposer,
          $DocumentContentOrderingComposer,
          $DocumentContentAnnotationComposer,
          $DocumentContentCreateCompanionBuilder,
          $DocumentContentUpdateCompanionBuilder,
          (
            DocumentContentData,
            BaseReferences<
              _$FileContentDatabase,
              DocumentContent,
              DocumentContentData
            >,
          ),
          DocumentContentData,
          PrefetchHooks Function()
        > {
  $DocumentContentTableManager(_$FileContentDatabase db, DocumentContent table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DocumentContentFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DocumentContentOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DocumentContentAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<Uint8List> content = const Value.absent(),
              }) => DocumentContentCompanion(id: id, content: content),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                required Uint8List content,
              }) => DocumentContentCompanion.insert(id: id, content: content),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $DocumentContentProcessedTableManager =
    ProcessedTableManager<
      _$FileContentDatabase,
      DocumentContent,
      DocumentContentData,
      $DocumentContentFilterComposer,
      $DocumentContentOrderingComposer,
      $DocumentContentAnnotationComposer,
      $DocumentContentCreateCompanionBuilder,
      $DocumentContentUpdateCompanionBuilder,
      (
        DocumentContentData,
        BaseReferences<
          _$FileContentDatabase,
          DocumentContent,
          DocumentContentData
        >,
      ),
      DocumentContentData,
      PrefetchHooks Function()
    >;

class $FileContentDatabaseManager {
  final _$FileContentDatabase _db;
  $FileContentDatabaseManager(this._db);
  $DocumentContentTableManager get documentContent =>
      $DocumentContentTableManager(_db, _db.documentContent);
}
