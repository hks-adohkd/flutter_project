// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskType_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskTypeModel _$TaskTypeModelFromJson(Map<String, dynamic> json) {
  return TaskTypeModel(
    displayName: json['displayName'] as String,
    name: json['name'] as String,
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    id: json['id'] as int,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    imgUrl: json['imgUrl'] as String,
  );
}

Map<String, dynamic> _$TaskTypeModelToJson(TaskTypeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'imgUrl': instance.imgUrl,
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
