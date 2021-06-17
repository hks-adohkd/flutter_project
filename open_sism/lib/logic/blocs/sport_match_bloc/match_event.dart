import 'package:flutter/cupertino.dart';

abstract class MatchEvent {
  const MatchEvent();
}

class MatchPageRequested extends MatchEvent {}

class MatchDataRequested extends MatchEvent {
  final String taskId;
  MatchDataRequested({@required this.taskId});
}

class MatchAddEnd extends MatchEvent {
  final String matchId;
  final String firstTeamScore;
  final String secondTeamScore;

  MatchAddEnd(
      {@required this.firstTeamScore,
      @required this.matchId,
      @required this.secondTeamScore});
}
