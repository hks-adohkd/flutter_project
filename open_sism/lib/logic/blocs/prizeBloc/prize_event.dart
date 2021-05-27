abstract class PrizeEvent {
  const PrizeEvent();
}

class PrizePageRequested extends PrizeEvent {}

class PrizeDataRequested extends PrizeEvent {}
