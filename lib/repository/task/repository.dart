import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/database/dao/task_dao.dart';
import 'package:river_pod/database/database.dart';
import 'package:river_pod/initialized.dart';
import 'package:river_pod/repository/task/interface.dart';

final taskRepository = Provider(
  (ref) => TaskRepository(),
);

class TaskRepository implements InterFace {
  @override
  Future<void> onCreate(Task task) async {
    try {
      await appDataBase.into(appDataBase.taskTable).insert(task);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> onDeleteTask(int taskId) async {
    try {
      await (appDataBase.delete(appDataBase.taskTable)
            ..where((tbl) => tbl.id.equals(taskId)))
          .go();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> onUpdateTask(Task updatedTask) async {
    try {
      await appDataBase.update(appDataBase.taskTable).replace(updatedTask);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<Task>> getAllTaskData(bool isCompleted,String? date) {
    try {
      return TaskDao(appDataBase).getAllTask(isCompleted,date);
    } catch (e) {
      rethrow;
    }
  }
}
