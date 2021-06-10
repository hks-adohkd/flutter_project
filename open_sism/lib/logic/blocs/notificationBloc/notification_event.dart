abstract class NotificationEvent {
  const NotificationEvent();
}

class NotificationPageRequested extends NotificationEvent {}

class NotificationDataRequested extends NotificationEvent {}
