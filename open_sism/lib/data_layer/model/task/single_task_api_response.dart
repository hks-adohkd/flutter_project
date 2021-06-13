import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';

part 'single_task_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SingleTaskApiResponse extends Equatable {
  int code;
  String message;

  TaskModel content;

  CustomerModel currentCustomer;

  SingleTaskApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory SingleTaskApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleTaskApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleTaskApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
