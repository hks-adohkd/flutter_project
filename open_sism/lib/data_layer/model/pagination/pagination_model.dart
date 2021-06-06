import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable()
class PaginationModel extends Equatable {
  int totalCount;
  int limit;
  int totalPages;
  int currentPage;

  PaginationModel(
      {this.currentPage, this.limit, this.totalCount, this.totalPages});

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);

  @override
  List<Object> get props => [currentPage, limit, totalCount, totalPages];
}
