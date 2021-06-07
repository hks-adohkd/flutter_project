import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_prize_api_response.dart';
import 'package:open_sism/data_layer/model/home/home_api_response.dart';
import 'package:open_sism/data_layer/model/luckyWheel/wheel_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';
import 'package:open_sism/data_layer/model/application_user/time_model.dart';

abstract class WheelState extends Equatable {
  const WheelState();

  @override
  List<Object> get props => [];
}

class WheelInitial extends WheelState {}

class WheelLoadInProgress extends WheelState {}

class WheelLoadedSuccess extends WheelState {
  final WheelApiResponse wheelData;

  const WheelLoadedSuccess({@required this.wheelData})
      : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelDataReady extends WheelState {
  final WheelApiResponse wheelData;
  final bool isAllowed;
  final String nextSpin;
  const WheelDataReady(
      {@required this.wheelData, this.isAllowed, this.nextSpin})
      : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelAddPrize extends WheelState {
  final WheelApiResponse wheelData;

  const WheelAddPrize({@required this.wheelData}) : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelAddSuccess extends WheelState {
  final CustomerPrizeApiResponse wheelPrize;
  final TimeModel dateNow;
  const WheelAddSuccess({@required this.wheelPrize, this.dateNow});

  @override
  List<Object> get props => [wheelPrize, dateNow];
}

class WheelLoadFailure extends WheelState {
  final WheelApiResponse wheelStoredData;
  WheelLoadFailure({@required this.wheelStoredData});
}
//
// class HomeNoInternet extends HomeState {}

class WheelPremiumInitial extends WheelState {}

class WheelPremiumCustomerReady extends WheelState {}

class WheelPremiumCustomerInitial extends WheelState {
  final HomeApiResponse customer;
  WheelPremiumCustomerInitial({@required this.customer});
}

class WheelPremiumLoadInProgress extends WheelState {}

class WheelPremiumLoadedSuccess extends WheelState {
  final WheelApiResponse wheelData;
  final bool isPremium;
  const WheelPremiumLoadedSuccess(
      {@required this.wheelData, @required this.isPremium})
      : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelPremiumDataReady extends WheelState {
  final WheelApiResponse wheelData;
  final bool isPremium;
  final String nextSpin;
  final bool isAllowed;
  const WheelPremiumDataReady(
      {@required this.wheelData,
      @required this.isPremium,
      this.isAllowed,
      this.nextSpin})
      : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelPremiumAddPrize extends WheelState {
  final WheelApiResponse wheelData;

  const WheelPremiumAddPrize({@required this.wheelData})
      : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelPremiumAddSuccess extends WheelState {
  final CustomerPrizeApiResponse wheelPrize;
  final TimeModel dateNow;
  const WheelPremiumAddSuccess({@required this.wheelPrize, this.dateNow});

  @override
  List<Object> get props => [wheelPrize];
}

class WheelPremiumLoadFailure extends WheelState {
  final WheelApiResponse wheelStoredData;
  WheelPremiumLoadFailure({@required this.wheelStoredData});
}
