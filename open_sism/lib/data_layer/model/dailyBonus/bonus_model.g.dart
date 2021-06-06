// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusModel _$BonusModelFromJson(Map<String, dynamic> json) {
  return BonusModel(
    isDoneToday: json['isDoneToday'] as bool,
    partsCount: json['partsCount'] as int,
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
    isPremium: json['isPremium'] as bool,
  )..isDoneYesterday = json['isDoneYesterday'] as bool;
}

Map<String, dynamic> _$BonusModelToJson(BonusModel instance) =>
    <String, dynamic>{
      'partsCount': instance.partsCount,
      'isDoneToday': instance.isDoneToday,
      'isDoneYesterday': instance.isDoneYesterday,
      'id': instance.id,
      'isPremium': instance.isPremium,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'prizes': instance.prizes?.map((e) => e?.toJson())?.toList(),
    };
