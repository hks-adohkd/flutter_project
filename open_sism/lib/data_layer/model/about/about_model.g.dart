// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutContent _$AboutContentFromJson(Map<String, dynamic> json) {
  return AboutContent(
    videos: (json['videos'] as List)
        ?.map((e) =>
            e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    contacts: (json['contacts'] as List)
        ?.map((e) =>
            e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    location: json['location'] == null
        ? null
        : Contact.fromJson(json['location'] as Map<String, dynamic>),
    aboutUs: json['aboutUs'] == null
        ? null
        : Content.fromJson(json['aboutUs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AboutContentToJson(AboutContent instance) =>
    <String, dynamic>{
      'videos': instance.videos?.map((e) => e?.toJson())?.toList(),
      'contacts': instance.contacts?.map((e) => e?.toJson())?.toList(),
      'location': instance.location?.toJson(),
      'aboutUs': instance.aboutUs?.toJson(),
    };
