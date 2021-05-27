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
  final WheelApiResponse wheeleData;

  const WheelLoadedSuccess({@required this.wheeleData})
      : assert(wheeleData != null);

  @override
  List<Object> get props => [wheeleData];
}

class WheelLoadFailure extends WheelState {
  final WheelApiResponse wheelStoredData;
  WheelLoadFailure({@required this.wheelStoredData});
}
//
// class HomeNoInternet extends HomeState {}
