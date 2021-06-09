import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_request_prize_api_response.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/components/build_finished_task.dart';
import 'package:open_sism/presentation/screens/activity/order/components/build_oeder.dart';

abstract class RequestedPrizeState extends Equatable {
  const RequestedPrizeState();

  @override
  List<Object> get props => [];
}

class RequestedPrizeInitial extends RequestedPrizeState {}

class RequestedPrizeLoadInProgress extends RequestedPrizeState {}

class RequestedPrizeLoadedSuccess extends RequestedPrizeState {
  final CustomerRequestPrizeApiResponse requestedPrizeData;
  final List<OrderList> orderList;
  const RequestedPrizeLoadedSuccess(
      {@required this.requestedPrizeData, @required this.orderList})
      : assert(requestedPrizeData != null);

  @override
  List<Object> get props => [requestedPrizeData];
}

class RequestedPrizeLoadFailure extends RequestedPrizeState {
  final CustomerRequestPrizeApiResponse requestedPrizeStoredData;
  RequestedPrizeLoadFailure({@required this.requestedPrizeStoredData});
}
//
// class HomeNoInternet extends HomeState {}
