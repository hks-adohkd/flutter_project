import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/pagination/contact_us_pagination_model.dart';

part 'contactUS_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ContactUSApiResponse extends Equatable {
  int code;
  String message;

  ContactUSPaginationModel content;

  CustomerModel currentCustomer;

  ContactUSApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory ContactUSApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactUSApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUSApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
