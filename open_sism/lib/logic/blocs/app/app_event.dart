import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

class AppStarted extends AppEvent {}

class WalkthroughCompleted extends AppEvent {}

class UpdateFirebaseToken extends AppEvent {
  final String token;

  UpdateFirebaseToken(this.token);
}

class LogIn extends AppEvent {
  final String token;

  LogIn({this.token});
}

class LogOut extends AppEvent {}
