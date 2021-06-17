// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return TaskModel(
    stared: json['stared'] as bool,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    taskType: json['taskType'] == null
        ? null
        : TaskTypeModel.fromJson(json['taskType'] as Map<String, dynamic>),
    taskTypeId: json['taskTypeId'] as int,
    videoDuration: json['videoDuration'] as int,
    videoId: json['videoId'] as String,
    displayName: json['displayName'] as String,
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    imageUrl: json['imageUrl'] as String,
    isDone: json['isDone'] as bool,
    description: json['description'] as String,
    isForAll: json['isForAll'] as bool,
    limit: json['limit'] as int,
    isReachLimit: json['isReachLimit'] as bool,
    points: json['points'] as int,
    link: json['link'] as String,
    packageName: json['packageName'] as String,
    pageId: json['pageId'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    id: json['id'] as int,
    isDeleted: json['isDeleted'] as bool,
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    tutorialLink: json['tutorialLink'] as String,
  );
}

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'displayName': instance.displayName,
      'description': instance.description,
      'isDone': instance.isDone,
      'isReachLimit': instance.isReachLimit,
      'link': instance.link,
      'tutorialLink': instance.tutorialLink,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'points': instance.points,
      'limit': instance.limit,
      'stared': instance.stared,
      'taskTypeId': instance.taskTypeId,
      'packageName': instance.packageName,
      'pageId': instance.pageId,
      'videoId': instance.videoId,
      'videoDuration': instance.videoDuration,
      'isForAll': instance.isForAll,
      'taskType': instance.taskType?.toJson(),
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
