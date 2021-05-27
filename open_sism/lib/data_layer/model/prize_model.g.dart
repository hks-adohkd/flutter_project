// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prize_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrizeModel _$PrizeModelFromJson(Map<String, dynamic> json) {
  return PrizeModel(
    displayName: json['displayName'] as String,
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    dailyBonusId: json['dailyBonusId'] as int,
    description: json['description'] as String,
    isValid: json['isValid'] as bool,
    itemOrder: json['itemOrder'] as int,
    luckyWheelId: json['luckyWheelId'] as int,
    points: json['points'] as int,
    prizeTypeModel: json['prizeTypeModel'] == null
        ? null
        : PrizeTypeModel.fromJson(
            json['prizeTypeModel'] as Map<String, dynamic>),
    prizeTypeId: json['prizeTypeId'] as int,
    value: json['value'] as int,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    id: json['id'] as int,
    isDeleted: json['isDeleted'] as bool,
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
  );
}

Map<String, dynamic> _$PrizeModelToJson(PrizeModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'displayName': instance.displayName,
      'description': instance.description,
      'points': instance.points,
      'value': instance.value,
      'prizeTypeId': instance.prizeTypeId,
      'dailyBonusId': instance.dailyBonusId,
      'luckyWheelId': instance.luckyWheelId,
      'isValid': instance.isValid,
      'itemOrder': instance.itemOrder,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'prizeTypeModel': instance.prizeTypeModel?.toJson(),
    };
