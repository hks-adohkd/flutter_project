// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) {
  return OptionModel(
    script: json['script'] as String,
    itemOrder: json['itemOrder'] as int,
    isRightOption: json['isRightOption'] as bool,
    questionId: json['questionId'] as int,
  );
}

Map<String, dynamic> _$OptionModelToJson(OptionModel instance) =>
    <String, dynamic>{
      'script': instance.script,
      'questionId': instance.questionId,
      'itemOrder': instance.itemOrder,
      'isRightOption': instance.isRightOption,
    };
