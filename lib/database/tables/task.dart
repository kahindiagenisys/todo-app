import 'package:drift/drift.dart';

@DataClassName("Task")
class TaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get note => text().nullable()();

  TextColumn get time => text()();

  TextColumn get date => text()();

  BoolColumn get isCompleted => boolean()();

  TextColumn get category => text()();

  @override
  String get tableName => "tasks";
}
