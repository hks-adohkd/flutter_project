abstract class BonusEvent {
  const BonusEvent();
}

class BonusPageRequested extends BonusEvent {}

class BonusDataRequested extends BonusEvent {}

class BonusDataReadyEvent extends BonusEvent {}

class BonusAddPrizeEvent extends BonusEvent {
  final int prizeId;
  BonusAddPrizeEvent(this.prizeId) : assert(prizeId != null);
  @override
  List<Object> get props => [prizeId];
}

class BonusPremiumPageRequested extends BonusEvent {}

class BonusPremiumDataRequested extends BonusEvent {}

class BonusPremiumDataReadyEvent extends BonusEvent {}

class BonusPremiumAddPrizeEvent extends BonusEvent {}
