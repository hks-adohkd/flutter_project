import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/pagination/customer_message_pagination_model.dart';

part 'customer_message_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerMessageApiResponse extends Equatable {
  int code;
  String message;

  CustomerMessagePaginationModel content;

  CustomerModel currentCustomer;

  CustomerMessageApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory CustomerMessageApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerMessageApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerMessageApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
