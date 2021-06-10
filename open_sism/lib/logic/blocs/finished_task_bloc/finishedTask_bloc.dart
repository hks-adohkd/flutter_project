import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/task_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/task/task_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'finishedTask_event.dart';
import 'finishedTask_state.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/task/taskPage_model.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/components/build_finished_task.dart';

class FinishedTaskBloc extends Bloc<FinishedTaskEvent, FinishedTaskState> {
  final TaskRepository taskRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  TaskModel taskModel;
  List<FinishedTaskList> finishedTaskList;
  TaskApiResponse taskPageModel;
  FinishedTaskBloc(
      {@required this.taskRepository,
      @required this.internetCubit,
      @required this.userRepository})
      : assert(taskRepository != null && internetCubit != null),
        super(FinishedTaskInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is FinishedTaskInitial)) {
        this.add(FinishedTaskDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<FinishedTaskState> mapEventToState(FinishedTaskEvent event) async* {
    if (event is FinishedTaskPageRequested ||
        event is FinishedTaskDataRequested) {
      yield FinishedTaskLoadInProgress();

      try {
        taskPageModel = await taskRepository.getCustomerFinishedTask(
            token: await userRepository.getToken());

        finishedTaskList = taskPageModel.content.content
            .map(
              (item) => FinishedTaskList(
                title: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .displayName,
                points: taskPageModel.content
                    .content[taskPageModel.content.content.indexOf(item)].points
                    .toString(),
                endDate: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .endDate
                    .toString(),
                imgURL: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .imageUrl,
              ),
            )
            .toList();
        yield FinishedTaskLoadedSuccess(
            taskData: taskPageModel, finishedTaskList: finishedTaskList);
      } catch (Exception) {
        yield FinishedTaskLoadFailure(taskStoredData: taskPageModel);
      }
    }
  }
}
