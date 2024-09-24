import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/core/widgets/common_container.dart';
import 'package:river_pod/database/database.dart';
import 'package:river_pod/features/home/views/widgets/display_task_title.dart';
import 'package:river_pod/features/home/views/widgets/task_details.dart';
import 'package:river_pod/resource/constant.dart';
import 'package:river_pod/state/global_task_state.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompleted = false,
  });

  final List<Task> tasks;
  final bool isCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompleted ? deviceSize.height * 0.25 : deviceSize.height * 0.30;
    final emptyTasksMessage = isCompleted ? completedTaskEmpty : taskEmpty;
    final taskLocator = ref.read(taskProvider);
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.appTextTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              itemCount: tasks.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                final task = tasks[index];

                return InkWell(
                  onLongPress: () => onLongPress(taskLocator, task),
                  onTap: () => onTap(ctx, task),
                  child: DisplayTaskTitle(
                    task: task,
                    onCompleted: (value) =>
                        onCompleted(value, taskLocator, task),
                  ),
                );
              },
              separatorBuilder: (context, taskId) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }

  void onLongPress(taskLocator, task) {
    if (isCompleted) {
      return;
    }
    taskLocator.deleteTask(task.id!);
  }

  void onTap(ctx, task) async {
    await showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return TaskDetails(task: task);
      },
    );
  }

  void onCompleted(value, taskLocator, task) {
    if (isCompleted) {
      return;
    }
    taskLocator.toggleCompletedStatus(value!, task.id!);
  }
}
