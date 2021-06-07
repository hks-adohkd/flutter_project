import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_model.g.dart';

@JsonSerializable()
class TimeModel extends Equatable {
  final DateTime dateTimeNow;

  TimeModel({this.dateTimeNow});

  factory TimeModel.fromJson(Map<String, dynamic> json) =>
      _$TimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeModelToJson(this);

  @override
  List<Object> get props => [dateTimeNow];
}
