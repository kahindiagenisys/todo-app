import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/resource/utils.dart';

final selectedDateProvider = StateProvider<String>((ref) {
  return dateToStringConvert(DateTime.now());
});
