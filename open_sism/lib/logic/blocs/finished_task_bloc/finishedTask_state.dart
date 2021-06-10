import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/task/task_api_response.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/components/build_finished_task.dart';

abstract class FinishedTaskState extends Equatable {
  const FinishedTaskState();

  @override
  List<Object> get props => [];
}

class FinishedTaskInitial extends FinishedTaskState {}

class FinishedTaskLoadInProgress extends FinishedTaskState {}

class FinishedTaskLoadedSuccess extends FinishedTaskState {
  final TaskApiResponse taskData;
  final List<FinishedTaskList> finishedTaskList;
  const FinishedTaskLoadedSuccess(
      {@required this.taskData, @required this.finishedTaskList})
      : assert(taskData != null);

  @override
  List<Object> get props => [taskData];
}

class FinishedTaskLoadFailure extends FinishedTaskState {
  final TaskApiResponse taskStoredData;
  FinishedTaskLoadFailure({@required this.taskStoredData});
}
//
// class HomeNoInternet extends HomeState {}
