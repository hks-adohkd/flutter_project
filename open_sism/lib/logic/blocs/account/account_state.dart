import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoadInProgress extends AccountState {}

class AccountLoadedSuccess extends AccountState {
  final CustomerProfileApiResponse profileData;

  const AccountLoadedSuccess({@required this.profileData})
      : assert(profileData != null);

  @override
  List<Object> get props => [profileData];
}

class AccountLoadFailure extends AccountState {
  final CustomerProfileApiResponse profileData;
  AccountLoadFailure({@required this.profileData});
}

class AccountUpdateProfilestate extends AccountState {}

class AccountNotValidFormState extends AccountState {}

class AccountUpdateSuccessState extends AccountState {
  final CustomerProfileApiResponse profileData;
  AccountUpdateSuccessState({this.profileData});
}

class AccountUpdateErrorState extends AccountState {
  final String error;

  AccountUpdateErrorState(this.error);
}

class AccountUpdateMessageNotSuccess extends AccountState {
  final String message;

  AccountUpdateMessageNotSuccess(this.message);
}

//
// class HomeNoInternet extends HomeState {}
