import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/task_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/task/task_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'task_event.dart';
import 'task_state.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/task/taskPage_model.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  TaskModel taskModel;
  TaskApiResponse taskPageModel;
  TaskBloc(
      {@required this.taskRepository,
      @required this.internetCubit,
      @required this.userRepository})
      : assert(taskRepository != null && internetCubit != null),
        super(TaskInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is TaskInitial)) {
        this.add(TaskDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is TaskPageRequested || event is TaskDataRequested) {
      yield TaskLoadInProgress();

      try {
        taskPageModel = await taskRepository.getTaskPage(
            token: await userRepository.getToken());
        yield TaskLoadedSuccess(taskData: taskPageModel);
      } catch (Exception) {
        yield TaskLoadFailure(taskStoredData: taskPageModel);
      }
    }
  }
}
