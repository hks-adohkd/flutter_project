import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_api_response.dart';
import 'package:open_sism/data_layer/model/message/customer_message_api_response.dart';

import 'package:open_sism/presentation/screens/activity/message/components/build_message.dart';
import 'package:open_sism/presentation/screens/activity/notification/components/build_notification.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoadInProgress extends NotificationState {}

class NotificationLoadedSuccess extends NotificationState {
  final CustomerMessageApiResponse messageData;
  final List<NotificationList> notificationList;
  const NotificationLoadedSuccess(
      {@required this.messageData, this.notificationList})
      : assert(messageData != null);

  @override
  List<Object> get props => [messageData];
}

class NotificationLoadFailure extends NotificationState {
  final CustomerMessageApiResponse messageStoredData;
  NotificationLoadFailure({@required this.messageStoredData});
}
//
