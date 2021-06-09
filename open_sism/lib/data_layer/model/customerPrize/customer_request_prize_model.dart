import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/prize/prize_status_model.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';

part 'customer_request_prize_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerRequestPrizeModel extends Equatable {
  int customerId;
  int prizeId;
  final int id;
  DateTime earnDate;
  DateTime requestDate;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;
  PrizeStatusModel prizeStatus;
  final PrizeModel prize;
  final String description;
  CustomerRequestPrizeModel(
      {this.customerId,
      this.prizeId,
      this.earnDate,
      this.prizeStatus,
      this.requestDate,
      this.prize,
      this.created,
      this.id,
      this.isDeleted,
      this.modified,
      this.description});

  factory CustomerRequestPrizeModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerRequestPrizeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerRequestPrizeModelToJson(this);

  @override
  List<Object> get props => [
        requestDate,
        earnDate,
        customerId,
        prize,
        created,
        id,
        isDeleted,
        modified,
        prizeStatus,
        prizeId,
        description
      ];
}
