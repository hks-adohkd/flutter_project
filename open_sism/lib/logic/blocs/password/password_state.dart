import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';
import 'package:open_sism/data_layer/model/application_user/application_user_api_response.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordLoadFailure extends PasswordState {
  final ApplicationUserApiResponse profileData;
  PasswordLoadFailure({@required this.profileData});
}

class PasswordUpdateState extends PasswordState {}

class PasswordNotValidFormState extends PasswordState {}

class PasswordUpdateSuccessState extends PasswordState {
  final ApplicationUserApiResponse profileData;
  PasswordUpdateSuccessState({this.profileData});
}

class PasswordUpdateErrorState extends PasswordState {
  final String error;

  PasswordUpdateErrorState(this.error);
}

class PasswordUpdateMessageNotSuccess extends PasswordState {
  final String message;

  PasswordUpdateMessageNotSuccess(this.message);
}

//
// class HomeNoInternet extends HomeState {}
