abstract class AccountEvent {
  const AccountEvent();
}

class AccountPageRequested extends AccountEvent {}

class AccountDataRequested extends AccountEvent {}

class AccountUpdateProfile extends AccountEvent {
  final String firstName, lastName, email, address;

  AccountUpdateProfile({
    this.address,
    this.firstName,
    this.lastName,
    this.email,
  });
}
