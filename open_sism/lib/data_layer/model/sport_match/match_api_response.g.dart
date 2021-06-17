// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchApiResponse _$MatchApiResponseFromJson(Map<String, dynamic> json) {
  return MatchApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : MatchModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MatchApiResponseToJson(MatchApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
    };
