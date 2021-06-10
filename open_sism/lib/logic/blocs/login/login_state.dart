import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends LoginState {}

class LoginFailed extends LoginState {
  final String message;

  LoginFailed(this.message);
}

class LoginMessageNotSuccess extends LoginState {
  final String message;

  LoginMessageNotSuccess(this.message);
}

class LoginNotValidated extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginLoading extends LoginState {}
