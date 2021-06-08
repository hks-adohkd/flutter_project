// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactUS_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUS _$ContactUSFromJson(Map<String, dynamic> json) {
  return ContactUS(
    id: json['id'] as int,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
    firstName: json['firstName'] as String,
    message: json['message'] as String,
    customerId: json['customerId'] as int,
    featuredReplay: json['featuredReplay'] as String,
    featuredSubject: json['featuredSubject'] as String,
    isFeatured: json['isFeatured'] as bool,
    isViewed: json['isViewed'] as bool,
    lastName: json['lastName'] as String,
    replay: json['replay'] as String,
    subject: json['subject'] as String,
  );
}

Map<String, dynamic> _$ContactUSToJson(ContactUS instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'subject': instance.subject,
      'message': instance.message,
      'featuredSubject': instance.featuredSubject,
      'replay': instance.replay,
      'featuredReplay': instance.featuredReplay,
      'isFeatured': instance.isFeatured,
      'isViewed': instance.isViewed,
      'customerId': instance.customerId,
    };
