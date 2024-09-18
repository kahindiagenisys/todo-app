import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/core/enum.dart';

final categoryViewModel = StateProvider<TaskCategories>((ref) {
  return TaskCategories.others;
});
