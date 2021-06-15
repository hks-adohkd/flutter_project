// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) {
  return MatchModel(
    id: json['id'] as int,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    firstTeamName: json['firstTeamName'] as String,
    secondTeamName: json['secondTeamName'] as String,
    firstTeamFlag: json['firstTeamFlag'] as String,
    secondTeamFlag: json['secondTeamFlag'] as String,
    type: json['type'] as String,
    appTask: json['appTask'] == null
        ? null
        : TaskModel.fromJson(json['appTask'] as Map<String, dynamic>),
    appTaskId: json['appTaskId'] as int,
    firstTeamScore: json['firstTeamScore'] as int,
    league: json['league'] as String,
    matchTime: json['matchTime'] == null
        ? null
        : DateTime.parse(json['matchTime'] as String),
    secondTeamScore: json['secondTeamScore'] as int,
    customerPrediction: json['customerPrediction'] == null
        ? null
        : CustomerPredictionModel.fromJson(
            json['customerPrediction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'firstTeamName': instance.firstTeamName,
      'secondTeamName': instance.secondTeamName,
      'firstTeamFlag': instance.firstTeamFlag,
      'secondTeamFlag': instance.secondTeamFlag,
      'type': instance.type,
      'league': instance.league,
      'appTaskId': instance.appTaskId,
      'matchTime': instance.matchTime?.toIso8601String(),
      'firstTeamScore': instance.firstTeamScore,
      'secondTeamScore': instance.secondTeamScore,
      'appTask': instance.appTask?.toJson(),
      'customerPrediction': instance.customerPrediction?.toJson(),
    };
