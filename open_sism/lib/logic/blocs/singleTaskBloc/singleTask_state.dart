import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/task/single_task_api_response.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';

abstract class SingleTaskState extends Equatable {
  const SingleTaskState();

  @override
  List<Object> get props => [];
}

class SingleTaskInitial extends SingleTaskState {}

class SingleTaskLoadInProgress extends SingleTaskState {}

class SingleTaskLoadedSuccess extends SingleTaskState {
  final SingleTaskApiResponse taskData;
  final TaskBundle recipeBundles;
  const SingleTaskLoadedSuccess(
      {@required this.taskData, @required this.recipeBundles})
      : assert(taskData != null);

  @override
  List<Object> get props => [taskData];
}

class SingleTaskLoadFailure extends SingleTaskState {
  final SingleTaskApiResponse taskStoredData;
  SingleTaskLoadFailure({@required this.taskStoredData});
}

class SingleTaskNoMessageSuccess extends SingleTaskState {
  final String message;
  SingleTaskNoMessageSuccess({@required this.message});
}
//
// class HomeNoInternet extends HomeState {}
