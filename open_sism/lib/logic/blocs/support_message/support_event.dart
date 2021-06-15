abstract class SupportEvent {
  const SupportEvent();
}

class PasswordPageRequested extends SupportEvent {}

class PasswordDataRequested extends SupportEvent {}

class SupportAddMessage extends SupportEvent {
  final String firstName, lastName, email, message, subject, phone;

  SupportAddMessage(
      {this.subject,
      this.phone,
      this.message,
      this.email,
      this.firstName,
      this.lastName});
}
