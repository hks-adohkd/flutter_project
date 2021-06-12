import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';
import 'package:open_sism/data_layer/model/contactUS/support_message_api_response.dart';

abstract class SupportState extends Equatable {
  const SupportState();

  @override
  List<Object> get props => [];
}

class SupportInitial extends SupportState {}

class SupportLoadFailure extends SupportState {
  final SupportMessageApiResponse supportData;
  SupportLoadFailure({@required this.supportData});
}

class SupportAddState extends SupportState {}

class SupportNotValidFormState extends SupportState {}

class SupportSuccessState extends SupportState {
  final SupportMessageApiResponse supportData;
  SupportSuccessState({this.supportData});
}

class SupportErrorState extends SupportState {
  final String error;

  SupportErrorState(this.error);
}

class SupportMessageNotSuccess extends SupportState {
  final String message;

  SupportMessageNotSuccess(this.message);
}

//
// class HomeNoInternet extends HomeState {}
