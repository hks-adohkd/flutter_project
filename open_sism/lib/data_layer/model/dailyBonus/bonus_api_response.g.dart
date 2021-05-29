// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusApiResponse _$BonusApiResponseFromJson(Map<String, dynamic> json) {
  return BonusApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : BonusModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BonusApiResponseToJson(BonusApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
