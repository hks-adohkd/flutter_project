abstract class PasswordEvent {
  const PasswordEvent();
}

class PasswordPageRequested extends PasswordEvent {}

class PasswordDataRequested extends PasswordEvent {}

class PasswordUpdate extends PasswordEvent {
  final String oldPassword, newPassword, confirmPassword;

  PasswordUpdate({
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });
}
