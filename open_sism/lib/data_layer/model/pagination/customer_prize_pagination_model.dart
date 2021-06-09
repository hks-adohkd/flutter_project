import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_request_prize_model.dart';
import 'package:open_sism/data_layer/model/pagination/pagination_model.dart';

part 'customer_prize_pagination_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerPrizePaginationModel extends Equatable {
  PaginationModel pagination;
  List<CustomerRequestPrizeModel> content;
  CustomerPrizePaginationModel({this.content, this.pagination});

  factory CustomerPrizePaginationModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPrizePaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerPrizePaginationModelToJson(this);

  @override
  List<Object> get props => [pagination, content];
}
