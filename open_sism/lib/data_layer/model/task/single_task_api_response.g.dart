// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_task_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleTaskApiResponse _$SingleTaskApiResponseFromJson(
    Map<String, dynamic> json) {
  return SingleTaskApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : TaskModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleTaskApiResponseToJson(
        SingleTaskApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
