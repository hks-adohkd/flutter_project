// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationUserModel _$ApplicationUserModelFromJson(Map<String, dynamic> json) {
  return ApplicationUserModel(
    phoneNumberConfirmed: json['phoneNumberConfirmed'] as bool,
    phoneNumber: json['phoneNumber'] as String,
    emailConfirmed: json['emailConfirmed'] as bool,
    email: json['email'] as String,
    userName: json['userName'] as String,
    lockoutEnabled: json['lockoutEnabled'] as bool,
    accessFailedCount: json['accessFailedCount'] as int,
  );
}

Map<String, dynamic> _$ApplicationUserModelToJson(
        ApplicationUserModel instance) =>
    <String, dynamic>{
      'phoneNumberConfirmed': instance.phoneNumberConfirmed,
      'phoneNumber': instance.phoneNumber,
      'emailConfirmed': instance.emailConfirmed,
      'email': instance.email,
      'userName': instance.userName,
      'lockoutEnabled': instance.lockoutEnabled,
      'accessFailedCount': instance.accessFailedCount,
    };
