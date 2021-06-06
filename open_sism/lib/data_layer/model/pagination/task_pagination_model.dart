import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/pagination/pagination_model.dart';

part 'task_pagination_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskPaginationModel extends Equatable {
  PaginationModel pagination;
  List<TaskModel> content;
  TaskPaginationModel({this.content, this.pagination});

  factory TaskPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$TaskPaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskPaginationModelToJson(this);

  @override
  List<Object> get props => [pagination, content];
}
