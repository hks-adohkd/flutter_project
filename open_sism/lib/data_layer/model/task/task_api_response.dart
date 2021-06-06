import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/home/home_content.dart';
import 'package:open_sism/data_layer/model/pagination/task_pagination_model.dart';
import 'package:open_sism/data_layer/model/task/taskPage_model.dart';

part 'task_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskApiResponse extends Equatable {
  int code;
  String message;

  TaskPaginationModel content;

  CustomerModel currentCustomer;

  TaskApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory TaskApiResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
