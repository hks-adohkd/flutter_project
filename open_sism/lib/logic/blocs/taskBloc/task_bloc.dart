import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/data_layer/Repositories/task_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/application_user/time_model.dart';
import 'package:open_sism/data_layer/model/task/task_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
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
  List<TaskBundle> recipeBundles;
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
        TimeModel timeNow = await userRepository.getTime();
        taskPageModel = await taskRepository.getTaskPage(
            token: await userRepository.getToken());

        recipeBundles = taskPageModel.content.content
            .map(
              (item) => TaskBundle(
                id: taskPageModel.content
                    .content[taskPageModel.content.content.indexOf(item)].id,
                description: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .description,
                imageSrc: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .imageUrl,
                person: taskPageModel.content
                    .content[taskPageModel.content.content.indexOf(item)].limit,
                title: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .displayName,
                color: getTaskColor(
                    taskPageModel, taskPageModel.content.content.indexOf(item)),
                icon: getTaskIcon(
                    taskPageModel, taskPageModel.content.content.indexOf(item)),
                points: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .points,
                hours: calculateTaskHour(taskPageModel,
                    taskPageModel.content.content.indexOf(item), timeNow),
                startDate: getStartDate(
                    taskPageModel, taskPageModel.content.content.indexOf(item)),
                endDate: getEndDate(
                    taskPageModel, taskPageModel.content.content.indexOf(item)),
                isDone: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .isDone,
                isForAll: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .isForAll,
                isReachLimit: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .isReachLimit,
                link: taskPageModel.content
                    .content[taskPageModel.content.content.indexOf(item)].link,
                tutorailLink: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .tutorialLink,
                packageName: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .packageName,
                pageId: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .pageId,
                stared: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .stared,
                taskType: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .taskType,
                videoDuration: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .videoDuration,
                videoId: taskPageModel
                    .content
                    .content[taskPageModel.content.content.indexOf(item)]
                    .videoId,
              ),
            )
            .toList();

        yield TaskLoadedSuccess(
            taskData: taskPageModel, recipeBundles: recipeBundles);
      } catch (Exception) {
        yield TaskLoadFailure(taskStoredData: taskPageModel);
      }
    }
  }

  String calculateTaskHour(
      TaskApiResponse taskData, int index, TimeModel timeNow) {
    // DateTime startDate = taskData.content.content[index].startDate;
    //TimeModel timeNow = await userRepository.getTime();
    DateTime endDate = taskData.content.content[index].endDate;
    int mS = endDate.millisecondsSinceEpoch -
        timeNow.dateTimeNow.millisecondsSinceEpoch;
    int days = (mS ~/ (1000 * 60 * 60 * 24));
    int hour = (mS ~/ (1000 * 60 * 60) % 24);
    String time = '$days day:$hour h';
    return time;
  }

  Color getTaskColor(TaskApiResponse taskData, int index) {
    String _name = taskData.content.content[index].taskType.name;
    if (_name == "Subscribe a Youtube Channel") {
      return kYoutubeCardColor;
    } else if (_name == "watch_ad") {
      return kWatchVideoCardColor;
    } else
      return kQuestionnaireCardColor;
  }

  IconData getTaskIcon(TaskApiResponse taskData, int index) {
    String _name = taskData.content.content[index].taskType.name;
    if (_name == "Subscribe a Youtube Channel") {
      return FontAwesomeIcons.youtube;
    } else if (_name == "watch_ad") {
      return FontAwesomeIcons.video;
    } else
      return FontAwesomeIcons.question;
  }

  String getStartDate(TaskApiResponse taskData, int index) {
    String year = taskData.content.content[index].startDate.year.toString();
    String month = taskData.content.content[index].startDate.month.toString();
    String day = taskData.content.content[index].startDate.day.toString();

    return year + " : " + month + " : " + day;
  }

  String getEndDate(TaskApiResponse taskData, int index) {
    String year = taskData.content.content[index].endDate.year.toString();
    String month = taskData.content.content[index].endDate.month.toString();
    String day = taskData.content.content[index].endDate.day.toString();
    return year + " : " + month + " : " + day;
  }
}
