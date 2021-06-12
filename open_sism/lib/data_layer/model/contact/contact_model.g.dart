// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    id: json['id'] as int,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    name: json['name'] as String,
    displayName: json['displayName'] as String,
    value: json['value'] as String,
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'displayName': instance.displayName,
      'value': instance.value,
      'icon': instance.icon,
    };
