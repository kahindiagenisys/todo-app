import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:river_pod/core/enum.dart';

part 'task.freezed.dart';

part 'task.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required int id,
    required String title,
    String? note,
    required String time,
    required String date,
    required bool isCompleted,
    required TaskCategories category,
  }) = _Task;

  factory TaskModel.fromJson(Map<String, Object?> json) => _$TaskModelFromJson(json);
}
