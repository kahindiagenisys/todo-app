import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/widgets/common_text_field.dart';
import 'package:river_pod/features/create_task/view_models/date_view_model.dart';
import 'package:river_pod/features/create_task/view_models/time_view_model.dart';
import 'package:river_pod/resource/utils.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateViewModel);
    final time = ref.watch(timeViewModel);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            title: "Date",
            hintText: DateFormat.yMMMd().format(date),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectDate(context, ref),
              icon: const FaIcon(FontAwesomeIcons.calendar),
            ),
          ),
        ),
        10.width,
        Expanded(
          child: CommonTextField(
            title: "Time",
            hintText: timeToStringConvert(time),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context, ref),
              icon: const FaIcon(FontAwesomeIcons.clock),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectTime(BuildContext ctx, WidgetRef ref) async {
    TimeOfDay? pickTime = await showTimePicker(
      context: ctx,
      initialTime: TimeOfDay.now(),
    );

    if (pickTime != null) {
      ref.read(timeViewModel.notifier).state = pickTime;
    }
  }

  Future<void> _selectDate(BuildContext ctx, WidgetRef ref) async {
    int nowYear = DateTime.now().year;

    final initialDate = ref.read(dateViewModel);

    DateTime? pickDate = await showDatePicker(
      context: ctx,
      initialDate: initialDate,
      firstDate: DateTime(nowYear - 1),
      lastDate: DateTime(nowYear + 1),
    );

    if (pickDate != null) {
      ref.read(dateViewModel.notifier).state = pickDate;
    }
  }
}
