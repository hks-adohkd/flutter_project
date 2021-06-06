// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskPaginationModel _$TaskPaginationModelFromJson(Map<String, dynamic> json) {
  return TaskPaginationModel(
    content: (json['content'] as List)
        ?.map((e) =>
            e == null ? null : TaskModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pagination: json['pagination'] == null
        ? null
        : PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TaskPaginationModelToJson(
        TaskPaginationModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination?.toJson(),
      'content': instance.content?.map((e) => e?.toJson())?.toList(),
    };
