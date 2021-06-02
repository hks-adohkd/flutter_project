import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/home/home_content.dart';

part 'customer_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerApiResponse extends Equatable {
  int code;
  String message;

  HomeContent content;

  CustomerModel currentCustomer;

  CustomerApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory CustomerApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
