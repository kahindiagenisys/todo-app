import 'package:flutter/material.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/core/widgets/common_container.dart';
import 'package:river_pod/features/home/views/widgets/display_task_title.dart';
import 'package:river_pod/features/home/views/widgets/task_details.dart';
import 'package:river_pod/models/task/task.dart';
import 'package:river_pod/resource/constant.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompleted = false,
  });

  final List<TaskModel> tasks;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompleted ? deviceSize.height * 0.25 : deviceSize.height * 0.30;
    final emptyTasksMessage = isCompleted ? completedTaskEmpty : taskEmpty;
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
                  onLongPress: () {
                    //TODO:: delete task
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return TaskDetails(task: task);
                      },
                    );
                  },
                  child: DisplayTaskTitle(
                    task: task,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
