import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'total_question_model.g.dart';

@JsonSerializable()
class TotalQuestionModel extends Equatable {
  final int totalQuestions;

  TotalQuestionModel({this.totalQuestions});

  factory TotalQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$TotalQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TotalQuestionModelToJson(this);

  @override
  List<Object> get props => [totalQuestions];
}
