import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/core/widgets/circle_container.dart';
import 'package:river_pod/models/task/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final style = context.appTextTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          16.height,
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            task.time,
            style: style.titleMedium,
          ),
          16.height,
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("task to be completed on ${task.date}"),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          16.height,
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          16.height,
          Text(
            task.note.isEmptyOrNull
                ? 'There is no additional note for this task'
                : task.note!,
          ),
          16.height,
          Visibility(
            visible: task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("task completed"),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
