import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/application_user/application_user_model.dart';
import 'package:open_sism/data_layer/model/city/city_model.dart';
import 'package:open_sism/data_layer/model/group/group_model.dart';

part 'customer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final bool termsAndConditions;
  final bool gender; //! why gender is a boolean from the api !!!
  final int currentPoints;
  final int totalPoints;
  final DateTime luckyWheelLastSpinDate;
  final DateTime dailyBonusLastUseDate;
  final int dailyBonusLevel;
  final int cityId;
  final String userId;
  final bool lockOutEnabled;
  final int groupId;
  final String fcmToken;
  final String token;
  final DateTime tokenExpiration;
  final String facebookFirstName;
  final String facebookLastName;
  final String facebookEmail;
  final String facebookId;
  final String facebookAccessToken;
  final int nextGroupPoints;
  final String shareCode;
  final String installedFrom;
  final GroupModel group;
  final ApplicationUserModel user;
  final CityModel city;
  final bool premium;

  CustomerModel(
      {this.firstName,
      this.lastName,
      this.imageUrl,
      this.termsAndConditions,
      this.gender,
      this.currentPoints,
      this.totalPoints,
      this.luckyWheelLastSpinDate,
      this.dailyBonusLastUseDate,
      this.dailyBonusLevel,
      this.cityId,
      this.userId,
      this.lockOutEnabled,
      this.groupId,
      this.fcmToken,
      this.token,
      this.tokenExpiration,
      this.facebookFirstName,
      this.facebookLastName,
      this.facebookEmail,
      this.facebookId,
      this.facebookAccessToken,
      this.nextGroupPoints,
      this.shareCode,
      this.installedFrom,
      this.group,
      this.user,
      this.city,
      this.premium,
      this.id});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

  @override
  List<Object> get props => [
        firstName,
        lastName,
        cityId,
        userId,
        premium,
        fcmToken,
        gender,
        luckyWheelLastSpinDate,
        dailyBonusLevel,
        dailyBonusLastUseDate,
        token,
        lockOutEnabled
      ];
}
