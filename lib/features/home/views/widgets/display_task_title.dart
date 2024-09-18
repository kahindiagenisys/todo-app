import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/core/widgets/circle_container.dart';
import 'package:river_pod/models/task/task.dart';

class DisplayTaskTitle extends StatelessWidget {
  const DisplayTaskTitle({
    super.key,
    required this.task,
    this.onCompleted,
  });

  final TaskModel task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final appStyle = context.appTextTheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Icon(
              task.category.icon,
              color: task.category.color.withOpacity(iconOpacity),
            ),
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: appStyle.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontSize: 20,
                    fontWeight: fontWeight,
                  ),
                ),
                Text(
                  task.time,
                  style: appStyle.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: onCompleted,
          )
        ],
      ),
    );
  }
}