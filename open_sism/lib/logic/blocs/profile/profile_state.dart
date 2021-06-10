import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadInProgress extends ProfileState {}

class ProfileLoadedSuccess extends ProfileState {
  final CustomerProfileApiResponse profileData;

  const ProfileLoadedSuccess({@required this.profileData})
      : assert(profileData != null);

  @override
  List<Object> get props => [profileData];
}

class ProfileLoadFailure extends ProfileState {
  final CustomerProfileApiResponse profileData;
  ProfileLoadFailure({@required this.profileData});
}
//
// class HomeNoInternet extends HomeState {}
