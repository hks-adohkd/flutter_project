// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prizeType_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrizeTypeModel _$PrizeTypeModelFromJson(Map<String, dynamic> json) {
  return PrizeTypeModel(
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
  );
}

Map<String, dynamic> _$PrizeTypeModelToJson(PrizeTypeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
