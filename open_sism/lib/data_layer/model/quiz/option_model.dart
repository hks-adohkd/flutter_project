import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option_model.g.dart';

@JsonSerializable()
class OptionModel extends Equatable {
  final String script;
  final int questionId;
  final int itemOrder;
  final bool isRightOption;
  OptionModel(
      {this.script, this.itemOrder, this.isRightOption, this.questionId});

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionModelToJson(this);

  @override
  List<Object> get props => [script, questionId, itemOrder, isRightOption];
}
