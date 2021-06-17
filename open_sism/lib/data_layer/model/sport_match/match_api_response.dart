import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/sport_match/match_model.dart';

part 'match_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchApiResponse extends Equatable {
  int code;
  String message;

  MatchModel content;

  CustomerModel currentCustomer;

  MatchApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory MatchApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
