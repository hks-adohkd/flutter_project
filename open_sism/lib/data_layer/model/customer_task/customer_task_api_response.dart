import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/customer_task/customer_task_model.dart';

part 'customer_task_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerTaskApiResponse extends Equatable {
  int code;
  String message;

  CustomerTaskModel content;

  CustomerModel currentCustomer;

  CustomerTaskApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory CustomerTaskApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerTaskApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerTaskApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
