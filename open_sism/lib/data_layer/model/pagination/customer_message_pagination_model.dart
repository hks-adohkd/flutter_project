import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/message/customer_message_model.dart';
import 'package:open_sism/data_layer/model/pagination/pagination_model.dart';

part 'customer_message_pagination_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerMessagePaginationModel extends Equatable {
  PaginationModel pagination;
  List<CustomerMessage> content;
  CustomerMessagePaginationModel({this.content, this.pagination});

  factory CustomerMessagePaginationModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerMessagePaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerMessagePaginationModelToJson(this);

  @override
  List<Object> get props => [pagination, content];
}
