import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer_model.dart';
import 'package:open_sism/data_layer/model/home_content.dart';
import 'package:open_sism/data_layer/model/prizePage_model.dart';

part 'prize_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PrizeApiResponse extends Equatable {
  int code;
  String message;

  PrizePageModel content;

  CustomerModel currentCustomer;

  PrizeApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory PrizeApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PrizeApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrizeApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
