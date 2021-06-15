import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/application_user/application_user_model.dart';

part 'application_user_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ApplicationUserApiResponse extends Equatable {
  int code;
  String message;

  ApplicationUserModel content;

  CustomerModel currentCustomer;

  ApplicationUserApiResponse(
      {this.code, this.message, this.content, this.currentCustomer});

  factory ApplicationUserApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationUserApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationUserApiResponseToJson(this);

  @override
  List<Object> get props => [code, message, content, currentCustomer];
}
