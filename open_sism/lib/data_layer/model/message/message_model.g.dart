// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    title: json['title'] as String,
    script: json['script'] as String,
    groupId: json['groupId'] as int,
    isForAll: json['isForAll'] as bool,
    group: json['group'] == null
        ? null
        : GroupModel.fromJson(json['group'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'title': instance.title,
      'script': instance.script,
      'groupId': instance.groupId,
      'isForAll': instance.isForAll,
      'group': instance.group?.toJson(),
    };
