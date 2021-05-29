import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/luckyWheel/wheel_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';

abstract class WheelState extends Equatable {
  const WheelState();

  @override
  List<Object> get props => [];
}

class WheelInitial extends WheelState {}
//
// class HomeInitial extends HomeState {
//   final bool connected;
//
//   HomeInitial({@required this.internetCubit}) {
//     internetStreamSubscription = internetCubit.stream.listen((internetState) {
//       if (internetState is InternetDisconnected) {
//         //this.emit(HomeNoInternet());
//       } else if (internetState is InternetConnected) {
//         //this.add(HomeRequested());
//       } else if (internetState is InternetLoading) {
//         //  this.emit(HomeLoadInProgress());
//       }
//     });
//   }
// }

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

  const WheelDataReady({@required this.wheelData}) : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelLoadFailure extends WheelState {
  final WheelApiResponse wheelStoredData;
  WheelLoadFailure({@required this.wheelStoredData});
}
//
// class HomeNoInternet extends HomeState {}

class WheelPremiumInitial extends WheelState {}

class WheelPremiumLoadInProgress extends WheelState {}

class WheelPremiumLoadedSuccess extends WheelState {
  final WheelApiResponse wheelData;

  const WheelPremiumLoadedSuccess({@required this.wheelData})
      : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelPremiumDataReady extends WheelState {
  final WheelApiResponse wheelData;

  const WheelPremiumDataReady({@required this.wheelData})
      : assert(wheelData != null);

  @override
  List<Object> get props => [wheelData];
}

class WheelPremiumLoadFailure extends WheelState {
  final WheelApiResponse wheelStoredData;
  WheelPremiumLoadFailure({@required this.wheelStoredData});
}
