import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/about/about_model.dart';

part 'about_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AboutApiResponse extends Equatable {
  int code;
  String message;

  AboutContent content;

  CustomerModel currentCustomer;

  AboutApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory AboutApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AboutApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AboutApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
