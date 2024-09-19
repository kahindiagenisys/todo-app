import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/database/database.dart';
import 'package:river_pod/features/create_task/view_models/category_view_model.dart';
import 'package:river_pod/features/create_task/view_models/date_view_model.dart';
import 'package:river_pod/features/create_task/view_models/time_view_model.dart';
import 'package:river_pod/repository/task/repository.dart';
import 'package:river_pod/resource/utils.dart';

final taskProvider = StateProvider((ref) {
  return TaskViewModel(ref);
});

class TaskViewModel extends StateNotifier<List<Task>> {
  TaskViewModel(this.ref, [List<Task>? tasks]) : super(tasks ?? []);

  final Ref ref;
  final taskInterFace = TaskRepository();

  void initTaskData(List<Task> updatedTasks) {
    state = updatedTasks;
  }

  Future<void> addTask(
      {required String title,
      required String note,
      required Function() onSuccess}) async {
    try {
      final task = Task(
        title: title,
        time: timeToStringConvert(ref.read(timeProvider)),
        date: dateToStringConvert(ref.read(dateProvider)),
        category: ref.read(categoryViewModel).name,
        note: note,
        isCompleted: false,
      );

      await taskInterFace.onCreate(task);
      onSuccess();
    } catch (e) {
      log(e.toString());
      toast(e.toString());
    }
  }

  void toggleCompletedStatus(bool updatedStatus, int taskId) {
    try {
      Task isTask = state.firstWhere(
        (element) => element.id == taskId,
      );
      Task updatedTask = isTask.copyWith(
        isCompleted: updatedStatus,
      );
      log("Task is :: $updatedTask");
      taskInterFace.onUpdateTask(updatedTask);
    } catch (e) {
      log(e.toString());
      toast(e.toString());
    }
  }

  Stream<List<Task>> getTaskByIsCompleted(bool isCompleted) {
    return taskInterFace.getAllTaskData(isCompleted);
  }


  void deleteTask(int taskId){
    taskInterFace.onDeleteTask(taskId);
  }

}
