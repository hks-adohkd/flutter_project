abstract class RedeemEvent {
  const RedeemEvent();
}

class RedeemPageRequested extends RedeemEvent {}

class RedeemDataRequested extends RedeemEvent {}

class RedeemDataAdded extends RedeemEvent {}
