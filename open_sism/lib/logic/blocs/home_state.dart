import 'package:equatable/equatable.dart';
import 'package:open_sism/data_layer/model/home_api_response.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable{

  const HomeState();

  @override
  List<Object> get props => [];

}

class HomeInitial extends HomeState{}

class HomeLoadInProgress extends HomeState{}

class HomeLoadedSuccess extends HomeState{
  final HomeApiResponse homeData;

  const HomeLoadedSuccess({@required this.homeData}) : assert(homeData != null);

  @override
  List<Object> get props => [homeData];
}

class HomeLoadFailure extends HomeState{}

class HomeNoInternet extends HomeState{}