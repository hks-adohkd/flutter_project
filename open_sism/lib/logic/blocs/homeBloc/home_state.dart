import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:open_sism/data_layer/model/home/home_api_response.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeBeforeInitial extends HomeState {}
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

class HomeLoadInProgress extends HomeState {}

class HomeLoadedSuccess extends HomeState {
  final HomeApiResponse homeData;
  final bool newMessage;
  final bool newNotification;
  const HomeLoadedSuccess(
      {@required this.homeData, this.newMessage, this.newNotification})
      : assert(homeData != null);

  @override
  List<Object> get props => [homeData];
}

class HomeLoadFailure extends HomeState {
  final HomeApiResponse homeStoredData;
  HomeLoadFailure({@required this.homeStoredData});
}
//
// class HomeNoInternet extends HomeState {}
