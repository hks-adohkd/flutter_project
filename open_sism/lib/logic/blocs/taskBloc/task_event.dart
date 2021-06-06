abstract class TaskEvent {
  const TaskEvent();
}

class TaskPageRequested extends TaskEvent {}

class TaskDataRequested extends TaskEvent {}
