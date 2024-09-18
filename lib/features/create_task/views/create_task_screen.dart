import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/widgets/common_text_field.dart';
import 'package:river_pod/core/widgets/display_white_text.dart';
import 'package:river_pod/features/create_task/views/widgets/select_category.dart';
import 'package:river_pod/features/create_task/views/widgets/select_date_time.dart';
import 'package:river_pod/resource/constant.dart';

@RoutePage()
class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const CommonTextField(
                title: "Task Title",
                hintText: "Task Title",
              ),
              16.height,
              const SelectCategory(),
              16.height,
              const SelectDateTime(),
              16.height,
              const CommonTextField(
                title: "Note",
                hintText: "Task note",
                maxLine: 5,
              ),
              50.height,
              ElevatedButton(
                onPressed: () {},
                child: const DisplayWhiteText(text: "Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
