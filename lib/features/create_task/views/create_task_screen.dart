import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/widgets/common_text_field.dart';
import 'package:river_pod/core/widgets/display_white_text.dart';
import 'package:river_pod/features/create_task/views/widgets/select_category.dart';
import 'package:river_pod/features/create_task/views/widgets/select_date_time.dart';
import 'package:river_pod/resource/constant.dart';
import 'package:river_pod/state/global_task_state.dart';

@RoutePage()
class CreateTaskScreen extends ConsumerWidget {
  CreateTaskScreen({super.key});

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController noteTextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const DisplayWhiteText(
            text: createTaskScreenTitle,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: "Task Title",
                hintText: "Task Title",
                controller: titleTextController,
              ),
              16.height,
              const SelectCategory(),
              16.height,
              const SelectDateTime(),
              16.height,
              CommonTextField(
                title: "Note",
                hintText: "Task note",
                maxLine: 5,
                controller: noteTextController,
              ),
              50.height,
              ElevatedButton(
                onPressed: () {
                  if (titleTextController.text.trim().isEmpty) {
                    toast("Please enter a title.");
                    return;
                  }
                  ref.read(taskProvider).addTask(
                        title: titleTextController.text,
                        note: noteTextController.text,
                        onSuccess: () => _onSuccess(context),
                      );
                },
                child: const DisplayWhiteText(text: "Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSuccess(BuildContext ctx) {
    if (ctx.mounted) {
      ctx.router.maybePop();
    }
  }
}
