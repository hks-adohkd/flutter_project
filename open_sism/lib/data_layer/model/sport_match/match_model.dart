import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/sport_match/customer_prediction.dart';
part 'match_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchModel extends Equatable {
  // Base Entity Model
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  final String firstTeamName;
  final String secondTeamName;
  final String firstTeamFlag;
  final String secondTeamFlag;
  final String type;
  final String league;
  final int appTaskId;
  final DateTime matchTime;
  final int firstTeamScore;
  final int secondTeamScore;
  final TaskModel appTask;
  final CustomerPredictionModel customerPrediction;
  MatchModel(
      {this.id,
      this.created,
      this.modified,
      this.isDeleted,
      this.firstTeamName,
      this.secondTeamName,
      this.firstTeamFlag,
      this.secondTeamFlag,
      this.type,
      this.appTask,
      this.appTaskId,
      this.firstTeamScore,
      this.league,
      this.matchTime,
      this.secondTeamScore,
      this.customerPrediction});

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchModelToJson(this);

  @override
  List<Object> get props => [
        id,
        created,
        modified,
        isDeleted,
        firstTeamName,
        secondTeamName,
        firstTeamFlag,
        secondTeamFlag,
        type,
        appTask,
        appTaskId,
        firstTeamScore,
        league,
        matchTime,
        secondTeamScore,
        customerPrediction
      ];
}
