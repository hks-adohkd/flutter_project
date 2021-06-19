// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizPaginationModel _$QuizPaginationModelFromJson(Map<String, dynamic> json) {
  return QuizPaginationModel(
    content: (json['content'] as List)
        ?.map((e) =>
            e == null ? null : QuizModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pagination: json['pagination'] == null
        ? null
        : PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuizPaginationModelToJson(
        QuizPaginationModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination?.toJson(),
      'content': instance.content?.map((e) => e?.toJson())?.toList(),
    };
