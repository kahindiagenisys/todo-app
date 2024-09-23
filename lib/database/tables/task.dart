import 'package:drift/drift.dart';

@DataClassName("Task")
class TaskTable extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get note => text()();

  TextColumn get time => text()();

  TextColumn get date => text()();

  BoolColumn get isCompleted => boolean()();

  BoolColumn get toRemember => boolean()();

  TextColumn get toRememberTime => text().nullable()();

  TextColumn get toRememberDate => text().nullable()();

  TextColumn get category => text()();

  @override
  String get tableName => "tasks";
}
