// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskApiResponse _$TaskApiResponseFromJson(Map<String, dynamic> json) {
  return TaskApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : TaskPaginationModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TaskApiResponseToJson(TaskApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
