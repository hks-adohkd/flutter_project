import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';

part 'bonus_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BonusModel extends Equatable {
  int partsCount;
  bool isDoneToday;
  bool isDoneYesterday;
  final int id;
  bool isPremium;

  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  final List<PrizeModel> prizes;
  BonusModel(
      {this.isDoneToday,
      this.partsCount,
      this.prizes,
      this.created,
      this.id,
      this.isDeleted,
      this.modified,
      this.isPremium});

  factory BonusModel.fromJson(Map<String, dynamic> json) =>
      _$BonusModelFromJson(json);

  Map<String, dynamic> toJson() => _$BonusModelToJson(this);

  @override
  List<Object> get props => [
        isDoneToday,
        partsCount,
        prizes,
        created,
        id,
        isDeleted,
        modified,
        isPremium,
      ];
}
