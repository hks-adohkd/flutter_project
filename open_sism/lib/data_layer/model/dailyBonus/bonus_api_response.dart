import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/dailyBonus/bonus_model.dart';

part 'bonus_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BonusApiResponse extends Equatable {
  int code;
  String message;

  BonusModel content;

  CustomerModel currentCustomer;

  BonusApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory BonusApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BonusApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BonusApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
