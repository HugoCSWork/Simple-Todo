// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DBTasksTable extends DBTasks with TableInfo<$DBTasksTable, DBTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, category, completed, notes, date, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'd_b_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<DBTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DBTask(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $DBTasksTable createAlias(String alias) {
    return $DBTasksTable(attachedDatabase, alias);
  }
}

class DBTask extends DataClass implements Insertable<DBTask> {
  final int id;
  final String title;
  final int category;
  final bool completed;
  final String notes;
  final DateTime date;
  final DateTime createdAt;
  const DBTask(
      {required this.id,
      required this.title,
      required this.category,
      required this.completed,
      required this.notes,
      required this.date,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['category'] = Variable<int>(category);
    map['completed'] = Variable<bool>(completed);
    map['notes'] = Variable<String>(notes);
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DBTasksCompanion toCompanion(bool nullToAbsent) {
    return DBTasksCompanion(
      id: Value(id),
      title: Value(title),
      category: Value(category),
      completed: Value(completed),
      notes: Value(notes),
      date: Value(date),
      createdAt: Value(createdAt),
    );
  }

  factory DBTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBTask(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      category: serializer.fromJson<int>(json['category']),
      completed: serializer.fromJson<bool>(json['completed']),
      notes: serializer.fromJson<String>(json['notes']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<int>(category),
      'completed': serializer.toJson<bool>(completed),
      'notes': serializer.toJson<String>(notes),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DBTask copyWith(
          {int? id,
          String? title,
          int? category,
          bool? completed,
          String? notes,
          DateTime? date,
          DateTime? createdAt}) =>
      DBTask(
        id: id ?? this.id,
        title: title ?? this.title,
        category: category ?? this.category,
        completed: completed ?? this.completed,
        notes: notes ?? this.notes,
        date: date ?? this.date,
        createdAt: createdAt ?? this.createdAt,
      );
  DBTask copyWithCompanion(DBTasksCompanion data) {
    return DBTask(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      category: data.category.present ? data.category.value : this.category,
      completed: data.completed.present ? data.completed.value : this.completed,
      notes: data.notes.present ? data.notes.value : this.notes,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DBTask(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('completed: $completed, ')
          ..write('notes: $notes, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, category, completed, notes, date, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBTask &&
          other.id == this.id &&
          other.title == this.title &&
          other.category == this.category &&
          other.completed == this.completed &&
          other.notes == this.notes &&
          other.date == this.date &&
          other.createdAt == this.createdAt);
}

class DBTasksCompanion extends UpdateCompanion<DBTask> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> category;
  final Value<bool> completed;
  final Value<String> notes;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  const DBTasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.completed = const Value.absent(),
    this.notes = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DBTasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int category,
    this.completed = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime date,
    required DateTime createdAt,
  })  : title = Value(title),
        category = Value(category),
        date = Value(date),
        createdAt = Value(createdAt);
  static Insertable<DBTask> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? category,
    Expression<bool>? completed,
    Expression<String>? notes,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (category != null) 'category': category,
      if (completed != null) 'completed': completed,
      if (notes != null) 'notes': notes,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DBTasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int>? category,
      Value<bool>? completed,
      Value<String>? notes,
      Value<DateTime>? date,
      Value<DateTime>? createdAt}) {
    return DBTasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      completed: completed ?? this.completed,
      notes: notes ?? this.notes,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBTasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('completed: $completed, ')
          ..write('notes: $notes, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DBTasksTable dBTasks = $DBTasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dBTasks];
}

typedef $$DBTasksTableCreateCompanionBuilder = DBTasksCompanion Function({
  Value<int> id,
  required String title,
  required int category,
  Value<bool> completed,
  Value<String> notes,
  required DateTime date,
  required DateTime createdAt,
});
typedef $$DBTasksTableUpdateCompanionBuilder = DBTasksCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<int> category,
  Value<bool> completed,
  Value<String> notes,
  Value<DateTime> date,
  Value<DateTime> createdAt,
});

class $$DBTasksTableFilterComposer
    extends Composer<_$AppDatabase, $DBTasksTable> {
  $$DBTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$DBTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $DBTasksTable> {
  $$DBTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$DBTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DBTasksTable> {
  $$DBTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DBTasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DBTasksTable,
    DBTask,
    $$DBTasksTableFilterComposer,
    $$DBTasksTableOrderingComposer,
    $$DBTasksTableAnnotationComposer,
    $$DBTasksTableCreateCompanionBuilder,
    $$DBTasksTableUpdateCompanionBuilder,
    (DBTask, BaseReferences<_$AppDatabase, $DBTasksTable, DBTask>),
    DBTask,
    PrefetchHooks Function()> {
  $$DBTasksTableTableManager(_$AppDatabase db, $DBTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DBTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DBTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DBTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> category = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DBTasksCompanion(
            id: id,
            title: title,
            category: category,
            completed: completed,
            notes: notes,
            date: date,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required int category,
            Value<bool> completed = const Value.absent(),
            Value<String> notes = const Value.absent(),
            required DateTime date,
            required DateTime createdAt,
          }) =>
              DBTasksCompanion.insert(
            id: id,
            title: title,
            category: category,
            completed: completed,
            notes: notes,
            date: date,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DBTasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DBTasksTable,
    DBTask,
    $$DBTasksTableFilterComposer,
    $$DBTasksTableOrderingComposer,
    $$DBTasksTableAnnotationComposer,
    $$DBTasksTableCreateCompanionBuilder,
    $$DBTasksTableUpdateCompanionBuilder,
    (DBTask, BaseReferences<_$AppDatabase, $DBTasksTable, DBTask>),
    DBTask,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DBTasksTableTableManager get dBTasks =>
      $$DBTasksTableTableManager(_db, _db.dBTasks);
}
