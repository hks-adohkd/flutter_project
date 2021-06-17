// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_user_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationUserApiResponse _$ApplicationUserApiResponseFromJson(
    Map<String, dynamic> json) {
  return ApplicationUserApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : ApplicationUserModel.fromJson(
            json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApplicationUserApiResponseToJson(
        ApplicationUserApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
