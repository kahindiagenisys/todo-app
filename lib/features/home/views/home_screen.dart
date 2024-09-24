import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/extensions/build_context_extensions.dart';
import 'package:river_pod/database/database.dart';
import 'package:river_pod/features/drawer/views/drawer_items.dart';
import 'package:river_pod/features/filter/view_model/selected_date.dart';
import 'package:river_pod/features/filter/views/filters_widget.dart';
import 'package:river_pod/features/home/views/widgets/display_list_of_tasks.dart';
import 'package:river_pod/core/widgets/display_white_text.dart';
import 'package:river_pod/resource/constant.dart';
import 'package:river_pod/resource/utils.dart';
import 'package:river_pod/routes/app_router.gr.dart';
import 'package:river_pod/services/notification/local_notification.dart';
import 'package:river_pod/state/global_task_state.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    log("Build Home Screen!");
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        drawer: const AppDrawer(),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: deviceSize.height * 0.29,
                  width: deviceSize.width,
                  color: colors.primary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      5.height,
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                scaffoldState.currentState?.openDrawer();
                              },
                            ),
                            const FiltersWidget()
                          ],
                        ),
                      ),
                      5.height,
                      Consumer(
                        builder: (context, ref, child) {
                          String selectedDate = ref.watch(selectedDateProvider);
                          return InkWell(
                            onTap: () => selectDate(
                              context,
                              stringToDateConvert(selectedDate),
                              onPickDate: (pickDate) {
                                ref.read(selectedDateProvider.notifier).state =
                                    dateToStringConvert(pickDate);
                              },
                            ),
                            child: DisplayWhiteText(
                              text: selectedDate,
                              textSize: 20,
                            ),
                          );
                        },
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
                    Consumer(
                      builder: (context, ref, child) {
                        return StreamBuilder(
                          stream: ref
                              .read(taskProvider)
                              .getTaskByIsCompleted(false, null),
                          builder: (context, snapshot) {
                            List<Task> taskData = <Task>[];
                            if (snapshot.hasData &&
                                snapshot.data != null &&
                                snapshot.data!.isNotEmpty) {
                              taskData = snapshot.data!;
                              ref.read(taskProvider).initTaskData(taskData);
                            }

                            for (Task task in taskData) {
                              if (task.toRemember) {
                                showNotification(task);
                              }
                            }

                            return DisplayListOfTasks(
                              tasks: taskData,
                            );
                          },
                        );
                      },
                    ),
                    12.height,
                    Text(
                      "Completed",
                      style: context.textTheme.headlineMedium,
                    ),
                    12.height,
                    Consumer(
                      builder: (context, ref, child) {
                        final selectedDate = ref.watch(selectedDateProvider);
                        return StreamBuilder(
                          stream: ref
                              .read(taskProvider)
                              .getTaskByIsCompleted(true, selectedDate),
                          builder: (context, snapshot) {
                            List<Task> taskData = <Task>[];
                            if (snapshot.hasData &&
                                snapshot.data != null &&
                                snapshot.data!.isNotEmpty) {
                              taskData = snapshot.data!;
                            }

                            return DisplayListOfTasks(
                              tasks: taskData,
                              isCompleted: true,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () => context.router.push(CreateTaskRoute()),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: DisplayWhiteText(text: createTaskScreenTitle),
          ),
        ),
      ),
    );
  }

  void showNotification(Task task) {
    DateTime showNotificationDateTime =
        stringToDateTimeConvert(task.toRememberDate!, task.toRememberTime!);
    if (DateTime.now().isAfter(showNotificationDateTime)) {
      return;
    }
     log("Notification show call!");
    LocalNotificationServices.scheduleNotification(
      task.title,
      task.note,
      showNotificationDateTime,
    );
  }
}
