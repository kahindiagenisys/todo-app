import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String timeToStringConvert(TimeOfDay time) {
  try {
    final now = DateTime.now();
    final date = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    return DateFormat.jm().format(date);
  } catch (e) {
    return '12:00 pm';
  }
}

String dateToStringConvert(DateTime date) {
  try {
    return DateFormat.yMMMd().format(date);
  } catch (e) {
    return 'Feb, 29';
  }
}

DateTime stringToDateConvert(String date) {
  try {
    return DateFormat("MMM dd, yyyy").parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

Future<void> selectDate(BuildContext ctx, DateTime date,
    {required Function(DateTime pickDate) onPickDate}) async {
  int nowYear = DateTime.now().year;

  final initialDate = date;

  DateTime? pickDate = await showDatePicker(
    context: ctx,
    initialDate: initialDate,
    firstDate: DateTime(nowYear - 1),
    lastDate: DateTime(nowYear + 1),
  );

  if (pickDate != null) {
    onPickDate(pickDate);
  }
}
