// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TaskTableTable extends TaskTable with TableInfo<$TaskTableTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
      'time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  static const VerificationMeta _toRememberMeta =
      const VerificationMeta('toRemember');
  @override
  late final GeneratedColumn<bool> toRemember = GeneratedColumn<bool>(
      'to_remember', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("to_remember" IN (0, 1))'));
  static const VerificationMeta _toRememberTimeMeta =
      const VerificationMeta('toRememberTime');
  @override
  late final GeneratedColumn<String> toRememberTime = GeneratedColumn<String>(
      'to_remember_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _toRememberDateMeta =
      const VerificationMeta('toRememberDate');
  @override
  late final GeneratedColumn<String> toRememberDate = GeneratedColumn<String>(
      'to_remember_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        note,
        time,
        date,
        isCompleted,
        toRemember,
        toRememberTime,
        toRememberDate,
        category
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
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
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('to_remember')) {
      context.handle(
          _toRememberMeta,
          toRemember.isAcceptableOrUnknown(
              data['to_remember']!, _toRememberMeta));
    } else if (isInserting) {
      context.missing(_toRememberMeta);
    }
    if (data.containsKey('to_remember_time')) {
      context.handle(
          _toRememberTimeMeta,
          toRememberTime.isAcceptableOrUnknown(
              data['to_remember_time']!, _toRememberTimeMeta));
    }
    if (data.containsKey('to_remember_date')) {
      context.handle(
          _toRememberDateMeta,
          toRememberDate.isAcceptableOrUnknown(
              data['to_remember_date']!, _toRememberDateMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      toRemember: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}to_remember'])!,
      toRememberTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}to_remember_time']),
      toRememberDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}to_remember_date']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final bool isCompleted;
  final bool toRemember;
  final String? toRememberTime;
  final String? toRememberDate;
  final String category;
  const Task(
      {this.id,
      required this.title,
      required this.note,
      required this.time,
      required this.date,
      required this.isCompleted,
      required this.toRemember,
      this.toRememberTime,
      this.toRememberDate,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['title'] = Variable<String>(title);
    map['note'] = Variable<String>(note);
    map['time'] = Variable<String>(time);
    map['date'] = Variable<String>(date);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['to_remember'] = Variable<bool>(toRemember);
    if (!nullToAbsent || toRememberTime != null) {
      map['to_remember_time'] = Variable<String>(toRememberTime);
    }
    if (!nullToAbsent || toRememberDate != null) {
      map['to_remember_date'] = Variable<String>(toRememberDate);
    }
    map['category'] = Variable<String>(category);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      note: Value(note),
      time: Value(time),
      date: Value(date),
      isCompleted: Value(isCompleted),
      toRemember: Value(toRemember),
      toRememberTime: toRememberTime == null && nullToAbsent
          ? const Value.absent()
          : Value(toRememberTime),
      toRememberDate: toRememberDate == null && nullToAbsent
          ? const Value.absent()
          : Value(toRememberDate),
      category: Value(category),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      note: serializer.fromJson<String>(json['note']),
      time: serializer.fromJson<String>(json['time']),
      date: serializer.fromJson<String>(json['date']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      toRemember: serializer.fromJson<bool>(json['toRemember']),
      toRememberTime: serializer.fromJson<String?>(json['toRememberTime']),
      toRememberDate: serializer.fromJson<String?>(json['toRememberDate']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'note': serializer.toJson<String>(note),
      'time': serializer.toJson<String>(time),
      'date': serializer.toJson<String>(date),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'toRemember': serializer.toJson<bool>(toRemember),
      'toRememberTime': serializer.toJson<String?>(toRememberTime),
      'toRememberDate': serializer.toJson<String?>(toRememberDate),
      'category': serializer.toJson<String>(category),
    };
  }

  Task copyWith(
          {Value<int?> id = const Value.absent(),
          String? title,
          String? note,
          String? time,
          String? date,
          bool? isCompleted,
          bool? toRemember,
          Value<String?> toRememberTime = const Value.absent(),
          Value<String?> toRememberDate = const Value.absent(),
          String? category}) =>
      Task(
        id: id.present ? id.value : this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        time: time ?? this.time,
        date: date ?? this.date,
        isCompleted: isCompleted ?? this.isCompleted,
        toRemember: toRemember ?? this.toRemember,
        toRememberTime:
            toRememberTime.present ? toRememberTime.value : this.toRememberTime,
        toRememberDate:
            toRememberDate.present ? toRememberDate.value : this.toRememberDate,
        category: category ?? this.category,
      );
  Task copyWithCompanion(TaskTableCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      note: data.note.present ? data.note.value : this.note,
      time: data.time.present ? data.time.value : this.time,
      date: data.date.present ? data.date.value : this.date,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      toRemember:
          data.toRemember.present ? data.toRemember.value : this.toRemember,
      toRememberTime: data.toRememberTime.present
          ? data.toRememberTime.value
          : this.toRememberTime,
      toRememberDate: data.toRememberDate.present
          ? data.toRememberDate.value
          : this.toRememberDate,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('toRemember: $toRemember, ')
          ..write('toRememberTime: $toRememberTime, ')
          ..write('toRememberDate: $toRememberDate, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, note, time, date, isCompleted,
      toRemember, toRememberTime, toRememberDate, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.note == this.note &&
          other.time == this.time &&
          other.date == this.date &&
          other.isCompleted == this.isCompleted &&
          other.toRemember == this.toRemember &&
          other.toRememberTime == this.toRememberTime &&
          other.toRememberDate == this.toRememberDate &&
          other.category == this.category);
}

class TaskTableCompanion extends UpdateCompanion<Task> {
  final Value<int?> id;
  final Value<String> title;
  final Value<String> note;
  final Value<String> time;
  final Value<String> date;
  final Value<bool> isCompleted;
  final Value<bool> toRemember;
  final Value<String?> toRememberTime;
  final Value<String?> toRememberDate;
  final Value<String> category;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.time = const Value.absent(),
    this.date = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.toRemember = const Value.absent(),
    this.toRememberTime = const Value.absent(),
    this.toRememberDate = const Value.absent(),
    this.category = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String note,
    required String time,
    required String date,
    required bool isCompleted,
    required bool toRemember,
    this.toRememberTime = const Value.absent(),
    this.toRememberDate = const Value.absent(),
    required String category,
  })  : title = Value(title),
        note = Value(note),
        time = Value(time),
        date = Value(date),
        isCompleted = Value(isCompleted),
        toRemember = Value(toRemember),
        category = Value(category);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? note,
    Expression<String>? time,
    Expression<String>? date,
    Expression<bool>? isCompleted,
    Expression<bool>? toRemember,
    Expression<String>? toRememberTime,
    Expression<String>? toRememberDate,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (time != null) 'time': time,
      if (date != null) 'date': date,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (toRemember != null) 'to_remember': toRemember,
      if (toRememberTime != null) 'to_remember_time': toRememberTime,
      if (toRememberDate != null) 'to_remember_date': toRememberDate,
      if (category != null) 'category': category,
    });
  }

  TaskTableCompanion copyWith(
      {Value<int?>? id,
      Value<String>? title,
      Value<String>? note,
      Value<String>? time,
      Value<String>? date,
      Value<bool>? isCompleted,
      Value<bool>? toRemember,
      Value<String?>? toRememberTime,
      Value<String?>? toRememberDate,
      Value<String>? category}) {
    return TaskTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      time: time ?? this.time,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
      toRemember: toRemember ?? this.toRemember,
      toRememberTime: toRememberTime ?? this.toRememberTime,
      toRememberDate: toRememberDate ?? this.toRememberDate,
      category: category ?? this.category,
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
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (toRemember.present) {
      map['to_remember'] = Variable<bool>(toRemember.value);
    }
    if (toRememberTime.present) {
      map['to_remember_time'] = Variable<String>(toRememberTime.value);
    }
    if (toRememberDate.present) {
      map['to_remember_date'] = Variable<String>(toRememberDate.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('toRemember: $toRemember, ')
          ..write('toRememberTime: $toRememberTime, ')
          ..write('toRememberDate: $toRememberDate, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final TaskDao taskDao = TaskDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskTable];
}

typedef $$TaskTableTableCreateCompanionBuilder = TaskTableCompanion Function({
  Value<int?> id,
  required String title,
  required String note,
  required String time,
  required String date,
  required bool isCompleted,
  required bool toRemember,
  Value<String?> toRememberTime,
  Value<String?> toRememberDate,
  required String category,
});
typedef $$TaskTableTableUpdateCompanionBuilder = TaskTableCompanion Function({
  Value<int?> id,
  Value<String> title,
  Value<String> note,
  Value<String> time,
  Value<String> date,
  Value<bool> isCompleted,
  Value<bool> toRemember,
  Value<String?> toRememberTime,
  Value<String?> toRememberDate,
  Value<String> category,
});

class $$TaskTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get toRemember => $state.composableBuilder(
      column: $state.table.toRemember,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get toRememberTime => $state.composableBuilder(
      column: $state.table.toRememberTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get toRememberDate => $state.composableBuilder(
      column: $state.table.toRememberDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get toRemember => $state.composableBuilder(
      column: $state.table.toRemember,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get toRememberTime => $state.composableBuilder(
      column: $state.table.toRememberTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get toRememberDate => $state.composableBuilder(
      column: $state.table.toRememberDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TaskTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskTableTable,
    Task,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableCreateCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TaskTableTable, Task>),
    Task,
    PrefetchHooks Function()> {
  $$TaskTableTableTableManager(_$AppDatabase db, $TaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaskTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TaskTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<String> time = const Value.absent(),
            Value<String> date = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<bool> toRemember = const Value.absent(),
            Value<String?> toRememberTime = const Value.absent(),
            Value<String?> toRememberDate = const Value.absent(),
            Value<String> category = const Value.absent(),
          }) =>
              TaskTableCompanion(
            id: id,
            title: title,
            note: note,
            time: time,
            date: date,
            isCompleted: isCompleted,
            toRemember: toRemember,
            toRememberTime: toRememberTime,
            toRememberDate: toRememberDate,
            category: category,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String title,
            required String note,
            required String time,
            required String date,
            required bool isCompleted,
            required bool toRemember,
            Value<String?> toRememberTime = const Value.absent(),
            Value<String?> toRememberDate = const Value.absent(),
            required String category,
          }) =>
              TaskTableCompanion.insert(
            id: id,
            title: title,
            note: note,
            time: time,
            date: date,
            isCompleted: isCompleted,
            toRemember: toRemember,
            toRememberTime: toRememberTime,
            toRememberDate: toRememberDate,
            category: category,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskTableTable,
    Task,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableCreateCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TaskTableTable, Task>),
    Task,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
}
