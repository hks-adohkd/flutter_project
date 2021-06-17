// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerTaskModel _$CustomerTaskModelFromJson(Map<String, dynamic> json) {
  return CustomerTaskModel(
    id: json['id'] as int,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    appTaskId: json['appTaskId'] as int,
    customerId: json['customerId'] as int,
    isDone: json['isDone'] as bool,
    doneDate: json['doneDate'] == null
        ? null
        : DateTime.parse(json['doneDate'] as String),
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    shareCode: json['shareCode'] as String,
    earnedPoints: json['earnedPoints'] as int,
    description: json['description'] as String,
    appTask: json['appTask'] == null
        ? null
        : TaskModel.fromJson(json['appTask'] as Map<String, dynamic>),
    sportMatch: json['sportMatch'] == null
        ? null
        : MatchModel.fromJson(json['sportMatch'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerTaskModelToJson(CustomerTaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'appTaskId': instance.appTaskId,
      'customerId': instance.customerId,
      'isDone': instance.isDone,
      'doneDate': instance.doneDate?.toIso8601String(),
      'startDate': instance.startDate?.toIso8601String(),
      'shareCode': instance.shareCode,
      'earnedPoints': instance.earnedPoints,
      'description': instance.description,
      'appTask': instance.appTask?.toJson(),
      'sportMatch': instance.sportMatch?.toJson(),
    };
