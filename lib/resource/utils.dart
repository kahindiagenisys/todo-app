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
