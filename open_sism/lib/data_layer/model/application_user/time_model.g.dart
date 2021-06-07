// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeModel _$TimeModelFromJson(Map<String, dynamic> json) {
  return TimeModel(
    dateTimeNow: json['dateTimeNow'] == null
        ? null
        : DateTime.parse(json['dateTimeNow'] as String),
  );
}

Map<String, dynamic> _$TimeModelToJson(TimeModel instance) => <String, dynamic>{
      'dateTimeNow': instance.dateTimeNow?.toIso8601String(),
    };
