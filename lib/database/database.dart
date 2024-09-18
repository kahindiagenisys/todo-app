import 'package:drift/drift.dart';
import 'package:river_pod/database/connection/connection.dart';
import 'package:river_pod/database/tables/task.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  TaskTable,
], daos: [])
class AppDatabase extends _$AppDatabase {
  AppDatabase._(super.e);

  factory AppDatabase() => AppDatabase._(DBCreator.createDatabaseConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => destructiveFallback;
}
