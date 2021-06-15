import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class Contact extends Equatable {
  // Base Entity Model
  final int id;
  final DateTime createdAt;
  final DateTime modified;
  final bool isDeleted;

  final String name;
  final String displayName;
  final String value;
  final String icon;

  Contact(
      {this.id,
      this.createdAt,
      this.modified,
      this.isDeleted,
      this.name,
      this.displayName,
      this.value,
      this.icon});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  List<Object> get props =>
      [name, displayName, value, icon, id, createdAt, modified, isDeleted];
}
