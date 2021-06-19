import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/quiz/quiz_model.dart';
import 'package:open_sism/data_layer/model/pagination/pagination_model.dart';

part 'quiz_page_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizPaginationModel extends Equatable {
  PaginationModel pagination;
  List<QuizModel> content;

  QuizPaginationModel({this.content, this.pagination});

  factory QuizPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$QuizPaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizPaginationModelToJson(this);

  @override
  List<Object> get props => [pagination, content];
}
