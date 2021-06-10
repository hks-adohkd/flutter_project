import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_prize_model.dart';
import 'package:open_sism/data_layer/model/home/home_content.dart';
import 'package:open_sism/data_layer/model/pagination/customer_prize_pagination_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';

part 'customer_request_prize_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerRequestPrizeApiResponse extends Equatable {
  int code;
  String message;

  CustomerPrizePaginationModel content;

  CustomerModel currentCustomer;

  CustomerRequestPrizeApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory CustomerRequestPrizeApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerRequestPrizeApiResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomerRequestPrizeApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
