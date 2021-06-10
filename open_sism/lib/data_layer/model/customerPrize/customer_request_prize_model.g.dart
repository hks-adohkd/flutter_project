// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_request_prize_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerRequestPrizeModel _$CustomerRequestPrizeModelFromJson(
    Map<String, dynamic> json) {
  return CustomerRequestPrizeModel(
    customerId: json['customerId'] as int,
    prizeId: json['prizeId'] as int,
    earnDate: json['earnDate'] == null
        ? null
        : DateTime.parse(json['earnDate'] as String),
    prizeStatus: json['prizeStatus'] == null
        ? null
        : PrizeStatusModel.fromJson(
            json['prizeStatus'] as Map<String, dynamic>),
    requestDate: json['requestDate'] == null
        ? null
        : DateTime.parse(json['requestDate'] as String),
    prize: json['prize'] == null
        ? null
        : PrizeModel.fromJson(json['prize'] as Map<String, dynamic>),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    id: json['id'] as int,
    isDeleted: json['isDeleted'] as bool,
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$CustomerRequestPrizeModelToJson(
        CustomerRequestPrizeModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'prizeId': instance.prizeId,
      'id': instance.id,
      'earnDate': instance.earnDate?.toIso8601String(),
      'requestDate': instance.requestDate?.toIso8601String(),
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'prizeStatus': instance.prizeStatus?.toJson(),
      'prize': instance.prize?.toJson(),
      'description': instance.description,
    };
