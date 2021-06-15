import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';

part 'customer_profile_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerProfileApiResponse extends Equatable {
  int code;
  String message;

  CustomerModel content;

  CustomerModel currentCustomer;

  CustomerProfileApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory CustomerProfileApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerProfileApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerProfileApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
