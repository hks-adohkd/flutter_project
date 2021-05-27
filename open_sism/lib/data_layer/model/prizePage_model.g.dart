// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prizePage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrizePageModel _$PrizePageModelFromJson(Map<String, dynamic> json) {
  return PrizePageModel(
    prizeModel: (json['prizeModel'] as List)
        ?.map((e) =>
            e == null ? null : PrizeModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PrizePageModelToJson(PrizePageModel instance) =>
    <String, dynamic>{
      'prizeModel': instance.prizeModel?.map((e) => e?.toJson())?.toList(),
    };
