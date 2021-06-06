import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/task/task_api_response.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}
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

class TaskLoadInProgress extends TaskState {}

class TaskLoadedSuccess extends TaskState {
  final TaskApiResponse taskData;

  const TaskLoadedSuccess({@required this.taskData}) : assert(taskData != null);

  @override
  List<Object> get props => [taskData];
}

class TaskLoadFailure extends TaskState {
  final TaskApiResponse taskStoredData;
  TaskLoadFailure({@required this.taskStoredData});
}
//
// class HomeNoInternet extends HomeState {}
