import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/group/group_model.dart';

part 'message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Message extends Equatable {
  // Base Entity Model
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  final String title;
  final String script;
  final int groupId;
  final bool isForAll;
  final GroupModel group;

  Message({
    this.id,
    this.created,
    this.modified,
    this.isDeleted,
    this.title,
    this.script,
    this.groupId,
    this.isForAll,
    this.group,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  List<Object> get props => [
        id,
        created,
        modified,
        isDeleted,
        title,
        script,
        groupId,
        isForAll,
        group,
      ];
}
