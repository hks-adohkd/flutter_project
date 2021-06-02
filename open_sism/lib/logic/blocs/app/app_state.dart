import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppOutdated extends AppState {}

class AppReady extends AppState {
  final bool showWalkthrough;

  AppReady({this.showWalkthrough});
}

class AppOffline extends AppState {}

class LoadingState extends AppState {}

class LoggedIn extends AppState {}

class LoggedOut extends AppState {}
