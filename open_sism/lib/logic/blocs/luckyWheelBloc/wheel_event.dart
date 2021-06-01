abstract class WheelEvent {
  const WheelEvent();
}

class WheelPageRequested extends WheelEvent {}

class WheelDataRequested extends WheelEvent {}

class WheelDataReadyEvent extends WheelEvent {}

class WheelAddPrizeEvent extends WheelEvent {
  final int prizeId;
  WheelAddPrizeEvent(this.prizeId) : assert(prizeId != null);
  @override
  List<Object> get props => [prizeId];
}

class WheelPremiumCustomerRequested extends WheelEvent {}

class WheelPremiumCustomerReadyEvent extends WheelEvent {}

class WheelPremiumPageRequested extends WheelEvent {}

class WheelPremiumDataRequested extends WheelEvent {}

class WheelPremiumDataReadyEvent extends WheelEvent {}

class WheelPremiumAddPrizeEvent extends WheelEvent {
  final int prizeId;
  WheelPremiumAddPrizeEvent(this.prizeId) : assert(prizeId != null);
  @override
  List<Object> get props => [prizeId];
}
