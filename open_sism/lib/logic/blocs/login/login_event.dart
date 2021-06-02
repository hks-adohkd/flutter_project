abstract class LoginEvent {
  const LoginEvent();
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String mobile, password;

  LoginWithCredentialsPressed({this.mobile, this.password});
}

class LoginInitial extends LoginEvent {}
