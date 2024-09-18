import 'package:river_pod/database/database.dart';

abstract class InterFace {
  Future<void> onCreate(Task task);

  Future<void> onDeleteTask(int taskId);

  Future<void> onUpdateTask(Task updatedTask);

  Stream<List<Task>> getAllTaskData();
}
