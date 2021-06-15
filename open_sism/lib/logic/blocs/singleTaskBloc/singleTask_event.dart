import 'package:flutter/cupertino.dart';

abstract class SingleTaskEvent {
  const SingleTaskEvent();
}

//class TaskPageRequested extends SingleTaskEvent {}

class SingleTaskDataRequested extends SingleTaskEvent {
  final String taskId;
  SingleTaskDataRequested({@required this.taskId});
}
