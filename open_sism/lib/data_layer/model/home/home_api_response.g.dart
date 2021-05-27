// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeApiResponse _$HomeApiResponseFromJson(Map<String, dynamic> json) {
  return HomeApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : HomeContent.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeApiResponseToJson(HomeApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
