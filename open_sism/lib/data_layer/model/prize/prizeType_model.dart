import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prizeType_model.g.dart';

@JsonSerializable()
class PrizeTypeModel extends Equatable {
  String name;
  String displayName;
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;
  PrizeTypeModel(
      {this.displayName,
      this.name,
      this.modified,
      this.isDeleted,
      this.id,
      this.created});

  factory PrizeTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PrizeTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrizeTypeModelToJson(this);

  @override
  List<Object> get props =>
      [name, displayName, id, created, modified, isDeleted];
}
