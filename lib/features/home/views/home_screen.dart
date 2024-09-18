import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/enum.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/features/home/views/widgets/display_list_of_tasks.dart';
import 'package:river_pod/core/widgets/display_white_text.dart';
import 'package:river_pod/models/task/task.dart';
import 'package:river_pod/resource/constant.dart';
import 'package:river_pod/routes/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: deviceSize.height * 0.29,
                  width: deviceSize.width,
                  color: colors.primary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const DisplayWhiteText(
                        text: "Aug 7, 2023",
                        textSize: 20,
                      ),
                      5.height,
                      const DisplayWhiteText(
                        text: "My Todo List",
                        fontWeight: FontWeight.bold,
                        textSize: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: deviceSize.height * 0.19,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DisplayListOfTasks(
                      tasks: [
                        TaskModel(
                          id: 1,
                          title: "Title",
                          note: "is note data",
                          time: "10:12",
                          date: "Aug 09",
                          isCompleted: false,
                          category: TaskCategories.others,
                        ),
                        TaskModel(
                          id: 1,
                          title: "Second Title",
                          note: "is note data",
                          time: "11:02",
                          date: "Aug 09",
                          isCompleted: false,
                          category: TaskCategories.work,
                        ),
                      ],
                    ),
                    12.height,
                    Text(
                      "Completed",
                      style: context.textTheme.headlineMedium,
                    ),
                    12.height,
                    const DisplayListOfTasks(
                      tasks: [
                        TaskModel(
                          id: 1,
                          title: "Title",
                          note: "is note data",
                          time: "10:12",
                          date: "Aug 09",
                          isCompleted: true,
                          category: TaskCategories.others,
                        ),
                        TaskModel(
                          id: 1,
                          title: "Second Title",
                          note: "is note data",
                          time: "11:02",
                          date: "Aug 09",
                          isCompleted: true,
                          category: TaskCategories.work,
                        ),
                      ],
                      isCompleted: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () => context.router.push(const CreateTaskRoute()),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: DisplayWhiteText(text: createTaskScreenTitle),
          ),
        ),
      ),
    );
  }
}
