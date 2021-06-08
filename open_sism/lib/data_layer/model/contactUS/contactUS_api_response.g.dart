// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactUS_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUSApiResponse _$ContactUSApiResponseFromJson(Map<String, dynamic> json) {
  return ContactUSApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : ContactUSPaginationModel.fromJson(
            json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContactUSApiResponseToJson(
        ContactUSApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
