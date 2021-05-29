abstract class WheelEvent {
  const WheelEvent();
}

class WheelPageRequested extends WheelEvent {}

class WheelDataRequested extends WheelEvent {}

class WheelDataReadyEvent extends WheelEvent {}

class WheelPremiumPageRequested extends WheelEvent {}

class WheelPremiumDataRequested extends WheelEvent {}

class WheelPremiumDataReadyEvent extends WheelEvent {}
