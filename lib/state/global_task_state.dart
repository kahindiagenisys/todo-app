import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/database/database.dart';
import 'package:river_pod/features/create_task/view_models/category_view_model.dart';
import 'package:river_pod/features/create_task/view_models/date_view_model.dart';
import 'package:river_pod/features/create_task/view_models/remember_view_model.dart';
import 'package:river_pod/features/create_task/view_models/time_view_model.dart';
import 'package:river_pod/repository/task/repository.dart';
import 'package:river_pod/resource/utils.dart';

final taskProvider = StateProvider((ref) {
  return TaskViewModel(ref);
});

class TaskViewModel extends StateNotifier<List<Task>> {
  TaskViewModel(
    this.ref,
  ) : super([]);

  final Ref ref;

  void initTaskData(List<Task> updatedTasks) {
    try {
      state = updatedTasks;
    } catch (r) {
      log("Error is : $r");
    }
  }

  Future<void> addTask(
      {required String title,
      required String note,
      required Function() onSuccess}) async {
    try {
      bool isRemember = ref.read(rememberProvider);
      final time = timeToStringConvert(ref.read(timeProvider));
      final date = dateToStringConvert(ref.read(dateProvider));
      String? toRememberDate;
      String? toRememberTime;
      if (isRemember) {
        toRememberDate = date;
        toRememberTime = time;
      }

      final task = Task(
        title: title,
        time: time,
        date: date,
        category: ref.read(categoryViewModel).name,
        note: note,
        isCompleted: false,
        toRemember: isRemember,
        toRememberDate: toRememberDate,
        toRememberTime: toRememberTime,
      );

      await ref.read(taskRepository).onCreate(task);
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
      ref.read(taskRepository).onUpdateTask(updatedTask);
    } catch (e) {
      log(e.toString());
      toast(e.toString());
    }
  }

  Stream<List<Task>> getTaskByIsCompleted(bool isCompleted, String? date) {
    return ref.read(taskRepository).getAllTaskData(isCompleted, date);
  }

  void deleteTask(int taskId) {
    ref.read(taskRepository).onDeleteTask(taskId);
  }
}
