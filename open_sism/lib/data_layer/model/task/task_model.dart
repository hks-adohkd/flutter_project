import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/task/taskType_model.dart';

part 'task_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskModel extends Equatable {
  String imageUrl;
  String displayName;
  String description;
  bool isDone;
  bool isReachLimit;
  String link;
  DateTime startDate;
  DateTime endDate;
  int points;
  int limit;
  bool stared;
  int taskTypeId;
  String packageName;
  String pageId;
  String videoId;
  int videoDuration;
  bool isForAll;
  TaskTypeModel taskType;

  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  TaskModel(
      {this.stared,
      this.startDate,
      this.taskType,
      this.taskTypeId,
      this.videoDuration,
      this.videoId,
      this.displayName,
      this.endDate,
      this.imageUrl,
      this.isDone,
      this.description,
      this.isForAll,
      this.limit,
      this.isReachLimit,
      this.points,
      this.link,
      this.packageName,
      this.pageId,
      this.created,
      this.id,
      this.isDeleted,
      this.modified});

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  @override
  List<Object> get props => [
        stared,
        displayName,
        imageUrl,
        startDate,
        description,
        taskType,
        points,
        id,
        created,
        modified,
        isDeleted,
        taskTypeId,
        videoDuration,
        videoId,
        endDate,
        isDone,
        isForAll,
        limit,
        isReachLimit,
        link,
        packageName,
        pageId,
      ];
}
