// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_task_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerTaskApiResponse _$CustomerTaskApiResponseFromJson(
    Map<String, dynamic> json) {
  return CustomerTaskApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : CustomerTaskModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerTaskApiResponseToJson(
        CustomerTaskApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
