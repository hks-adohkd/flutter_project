import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_prize_api_response.dart';
import 'package:open_sism/data_layer/model/prize/prize_api_response.dart';

abstract class RedeemState extends Equatable {
  const RedeemState();

  @override
  List<Object> get props => [];
}

class RedeemInitial extends RedeemState {}

class RedeemLoadInProgress extends RedeemState {}

class RedeemLoadedSuccess extends RedeemState {
  // final CustomerPrizeApiResponse prizeData;
  //
  // const RedeemLoadedSuccess({@required this.prizeData})
  //     : assert(prizeData != null);
  //
  // @override
  // List<Object> get props => [prizeData];
}

class RedeemLoadFailure extends RedeemState {
  final CustomerPrizeApiResponse prizeStoredData;
  RedeemLoadFailure({@required this.prizeStoredData});
}

class RedeemRequestState extends RedeemState {}

class RedeemCheckPrizeState extends RedeemState {
  final CustomerPrizeApiResponse prizeStoredData;
  RedeemCheckPrizeState({@required this.prizeStoredData});
}

// class RedeemLoadedSuccess extends RedeemState {
//   final PrizeApiResponse prizeData;
//
//   const RedeemLoadedSuccess({@required this.prizeData})
//       : assert(prizeData != null);
//
//   @override
//   List<Object> get props => [prizeData];
// }
