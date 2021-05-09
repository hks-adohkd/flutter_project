import 'package:open_sism/data_layer/api/base_entity_model.dart';
import 'package:open_sism/data_layer/model/city_model.dart';

class CustomerModel extends BaseEntityModel{
  String firstName;
  String lastName;
  String imageUrl;
  bool termsAndConditions;
  bool gender; //! why gender is a boolean from the api !!!
  int currentPoints;
  int totalPoints;
  DateTime luckyWheelLastSpinDate;
  DateTime dailyBonusLastUseDate;
  int dailyBonusLevel;
  int cityId;
  String userId;
  bool lockOutEnabled;
  int groupId;
  String fcmToken;
  String token;
  DateTime tokenExpiration;
  String facebookFirstName;
  String facebookLastName;
  String facebookEmail;
  String facebookId;
  String facebookAccessToken;
  int nextGroupPoints;
  String shareCode;
  String installedFrom;
  Group group;
  CityModel city;
  CustomerModel user;
}

class Group extends BaseEntityModel{
  String name;
  String displayName;
  int itemOrder;
  String color;
  int points;
  String imageUrl;
}