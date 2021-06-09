import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/message/message_model.dart';

part 'customer_message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerMessage extends Equatable {
  // Base Entity Model
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  final int customerId;
  final int messageId;
  final bool isRead;
  final DateTime sendDate;
  final Message message;

  CustomerMessage({
    this.id,
    this.created,
    this.modified,
    this.isDeleted,
    this.customerId,
    this.messageId,
    this.isRead,
    this.sendDate,
    this.message,
  });

  factory CustomerMessage.fromJson(Map<String, dynamic> json) =>
      _$CustomerMessageFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerMessageToJson(this);

  @override
  List<Object> get props => [
        id,
        created,
        modified,
        isDeleted,
        customerId,
        messageId,
        isRead,
        sendDate,
        message,
      ];
}
