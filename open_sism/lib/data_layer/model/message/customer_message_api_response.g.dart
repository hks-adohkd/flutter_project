// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_message_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerMessageApiResponse _$CustomerMessageApiResponseFromJson(
    Map<String, dynamic> json) {
  return CustomerMessageApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : CustomerMessagePaginationModel.fromJson(
            json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerMessageApiResponseToJson(
        CustomerMessageApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
