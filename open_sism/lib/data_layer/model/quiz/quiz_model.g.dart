// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  return QuizModel(
    quizOptions: (json['quizOptions'] as List)
        ?.map((e) =>
            e == null ? null : OptionModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    itemOrder: json['itemOrder'] as int,
    script: json['script'] as String,
    appTaskId: json['appTaskId'] as int,
    type: json['type'] as bool,
    description: json['description'] as String,
    id: json['id'] as int,
    isDeleted: json['isDeleted'] as bool,
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    isAllRight: json['isAllRight'] as bool,
    isLast: json['isLast'] as bool,
  );
}

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'quizOptions': instance.quizOptions?.map((e) => e?.toJson())?.toList(),
      'script': instance.script,
      'description': instance.description,
      'type': instance.type,
      'itemOrder': instance.itemOrder,
      'appTaskId': instance.appTaskId,
      'isLast': instance.isLast,
      'isAllRight': instance.isAllRight,
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
