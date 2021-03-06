import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/prize/prizeType_model.dart';

part 'prize_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PrizeModel extends Equatable {
  String imageUrl;
  String name;
  String displayName;
  String description;
  int points;
  int value;
  int prizeTypeId;
  int dailyBonusId;
  int luckyWheelId;
  bool isValid;
  int itemOrder;
  final int id;
  final DateTime createdAt;
  final DateTime modified;
  final bool isDeleted;
  PrizeTypeModel prizeType;
  PrizeModel(
      {this.displayName,
      this.name,
      this.imageUrl,
      this.dailyBonusId,
      this.description,
      this.isValid,
      this.itemOrder,
      this.luckyWheelId,
      this.points,
      this.prizeType,
      this.prizeTypeId,
      this.value,
      this.createdAt,
      this.id,
      this.isDeleted,
      this.modified});

  factory PrizeModel.fromJson(Map<String, dynamic> json) =>
      _$PrizeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrizeModelToJson(this);

  @override
  List<Object> get props => [
        name,
        displayName,
        imageUrl,
        dailyBonusId,
        description,
        isValid,
        itemOrder,
        luckyWheelId,
        points,
        prizeType,
        prizeTypeId,
        value,
        id,
        createdAt,
        modified,
        isDeleted,
      ];
}
