import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';

part 'prizePage_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PrizePageModel extends Equatable {
  final List<PrizeModel> prizes;
  // PrizeModel prizeModel;
  PrizePageModel({this.prizes});

  factory PrizePageModel.fromJson(Map<String, dynamic> json) =>
      _$PrizePageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrizePageModelToJson(this);

  @override
  List<Object> get props => [prizes];
}
