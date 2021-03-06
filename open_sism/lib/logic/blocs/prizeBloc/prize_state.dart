import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/prize/prize_api_response.dart';

abstract class PrizeState extends Equatable {
  const PrizeState();

  @override
  List<Object> get props => [];
}

class PrizeInitial extends PrizeState {}
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

class PrizeLoadInProgress extends PrizeState {}

class PrizeLoadedSuccess extends PrizeState {
  final PrizeApiResponse prizeData;

  const PrizeLoadedSuccess({@required this.prizeData})
      : assert(prizeData != null);

  @override
  List<Object> get props => [prizeData];
}

class PrizeLoadFailure extends PrizeState {
  final PrizeApiResponse prizeStoredData;
  PrizeLoadFailure({@required this.prizeStoredData});
}

//
// class HomeNoInternet extends HomeState {}
