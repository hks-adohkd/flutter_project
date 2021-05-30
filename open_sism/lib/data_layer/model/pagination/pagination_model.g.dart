// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return PaginationModel(
    currentPage: json['currentPage'] as int,
    limit: json['limit'] as int,
    totalCount: json['totalCount'] as int,
    totalPages: json['totalPages'] as int,
  );
}

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
    };
