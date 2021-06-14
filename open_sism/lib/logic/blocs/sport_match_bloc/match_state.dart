import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customer_task/customer_task_api_response.dart';
import 'package:open_sism/data_layer/model/sport_match/match_api_response.dart';

abstract class MatchState extends Equatable {
  const MatchState();

  @override
  List<Object> get props => [];
}

class MatchInitial extends MatchState {}

class MatchLoadInProgress extends MatchState {}

class MatchLoadedSuccess extends MatchState {
  final MatchApiResponse matchData;

  const MatchLoadedSuccess({
    @required this.matchData,
  }) : assert(matchData != null);

  @override
  List<Object> get props => [matchData];
}

class MatchLoadFailure extends MatchState {
  final MatchApiResponse matchStoredData;
  MatchLoadFailure({@required this.matchStoredData});
}

class MatchMessageNotSuccess extends MatchState {
  final String message;
  MatchMessageNotSuccess({@required this.message});
}
//
// class HomeNoInternet extends HomeState {}

class MatchEndSuccess extends MatchState {
  final CustomerTaskApiResponse customerTask;
  MatchEndSuccess({this.customerTask});
}

class MatchAddEndState extends MatchState {}

class MatchEndMessageNotSuccess extends MatchState {
  final String message;
  MatchEndMessageNotSuccess({@required this.message});
}

class MatchEndLoadFailure extends MatchState {
  final CustomerTaskApiResponse taskData;
  MatchEndLoadFailure({@required this.taskData});
}

class MatchNotValidFormState extends MatchState {}
