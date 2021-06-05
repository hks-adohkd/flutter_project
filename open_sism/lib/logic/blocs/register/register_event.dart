import 'package:meta/meta.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String firstName, lastName, mobile, password, passwordConfirm, email;
  final int gender;

  RegisterButtonPressed({
    this.mobile,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.passwordConfirm,
    this.gender,
  });
}

class RegisterByInvite extends RegisterEvent {
  final String code, mobile;

  RegisterByInvite(this.code, this.mobile);
}
