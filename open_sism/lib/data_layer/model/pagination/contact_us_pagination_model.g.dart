// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUSPaginationModel _$ContactUSPaginationModelFromJson(
    Map<String, dynamic> json) {
  return ContactUSPaginationModel(
    content: (json['content'] as List)
        ?.map((e) =>
            e == null ? null : ContactUS.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pagination: json['pagination'] == null
        ? null
        : PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContactUSPaginationModelToJson(
        ContactUSPaginationModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination?.toJson(),
      'content': instance.content?.map((e) => e?.toJson())?.toList(),
    };
