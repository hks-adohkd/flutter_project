import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/group/group_model.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';

part 'wheel_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WheelModel extends Equatable {
  int groupId;
  int partsCount;
  bool isDoneToday;
  final int id;

  final DateTime created;
  final DateTime modified;
  final bool isDeleted;
  GroupModel group;
  final List<PrizeModel> prizes;
  WheelModel(
      {this.group,
      this.isDoneToday,
      this.partsCount,
      this.groupId,
      this.prizes,
      this.created,
      this.id,
      this.isDeleted,
      this.modified});

  factory WheelModel.fromJson(Map<String, dynamic> json) =>
      _$WheelModelFromJson(json);

  Map<String, dynamic> toJson() => _$WheelModelToJson(this);

  @override
  List<Object> get props => [
        isDoneToday,
        partsCount,
        groupId,
        prizes,
        created,
        id,
        isDeleted,
        modified,
        group,
      ];
}
