// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_message_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerMessagePaginationModel _$CustomerMessagePaginationModelFromJson(
    Map<String, dynamic> json) {
  return CustomerMessagePaginationModel(
    content: (json['content'] as List)
        ?.map((e) => e == null
            ? null
            : CustomerMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pagination: json['pagination'] == null
        ? null
        : PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerMessagePaginationModelToJson(
        CustomerMessagePaginationModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination?.toJson(),
      'content': instance.content?.map((e) => e?.toJson())?.toList(),
    };
