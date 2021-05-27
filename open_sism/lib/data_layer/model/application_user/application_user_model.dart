import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_user_model.g.dart';

@JsonSerializable()
class ApplicationUserModel extends Equatable {
  final bool phoneNumberConfirmed;
  final String phoneNumber;
  final bool emailConfirmed;
  final String email;
  final String userName;
  final bool lockoutEnabled;
  final int accessFailedCount;

  ApplicationUserModel(
      {this.phoneNumberConfirmed,
      this.phoneNumber,
      this.emailConfirmed,
      this.email,
      this.userName,
      this.lockoutEnabled,
      this.accessFailedCount});

  factory ApplicationUserModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationUserModelToJson(this);

  @override
  List<Object> get props => [phoneNumber, email, userName];
}
