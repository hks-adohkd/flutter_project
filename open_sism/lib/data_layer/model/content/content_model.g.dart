// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
    id: json['id'] as int,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    name: json['name'] as String,
    title: json['title'] as String,
    script: json['script'] as String,
    imageUrl: json['imageUrl'] as String,
    itemOrder: json['itemOrder'] as int,
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'title': instance.title,
      'script': instance.script,
      'imageUrl': instance.imageUrl,
      'itemOrder': instance.itemOrder,
    };
