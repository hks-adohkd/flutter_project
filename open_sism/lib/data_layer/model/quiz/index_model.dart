import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index_model.g.dart';

@JsonSerializable()
class IndexModel extends Equatable {
  final int index;

  IndexModel({this.index});

  factory IndexModel.fromJson(Map<String, dynamic> json) =>
      _$IndexModelFromJson(json);

  Map<String, dynamic> toJson() => _$IndexModelToJson(this);

  @override
  List<Object> get props => [index];
}
