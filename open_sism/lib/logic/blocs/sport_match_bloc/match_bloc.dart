import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/data_layer/Repositories/task_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/customer_task/customer_task_api_response.dart';
import 'package:open_sism/data_layer/model/sport_match/match_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'Match.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final TaskRepository taskRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  MatchApiResponse matchModel;
  CustomerTaskApiResponse customerTask;
  MatchBloc(
      {@required this.taskRepository,
      @required this.internetCubit,
      @required this.userRepository})
      : assert(taskRepository != null && internetCubit != null),
        super(MatchInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is MatchInitial)) {
        // this.add(MatchDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  // int calculateTaskHour(MatchApiResponse taskData) {
  //   DateTime startDate = taskData.content.startDate;
  //   DateTime endDate = taskData.content.endDate;
  //   return endDate.day - startDate.day;
  // }

  // Color getTaskColor(MatchApiResponse taskData) {
  //   String _name = taskData.content.taskType.name;
  //   if (_name == "Subscribe a Youtube Channel") {
  //     return kYoutubeCardColor;
  //   } else if (_name == "whatch ad") {
  //     return kWatchVideoCardColor;
  //   } else
  //     return kQuestionnaireCardColor;
  // }

  // IconData getTaskIcon(MatchApiResponse taskData) {
  //   String _name = taskData.content.taskType.name;
  //   if (_name == "Subscribe a Youtube Channel") {
  //     return FontAwesomeIcons.youtube;
  //   } else if (_name == "whatch ad") {
  //     return FontAwesomeIcons.video;
  //   } else
  //     return FontAwesomeIcons.question;
  // }

  // String getStartDate(MatchApiResponse taskData) {
  //   String year = taskData.content.startDate.year.toString();
  //   String month = taskData.content.startDate.month.toString();
  //   String day = taskData.content.startDate.day.toString();
  //
  //   return year + " : " + month + " : " + day;
  // }

  // String getEndDate(MatchApiResponse taskData) {
  //   String year = taskData.content.endDate.year.toString();
  //   String month = taskData.content.endDate.month.toString();
  //   String day = taskData.content.endDate.day.toString();
  //   return year + " : " + month + " : " + day;
  // }

  @override
  Stream<MatchState> mapEventToState(MatchEvent event) async* {
    if (event is MatchDataRequested) {
      yield MatchLoadInProgress();

      try {
        matchModel = await taskRepository.getMatch(
            token: await userRepository.getToken(), taskId: event.taskId);
        if (matchModel.message == "success") {
          yield MatchLoadedSuccess(matchData: matchModel);
        } else {
          yield MatchMessageNotSuccess(message: matchModel.message);
        }
      } catch (Exception) {
        yield MatchLoadFailure(matchStoredData: matchModel);
      }
    }

    if (event is MatchAddEnd) {
      yield MatchAddEndState();
      if (event.secondTeamScore.isEmpty || event.firstTeamScore.isEmpty) {
        yield MatchNotValidFormState();
      } else {
        try {
          customerTask = await taskRepository.addMatchEnd(
              token: await userRepository.getToken(),
              matchId: event.matchId,
              firstTeamScore: event.firstTeamScore,
              secondTeamScore: event.secondTeamScore);
          print(customerTask);
          if (customerTask.message == "success") {
            yield MatchEndSuccess(customerTask: customerTask);
          } else {
            yield MatchEndMessageNotSuccess(message: customerTask.message);
          }
        } catch (Exception) {
          yield MatchEndLoadFailure(taskData: customerTask);
        }
      }
    }
  }
}
