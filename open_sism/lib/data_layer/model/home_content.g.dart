// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeContent _$HomeContentFromJson(Map<String, dynamic> json) {
  return HomeContent(
    slides: (json['slides'] as List)
        ?.map((e) =>
            e == null ? null : Content.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    banner: (json['banner'] as List)
        ?.map((e) =>
            e == null ? null : Content.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    luckyWheelValid: json['luckyWheelValid'] as bool,
    dailyBonusValid: json['dailyBonusValid'] as bool,
    newMessages: json['newMessages'] as int,
  );
}

Map<String, dynamic> _$HomeContentToJson(HomeContent instance) =>
    <String, dynamic>{
      'slides': instance.slides?.map((e) => e?.toJson())?.toList(),
      'banner': instance.banner?.map((e) => e?.toJson())?.toList(),
      'luckyWheelValid': instance.luckyWheelValid,
      'dailyBonusValid': instance.dailyBonusValid,
      'newMessages': instance.newMessages,
    };
