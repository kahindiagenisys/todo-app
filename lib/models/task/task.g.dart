// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      note: json['note'] as String?,
      time: json['time'] as String,
      date: json['date'] as String,
      isCompleted: json['isCompleted'] as bool,
      category: $enumDecode(_$TaskCategoriesEnumMap, json['category']),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'note': instance.note,
      'time': instance.time,
      'date': instance.date,
      'isCompleted': instance.isCompleted,
      'category': _$TaskCategoriesEnumMap[instance.category]!,
    };

const _$TaskCategoriesEnumMap = {
  TaskCategories.education: 'education',
  TaskCategories.health: 'health',
  TaskCategories.home: 'home',
  TaskCategories.others: 'others',
  TaskCategories.personal: 'personal',
  TaskCategories.shopping: 'shopping',
  TaskCategories.social: 'social',
  TaskCategories.travel: 'travel',
  TaskCategories.work: 'work',
};
