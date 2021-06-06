import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'taskType_model.g.dart';

@JsonSerializable()
class TaskTypeModel extends Equatable {
  String name;
  String displayName;
  String imgUrl;
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;
  TaskTypeModel(
      {this.displayName,
      this.name,
      this.modified,
      this.isDeleted,
      this.id,
      this.created,
      this.imgUrl});

  factory TaskTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TaskTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskTypeModelToJson(this);

  @override
  List<Object> get props =>
      [name, displayName, imgUrl, id, created, modified, isDeleted];
}
