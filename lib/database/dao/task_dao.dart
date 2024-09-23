import 'package:drift/drift.dart';
import 'package:river_pod/database/database.dart';
import 'package:river_pod/database/tables/task.dart';
import 'package:river_pod/initialized.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  Stream<List<Task>> getAllTask(bool isCompleted, String? date) {
    return (select(appDataBase.taskTable)
          ..where((tbl) {
            if (date != null) {
              return tbl.isCompleted.equals(isCompleted) &
                  tbl.date.equals(date);
            }
            return tbl.isCompleted.equals(isCompleted);
          }))
        .watch();
  }
}
