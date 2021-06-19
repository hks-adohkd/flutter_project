import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/quiz/option_model.dart';
part 'quiz_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizModel extends Equatable {
  final List<OptionModel> quizOptions;
  final String script;
  final String description;
  final bool type;
  final int itemOrder;
  final int appTaskId;
  final bool isLast;
  final bool isAllRight;
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  QuizModel({
    this.quizOptions,
    this.itemOrder,
    this.script,
    this.appTaskId,
    this.type,
    this.description,
    this.id,
    this.isDeleted,
    this.modified,
    this.created,
    this.isAllRight,
    this.isLast,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizModelToJson(this);

  @override
  List<Object> get props => [
        quizOptions,
        itemOrder,
        script,
        appTaskId,
        type,
        description,
        id,
        isLast,
        isDeleted,
        modified,
        created,
        isAllRight,
      ];
}
