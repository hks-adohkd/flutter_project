import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_prize_api_response.dart';
import 'package:open_sism/data_layer/model/dailyBonus/bonus_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';

abstract class BonusState extends Equatable {
  const BonusState();

  @override
  List<Object> get props => [];
}

class BonusInitial extends BonusState {}

class BonusLoadInProgress extends BonusState {}

class BonusLoadedSuccess extends BonusState {
  final BonusApiResponse bonusData;

  const BonusLoadedSuccess({@required this.bonusData})
      : assert(bonusData != null);

  @override
  List<Object> get props => [bonusData];
}

class BonusAddSuccess extends BonusState {
  final CustomerPrizeApiResponse bonusPrize;

  const BonusAddSuccess({@required this.bonusPrize});

  @override
  List<Object> get props => [bonusPrize];
}

class BonusDataReady extends BonusState {
  final BonusApiResponse bonusData;
  final String nextSpin;
  final bool isAllowed;
  const BonusDataReady(
      {@required this.bonusData, this.nextSpin, this.isAllowed})
      : assert(bonusData != null);

  @override
  List<Object> get props => [bonusData];
}

class BonusAddPrize extends BonusState {
  final BonusApiResponse bonusData;

  const BonusAddPrize({@required this.bonusData}) : assert(bonusData != null);

  @override
  List<Object> get props => [bonusData];
}

class BonusLoadFailure extends BonusState {
  final BonusApiResponse bonusStoredData;
  BonusLoadFailure({@required this.bonusStoredData});
}
//
// class HomeNoInternet extends HomeState {}

class BonusPremiumInitial extends BonusState {}

class BonusPremiumLoadInProgress extends BonusState {}

class BonusPremiumLoadedSuccess extends BonusState {
  final BonusApiResponse bonusData;

  const BonusPremiumLoadedSuccess({@required this.bonusData})
      : assert(bonusData != null);

  @override
  List<Object> get props => [bonusData];
}

class BonusPremiumDataReady extends BonusState {
  final BonusApiResponse bonusData;

  const BonusPremiumDataReady({@required this.bonusData})
      : assert(bonusData != null);

  @override
  List<Object> get props => [bonusData];
}

class BonusPremiumAddPrize extends BonusState {
  final BonusApiResponse bonusData;

  const BonusPremiumAddPrize({@required this.bonusData})
      : assert(bonusData != null);

  @override
  List<Object> get props => [bonusData];
}

class BonusPremiumLoadFailure extends BonusState {
  final BonusApiResponse bonusStoredData;
  BonusPremiumLoadFailure({@required this.bonusStoredData});
}
