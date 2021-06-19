import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/data_layer/Repositories/task_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/quiz/option_model.dart';
import 'package:open_sism/data_layer/model/quiz/quiz_api_response.dart';
import 'package:open_sism/data_layer/model/customer_task/customer_task_api_response.dart';

import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/quiz/component/Questions.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'quiz.dart';

import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/task/taskPage_model.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final TaskRepository taskRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  TaskModel taskModel;
  QuizApiResponse quizPageModel;
  List<Question> questionData;
  List<Options> optionsData;
  List<OptionModel> optionsModel;
  QuizBloc(
      {@required this.taskRepository,
      @required this.internetCubit,
      @required this.userRepository})
      : assert(taskRepository != null && internetCubit != null),
        super(QuizInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is QuizInitial)) {
        this.add(QuizDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  int getAnswerIndex(List<OptionModel> optionsData) {
    int index = 0;

    for (var item in optionsData) {
      index = optionsData.indexOf(item);
      if (item.isRightOption) {
        break;
      }
    }
    return index;
  }

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is QuizDataRequested) {
      yield QuizLoadInProgress();
      print("Quiz Requested");
      try {
        quizPageModel = await taskRepository.getQuizPage(
            token: await userRepository.getToken(), taskId: event.taskId);
        if (quizPageModel.message == "success") {
          questionData = quizPageModel.content.content
              .map(
                (item) => Question(
                  id: quizPageModel.content
                      .content[quizPageModel.content.content.indexOf(item)].id,
                  question: quizPageModel
                      .content
                      .content[quizPageModel.content.content.indexOf(item)]
                      .script,
                  answer: getAnswerIndex(quizPageModel
                      .content
                      .content[quizPageModel.content.content.indexOf(item)]
                      .quizOptions),
                  options: quizPageModel
                      .content
                      .content[quizPageModel.content.content.indexOf(item)]
                      .quizOptions
                      .map((item) => Options(
                          question: item.script,
                          id: item.questionId,
                          isRightOption: item.isRightOption,
                          itemOrder: item.itemOrder))
                      .toList(),
                ),
              )
              .toList();
          print("questionData");
          print(questionData.first.question);
          print(questionData.first.answer);
          print(questionData.first.options.first.question);

          // recipeBundles = TaskBundle(
          //     id: taskPageModel.content.id,
          //     description: taskPageModel.content.description,
          //     imageSrc: taskPageModel.content.imageUrl,
          //     person: taskPageModel.content.limit,
          //     title: taskPageModel.content.displayName,
          //     color: getTaskColor(taskPageModel),
          //     icon: getTaskIcon(taskPageModel),
          //     points: taskPageModel.content.points,
          //     hours: calculateTaskHour(taskPageModel),
          //     startDate: getStartDate(taskPageModel),
          //     endDate: getEndDate(taskPageModel),
          //     isDone: taskPageModel.content.isDone,
          //     isForAll: taskPageModel.content.isForAll,
          //     isReachLimit: taskPageModel.content.isReachLimit,
          //     link: taskPageModel.content.link,
          //     packageName: taskPageModel.content.packageName,
          //     pageId: taskPageModel.content.pageId,
          //     stared: taskPageModel.content.stared,
          //     taskType: taskPageModel.content.taskType,
          //     videoDuration: taskPageModel.content.videoDuration,
          //     videoId: taskPageModel.content.videoId,
          //     tutorailLink: taskPageModel.content.tutorialLink);

          yield QuizLoadedSuccess(
            quizData: quizPageModel,
            questionData: questionData,
            userQuizIndex: 0, //quizPageModel.quizIndexes.index);
          );
        } else {
          yield QuizMessageNotSuccess(message: quizPageModel.message);
        }
      } catch (Exception) {
        print(Exception.toString());
        yield QuizLoadFailure(quizStoredData: quizPageModel);
      }
    }
    if (event is QuizStableEvent) {
      yield QuizStableState(
        quizData: quizPageModel,
        questionData: questionData,
        userQuizIndex: 1, //quizPageModel.quizIndexes.index);
      );
    }
    if (event is QuizCheckAnswer) {
      if (event.answerIndex == event.userAnswerIndex) {
        yield QuizCheckAnswerSuccessful();
      } else {
        yield QuizCheckAnswerFailed();
      }
    }
  }
}
