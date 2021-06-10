abstract class AccountEvent {
  const AccountEvent();
}

class AccountPageRequested extends AccountEvent {}

class AccountDataRequested extends AccountEvent {}
