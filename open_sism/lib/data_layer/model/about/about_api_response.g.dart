// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutApiResponse _$AboutApiResponseFromJson(Map<String, dynamic> json) {
  return AboutApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : AboutContent.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AboutApiResponseToJson(AboutApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
