import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/quiz/index_model.dart';
import 'package:open_sism/data_layer/model/quiz/quiz_page_model.dart';
import 'package:open_sism/data_layer/model/quiz/total_question_model.dart';

part 'quiz_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizApiResponse extends Equatable {
  int code;
  String message;

  QuizPaginationModel content;

  CustomerModel currentCustomer;

  IndexModel quizIndexes;

  int totalQuestions;

  QuizApiResponse(
      {this.code,
      this.message,
      this.content,
      this.currentCustomer,
      this.quizIndexes,
      this.totalQuestions});

  factory QuizApiResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuizApiResponseToJson(this);

  @override
  List<Object> get props =>
      [code, message, content, currentCustomer, quizIndexes, totalQuestions];
}
