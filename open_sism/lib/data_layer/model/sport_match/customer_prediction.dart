import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';

part 'customer_prediction.g.dart';

@JsonSerializable()
class CustomerPredictionModel extends Equatable {
  // Base Entity Model
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  final int customerId;
  final int sportMatchId;
  final int firstTeamScore;
  final int secondTeamScore;

  CustomerPredictionModel({
    this.id,
    this.created,
    this.modified,
    this.isDeleted,
    this.customerId,
    this.sportMatchId,
    this.firstTeamScore,
    this.secondTeamScore,
  });

  factory CustomerPredictionModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPredictionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerPredictionModelToJson(this);

  @override
  List<Object> get props => [
        id,
        created,
        modified,
        isDeleted,
        customerId,
        sportMatchId,
        firstTeamScore,
        secondTeamScore,
      ];
}
