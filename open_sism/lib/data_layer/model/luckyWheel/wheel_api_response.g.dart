// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheel_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WheelApiResponse _$WheelApiResponseFromJson(Map<String, dynamic> json) {
  return WheelApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : WheelModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WheelApiResponseToJson(WheelApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
