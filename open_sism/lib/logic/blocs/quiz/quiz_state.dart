import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/quiz/quiz_api_response.dart';
import 'package:open_sism/presentation/screens/quiz/component/Questions.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoadInProgress extends QuizState {}

class QuizLoadedSuccess extends QuizState {
  final QuizApiResponse quizData;
  final List<Question> questionData;
  final int userQuizIndex;
  //final TaskBundle recipeBundles;
  const QuizLoadedSuccess(
      {@required this.quizData,
      @required this.questionData,
      this.userQuizIndex})
      : assert(quizData != null);

  @override
  List<Object> get props => [quizData];
}

class QuizStableState extends QuizState {
  final QuizApiResponse quizData;
  final List<Question> questionData;
  final int userQuizIndex;
  //final TaskBundle recipeBundles;
  const QuizStableState(
      {@required this.quizData,
      @required this.questionData,
      this.userQuizIndex})
      : assert(quizData != null);

  @override
  List<Object> get props => [quizData];
}

class QuizLoadFailure extends QuizState {
  final QuizApiResponse quizStoredData;
  QuizLoadFailure({@required this.quizStoredData});
}

class QuizMessageNotSuccess extends QuizState {
  final String message;
  QuizMessageNotSuccess({@required this.message});
}

class QuizCheckAnswerSuccessful extends QuizState {
  QuizCheckAnswerSuccessful();
}

class QuizCheckAnswerFailed extends QuizState {
  QuizCheckAnswerFailed();
}
//
// class HomeNoInternet extends HomeState {}
