import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateViewModel = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
