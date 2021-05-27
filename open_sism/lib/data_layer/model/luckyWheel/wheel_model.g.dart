// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WheelModel _$WheelModelFromJson(Map<String, dynamic> json) {
  return WheelModel(
    group: json['group'] == null
        ? null
        : GroupModel.fromJson(json['group'] as Map<String, dynamic>),
    isDoneToday: json['isDoneToday'] as bool,
    partsCount: json['partsCount'] as int,
    groupId: json['groupId'] as int,
    prizes: (json['prizes'] as List)
        ?.map((e) =>
            e == null ? null : PrizeModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    id: json['id'] as int,
    isDeleted: json['isDeleted'] as bool,
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
  );
}

Map<String, dynamic> _$WheelModelToJson(WheelModel instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'partsCount': instance.partsCount,
      'isDoneToday': instance.isDoneToday,
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'group': instance.group?.toJson(),
      'prizes': instance.prizes?.map((e) => e?.toJson())?.toList(),
    };
