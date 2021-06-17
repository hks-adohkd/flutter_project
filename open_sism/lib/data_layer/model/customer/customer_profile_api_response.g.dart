// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_profile_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerProfileApiResponse _$CustomerProfileApiResponseFromJson(
    Map<String, dynamic> json) {
  return CustomerProfileApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : CustomerModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerProfileApiResponseToJson(
        CustomerProfileApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
