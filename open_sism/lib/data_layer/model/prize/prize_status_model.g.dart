// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prize_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrizeStatusModel _$PrizeStatusModelFromJson(Map<String, dynamic> json) {
  return PrizeStatusModel(
    displayName: json['displayName'] as String,
    name: json['name'] as String,
    id: json['id'] as int,
    isDeleted: json['isDeleted'] as bool,
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
  );
}

Map<String, dynamic> _$PrizeStatusModelToJson(PrizeStatusModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
