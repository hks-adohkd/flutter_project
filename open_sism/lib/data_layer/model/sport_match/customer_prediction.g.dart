// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPredictionModel _$CustomerPredictionModelFromJson(
    Map<String, dynamic> json) {
  return CustomerPredictionModel(
    id: json['id'] as int,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    customerId: json['customerId'] as int,
    sportMatchId: json['sportMatchId'] as int,
    firstTeamScore: json['firstTeamScore'] as int,
    secondTeamScore: json['secondTeamScore'] as int,
  );
}

Map<String, dynamic> _$CustomerPredictionModelToJson(
        CustomerPredictionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'customerId': instance.customerId,
      'sportMatchId': instance.sportMatchId,
      'firstTeamScore': instance.firstTeamScore,
      'secondTeamScore': instance.secondTeamScore,
    };
