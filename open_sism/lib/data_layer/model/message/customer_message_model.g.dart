// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerMessage _$CustomerMessageFromJson(Map<String, dynamic> json) {
  return CustomerMessage(
    id: json['id'] as int,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    isDeleted: json['isDeleted'] as bool,
    customerId: json['customerId'] as int,
    messageId: json['messageId'] as int,
    isRead: json['isRead'] as bool,
    sendDate: json['sendDate'] == null
        ? null
        : DateTime.parse(json['sendDate'] as String),
    message: json['message'] == null
        ? null
        : Message.fromJson(json['message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerMessageToJson(CustomerMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'customerId': instance.customerId,
      'messageId': instance.messageId,
      'isRead': instance.isRead,
      'sendDate': instance.sendDate?.toIso8601String(),
      'message': instance.message?.toJson(),
    };
