import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:river_pod/core/widgets/common_text_field.dart';
import 'package:river_pod/features/create_task/view_models/date_view_model.dart';
import 'package:river_pod/features/create_task/view_models/time_view_model.dart';
import 'package:river_pod/resource/utils.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            title: "Date",
            hintText: dateToStringConvert(date),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => selectDate(context,  ref.read(dateProvider),onPickDate: (pickDate) {  ref.read(dateProvider.notifier).state = pickDate; }),
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
      ref.read(timeProvider.notifier).state = pickTime;
    }
  }


}
