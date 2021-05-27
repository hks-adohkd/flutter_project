// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prize_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrizeApiResponse _$PrizeApiResponseFromJson(Map<String, dynamic> json) {
  return PrizeApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : PrizePageModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrizeApiResponseToJson(PrizeApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
