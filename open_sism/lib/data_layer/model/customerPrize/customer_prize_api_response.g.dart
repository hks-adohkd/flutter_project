// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_prize_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPrizeApiResponse _$CustomerPrizeApiResponseFromJson(
    Map<String, dynamic> json) {
  return CustomerPrizeApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : CustomerPrizeModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerPrizeApiResponseToJson(
        CustomerPrizeApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
