import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/data_layer/Repositories/task_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/task/single_task_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'singleTask.dart';

import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/task/taskPage_model.dart';

class SingleTaskBloc extends Bloc<SingleTaskEvent, SingleTaskState> {
  final TaskRepository taskRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  TaskModel taskModel;
  SingleTaskApiResponse taskPageModel;
  TaskBundle recipeBundles;
  SingleTaskBloc(
      {@required this.taskRepository,
      @required this.internetCubit,
      @required this.userRepository})
      : assert(taskRepository != null && internetCubit != null),
        super(SingleTaskInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is SingleTaskInitial)) {
        this.add(SingleTaskDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  int calculateTaskHour(SingleTaskApiResponse taskData) {
    DateTime startDate = taskData.content.startDate;
    DateTime endDate = taskData.content.endDate;
    return endDate.day - startDate.day;
  }

  Color getTaskColor(SingleTaskApiResponse taskData) {
    String _name = taskData.content.taskType.name;
    if (_name == "Subscribe a Youtube Channel") {
      return kYoutubeCardColor;
    } else if (_name == "whatch ad") {
      return kWatchVideoCardColor;
    } else
      return kQuestionnaireCardColor;
  }

  IconData getTaskIcon(SingleTaskApiResponse taskData) {
    String _name = taskData.content.taskType.name;
    if (_name == "Subscribe a Youtube Channel") {
      return FontAwesomeIcons.youtube;
    } else if (_name == "whatch ad") {
      return FontAwesomeIcons.video;
    } else
      return FontAwesomeIcons.question;
  }

  String getStartDate(SingleTaskApiResponse taskData) {
    String year = taskData.content.startDate.year.toString();
    String month = taskData.content.startDate.month.toString();
    String day = taskData.content.startDate.day.toString();

    return year + " : " + month + " : " + day;
  }

  String getEndDate(SingleTaskApiResponse taskData) {
    String year = taskData.content.endDate.year.toString();
    String month = taskData.content.endDate.month.toString();
    String day = taskData.content.endDate.day.toString();
    return year + " : " + month + " : " + day;
  }

  @override
  Stream<SingleTaskState> mapEventToState(SingleTaskEvent event) async* {
    if (event is SingleTaskDataRequested) {
      yield SingleTaskLoadInProgress();

      try {
        taskPageModel = await taskRepository.getSingleTask(
            token: await userRepository.getToken(), taskId: event.taskId);
        if (taskPageModel.message == "success") {
          recipeBundles = TaskBundle(
            id: taskPageModel.content.id,
            description: taskPageModel.content.description,
            imageSrc: taskPageModel.content.imageUrl,
            person: taskPageModel.content.limit,
            title: taskPageModel.content.displayName,
            color: getTaskColor(taskPageModel),
            icon: getTaskIcon(taskPageModel),
            points: taskPageModel.content.points,
            hours: calculateTaskHour(taskPageModel),
            startDate: getStartDate(taskPageModel),
            endDate: getEndDate(taskPageModel),
            isDone: taskPageModel.content.isDone,
            isForAll: taskPageModel.content.isForAll,
            isReachLimit: taskPageModel.content.isReachLimit,
            link: taskPageModel.content.link,
            packageName: taskPageModel.content.packageName,
            pageId: taskPageModel.content.pageId,
            stared: taskPageModel.content.stared,
            taskType: taskPageModel.content.taskType,
            videoDuration: taskPageModel.content.videoDuration,
            videoId: taskPageModel.content.videoId,
          );

          yield SingleTaskLoadedSuccess(
              taskData: taskPageModel, recipeBundles: recipeBundles);
        } else {
          yield SingleTaskNoMessageSuccess(message: taskPageModel.message);
        }
      } catch (Exception) {
        yield SingleTaskLoadFailure(taskStoredData: taskPageModel);
      }
    }
  }
}
