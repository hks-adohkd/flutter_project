import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialRegisterState extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterNotValidFormState extends RegisterState {}

class RegisterNotMatchedPasswordsState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  RegisterSuccessState();
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterMessageNotSuccess extends RegisterState {
  final String message;

  RegisterMessageNotSuccess(this.message);
}
