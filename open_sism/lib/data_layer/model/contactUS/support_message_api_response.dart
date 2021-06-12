import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_model.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/pagination/contact_us_pagination_model.dart';

part 'support_message_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SupportMessageApiResponse extends Equatable {
  int code;
  String message;

  ContactUS content;

  CustomerModel currentCustomer;

  SupportMessageApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory SupportMessageApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SupportMessageApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SupportMessageApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
