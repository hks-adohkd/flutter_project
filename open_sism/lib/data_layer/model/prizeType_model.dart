import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'prizeType_model.g.dart';

@JsonSerializable()
class PrizeTypeModel extends Equatable {
  String name;
  String displayName;

  PrizeTypeModel({this.displayName, this.name});

  // factory PrizeModel.fromJson(Map<String, dynamic> json) =>
  //     _$PrizeModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$PrizeModelToJson(this);

  @override
  List<Object> get props => [name, displayName];
}
