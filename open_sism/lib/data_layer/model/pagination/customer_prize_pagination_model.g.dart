// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_prize_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPrizePaginationModel _$CustomerPrizePaginationModelFromJson(
    Map<String, dynamic> json) {
  return CustomerPrizePaginationModel(
    content: json['content'] == null
        ? null
        : CustomerPrizeModel.fromJson(json['content'] as Map<String, dynamic>),
    pagination: json['pagination'] == null
        ? null
        : PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerPrizePaginationModelToJson(
        CustomerPrizePaginationModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination?.toJson(),
      'content': instance.content?.toJson(),
    };
