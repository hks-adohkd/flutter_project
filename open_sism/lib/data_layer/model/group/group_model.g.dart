// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) {
  return GroupModel(
    id: json['id'] as int,
    created: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    name: json['name'] as String,
    displayName: json['displayName'] as String,
    itemOrder: json['itemOrder'] as int,
    color: json['color'] as String,
    points: json['points'] as int,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'displayName': instance.displayName,
      'itemOrder': instance.itemOrder,
      'color': instance.color,
      'points': instance.points,
      'imageUrl': instance.imageUrl,
    };
