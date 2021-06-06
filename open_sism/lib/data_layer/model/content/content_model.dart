import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable()
class Content extends Equatable{

  // Base Entity Model
  final int id;
  final DateTime createdAt;
  final DateTime modified;
  final bool isDeleted;

  final String name;
  final String title;
  final String script;
  final String imageUrl;
  final int itemOrder;

  Content({this.id, this.createdAt, this.modified, this.isDeleted, this.name,
      this.title, this.script, this.imageUrl, this.itemOrder});

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  @override
  List<Object> get props => [name, title, script, imageUrl, itemOrder, id, createdAt, modified, isDeleted];
}