abstract class FinishedTaskEvent {
  const FinishedTaskEvent();
}

class FinishedTaskPageRequested extends FinishedTaskEvent {}

class FinishedTaskDataRequested extends FinishedTaskEvent {}
