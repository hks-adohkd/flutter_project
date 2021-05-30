import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/prize/prizeType_model.dart';

part 'prize_status_model.g.dart';

@JsonSerializable()
class PrizeStatusModel extends Equatable {
  String name;
  String displayName;
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  PrizeStatusModel(
      {this.displayName,
      this.name,
      this.id,
      this.isDeleted,
      this.modified,
      this.created});

  factory PrizeStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PrizeStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrizeStatusModelToJson(this);

  @override
  List<Object> get props => [
        name,
        displayName,
        id,
        created,
        modified,
        isDeleted,
      ];
}
