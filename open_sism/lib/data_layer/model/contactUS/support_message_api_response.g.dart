// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_message_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportMessageApiResponse _$SupportMessageApiResponseFromJson(
    Map<String, dynamic> json) {
  return SupportMessageApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : ContactUS.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SupportMessageApiResponseToJson(
        SupportMessageApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
