import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/luckyWheel/wheel_model.dart';

part 'wheel_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class WheelApiResponse extends Equatable {
  int code;
  String message;

  WheelModel content;

  CustomerModel currentCustomer;

  WheelApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory WheelApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WheelApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WheelApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
