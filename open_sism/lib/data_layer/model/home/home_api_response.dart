import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/home/home_content.dart';

part 'home_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeApiResponse extends Equatable {
  int code;
  String message;

  HomeContent content;

  CustomerModel currentCustomer;

  HomeApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory HomeApiResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
