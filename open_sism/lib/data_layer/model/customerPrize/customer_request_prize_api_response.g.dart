// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_request_prize_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerRequestPrizeApiResponse _$CustomerRequestPrizeApiResponseFromJson(
    Map<String, dynamic> json) {
  return CustomerRequestPrizeApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : CustomerPrizePaginationModel.fromJson(
            json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerRequestPrizeApiResponseToJson(
        CustomerRequestPrizeApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
