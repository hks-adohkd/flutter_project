abstract class WheelEvent {
  const WheelEvent();
}

class WheelPageRequested extends WheelEvent {}

class WheelDataRequested extends WheelEvent {}

class WheelDataReadyEvent extends WheelEvent {}
