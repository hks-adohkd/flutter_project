abstract class BonusEvent {
  const BonusEvent();
}

class BonusPageRequested extends BonusEvent {}

class BonusDataRequested extends BonusEvent {}

class BonusDataReadyEvent extends BonusEvent {}

class BonusPremiumPageRequested extends BonusEvent {}

class BonusPremiumDataRequested extends BonusEvent {}

class BonusPremiumDataReadyEvent extends BonusEvent {}
