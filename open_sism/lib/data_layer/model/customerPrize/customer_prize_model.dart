import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/prize/prize_status_model.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';

part 'customer_prize_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerPrizeModel extends Equatable {
  int customerId;
  int prizeId;
  final int id;
  DateTime earnDate;
  DateTime requestDate;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;
  PrizeStatusModel prizeStatus;
  final List<PrizeModel> prizes;
  final String description;
  CustomerPrizeModel(
      {this.customerId,
      this.prizeId,
      this.earnDate,
      this.prizeStatus,
      this.requestDate,
      this.prizes,
      this.created,
      this.id,
      this.isDeleted,
      this.modified,
      this.description});

  factory CustomerPrizeModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPrizeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerPrizeModelToJson(this);

  @override
  List<Object> get props => [
        requestDate,
        earnDate,
        customerId,
        prizes,
        created,
        id,
        isDeleted,
        modified,
        prizeStatus,
        prizeId,
        description
      ];
}
