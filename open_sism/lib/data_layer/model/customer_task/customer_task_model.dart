import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/sport_match/match_model.dart';
part 'customer_task_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerTaskModel extends Equatable {
  // Base Entity Model
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  final int appTaskId;
  final int customerId;
  final bool isDone;
  final DateTime doneDate;
  final DateTime startDate;
  final String shareCode;
  final int earnedPoints;
  final String description;
  final TaskModel appTask;
  final MatchModel sportMatch;

  CustomerTaskModel({
    this.id,
    this.created,
    this.modified,
    this.isDeleted,
    this.appTaskId,
    this.customerId,
    this.isDone,
    this.doneDate,
    this.startDate,
    this.shareCode,
    this.earnedPoints,
    this.description,
    this.appTask,
    this.sportMatch,
  });

  factory CustomerTaskModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerTaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerTaskModelToJson(this);

  @override
  List<Object> get props => [
        id,
        created,
        modified,
        isDeleted,
        appTaskId,
        customerId,
        isDone,
        doneDate,
        startDate,
        shareCode,
        earnedPoints,
        description,
        appTask,
        sportMatch,
      ];
}
