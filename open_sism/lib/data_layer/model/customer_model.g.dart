// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return CustomerModel(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    imageUrl: json['imageUrl'] as String,
    termsAndConditions: json['termsAndConditions'] as bool,
    gender: json['gender'] as bool,
    currentPoints: json['currentPoints'] as int,
    totalPoints: json['totalPoints'] as int,
    luckyWheelLastSpinDate: json['luckyWheelLastSpinDate'] == null
        ? null
        : DateTime.parse(json['luckyWheelLastSpinDate'] as String),
    dailyBonusLastUseDate: json['dailyBonusLastUseDate'] == null
        ? null
        : DateTime.parse(json['dailyBonusLastUseDate'] as String),
    dailyBonusLevel: json['dailyBonusLevel'] as int,
    cityId: json['cityId'] as int,
    userId: json['userId'] as String,
    lockOutEnabled: json['lockOutEnabled'] as bool,
    groupId: json['groupId'] as int,
    fcmToken: json['fcmToken'] as String,
    token: json['token'] as String,
    tokenExpiration: json['tokenExpiration'] == null
        ? null
        : DateTime.parse(json['tokenExpiration'] as String),
    facebookFirstName: json['facebookFirstName'] as String,
    facebookLastName: json['facebookLastName'] as String,
    facebookEmail: json['facebookEmail'] as String,
    facebookId: json['facebookId'] as String,
    facebookAccessToken: json['facebookAccessToken'] as String,
    nextGroupPoints: json['nextGroupPoints'] as int,
    shareCode: json['shareCode'] as String,
    installedFrom: json['installedFrom'] as String,
    group: json['group'] == null
        ? null
        : GroupModel.fromJson(json['group'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : ApplicationUserModel.fromJson(json['user'] as Map<String, dynamic>),
    city: json['city'] == null
        ? null
        : CityModel.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'imageUrl': instance.imageUrl,
      'termsAndConditions': instance.termsAndConditions,
      'gender': instance.gender,
      'currentPoints': instance.currentPoints,
      'totalPoints': instance.totalPoints,
      'luckyWheelLastSpinDate':
          instance.luckyWheelLastSpinDate?.toIso8601String(),
      'dailyBonusLastUseDate':
          instance.dailyBonusLastUseDate?.toIso8601String(),
      'dailyBonusLevel': instance.dailyBonusLevel,
      'cityId': instance.cityId,
      'userId': instance.userId,
      'lockOutEnabled': instance.lockOutEnabled,
      'groupId': instance.groupId,
      'fcmToken': instance.fcmToken,
      'token': instance.token,
      'tokenExpiration': instance.tokenExpiration?.toIso8601String(),
      'facebookFirstName': instance.facebookFirstName,
      'facebookLastName': instance.facebookLastName,
      'facebookEmail': instance.facebookEmail,
      'facebookId': instance.facebookId,
      'facebookAccessToken': instance.facebookAccessToken,
      'nextGroupPoints': instance.nextGroupPoints,
      'shareCode': instance.shareCode,
      'installedFrom': instance.installedFrom,
      'group': instance.group?.toJson(),
      'user': instance.user?.toJson(),
      'city': instance.city?.toJson(),
    };
