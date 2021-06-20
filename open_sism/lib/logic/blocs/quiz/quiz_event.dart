import 'package:flutter/cupertino.dart';

abstract class QuizEvent {
  const QuizEvent();
}

//class TaskPageRequested extends QuizEvent {}

class QuizDataRequested extends QuizEvent {
  final int taskId;
  QuizDataRequested({@required this.taskId});
}

class QuizCheckAnswer extends QuizEvent {
  final int answerIndex;
  final int userAnswerIndex;

  QuizCheckAnswer({@required this.answerIndex, @required this.userAnswerIndex});
}

class QuizNextQuestion extends QuizEvent {
  QuizNextQuestion();
}

class QuizStableEvent extends QuizEvent {
  QuizStableEvent();
}

class QuizCompleteEvent extends QuizEvent {
  QuizCompleteEvent();
}

//
// class QuizAddEnd extends QuizEvent {
//   final String ApptaskId;
//   final int index;
//   final String secondTeamScore;
//
//   MatchAddEnd(
//       {@required this.firstTeamScore,
//       @required this.matchId,
//       @required this.secondTeamScore});
// }
//
// class QuizPause extends QuizEvent {
//   final String matchId;
//   final String firstTeamScore;
//   final String secondTeamScore;
//
//   MatchAddEnd(
//       {@required this.firstTeamScore,
//       @required this.matchId,
//       @required this.secondTeamScore});
// }
