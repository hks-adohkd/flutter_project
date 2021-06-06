import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_model.g.dart';

@JsonSerializable()
class GroupModel extends Equatable{

  // Base Entity Model
  int id;
  DateTime created;
  DateTime modified;
  bool isDeleted;

  String name;
  String displayName;
  int itemOrder;
  String color;
  int points;
  String imageUrl;

  GroupModel({this.id, this.created, this.modified, this.isDeleted, this.name,
      this.displayName, this.itemOrder, this.color, this.points, this.imageUrl});

  factory GroupModel.fromJson(Map<String, dynamic> json) => _$GroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupModelToJson(this);

  @override
  List<Object> get props => [id, created, modified, isDeleted, name, displayName];
}
