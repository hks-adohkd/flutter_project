import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_prize_api_response.dart';
import 'package:open_sism/data_layer/model/pagination/customer_prize_pagination_model.dart';
import 'package:open_sism/data_layer/model/prize/prize_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'bonus_event.dart';
import 'bonus_state.dart';
import 'package:open_sism/data_layer/model/dailyBonus/bonus_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';
import 'package:open_sism/data_layer/model/dailyBonus/bonus_api_response.dart';

class BonusBloc extends Bloc<BonusEvent, BonusState> {
  final PrizeRepository prizeRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  BonusModel bonusModel;
  BonusApiResponse bonusPageModel;
  CustomerPrizePaginationModel customerPrizePaginationMode;
  CustomerPrizeApiResponse customerPrizeApiResponse;
  BonusBloc({@required this.prizeRepository, @required this.internetCubit})
      : assert(prizeRepository != null && internetCubit != null),
        super(BonusInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is BonusInitial)) {
        this.add(BonusDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<BonusState> mapEventToState(BonusEvent event) async* {
    if (event is BonusPageRequested || event is BonusDataRequested) {
      yield BonusLoadInProgress();

      try {
        bonusPageModel = await prizeRepository.getBonusPrizes();
        yield BonusLoadedSuccess(bonusData: bonusPageModel);
      } catch (Exception) {
        yield BonusLoadFailure(bonusStoredData: bonusPageModel);
      }
    }
    if (event is BonusAddPrizeEvent) {
      print("BonusAddPrizeEvent");

      yield BonusAddPrize(bonusData: bonusPageModel);
      // try {
      //   customerPrizeApiResponse =
      //       await prizeRepository.addBonusPrizes(prizeId: event.prizeId);
      //   yield BonusAddSuccess(bonusPrize: customerPrizeApiResponse);
      // } catch (Exception) {
      //   yield BonusLoadFailure(bonusStoredData: bonusPageModel);
      // }
    }

    if (event is BonusDataReadyEvent) {
      print("into state BonusDataReady");
      yield BonusDataReady(bonusData: bonusPageModel);
    }
  }
}

class BonusPremiumBloc extends Bloc<BonusEvent, BonusState> {
  final PrizeRepository prizeRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  BonusModel bonusModel;
  BonusApiResponse bonusPageModel;
  BonusPremiumBloc(
      {@required this.prizeRepository, @required this.internetCubit})
      : assert(prizeRepository != null && internetCubit != null),
        super(BonusPremiumInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is BonusInitial)) {
        this.add(BonusPremiumDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<BonusState> mapEventToState(BonusEvent event) async* {
    if (event is BonusPremiumPageRequested ||
        event is BonusPremiumDataRequested) {
      yield BonusPremiumLoadInProgress();

      try {
        bonusPageModel = await prizeRepository.getPremiumBonusPrizes();
        yield BonusPremiumLoadedSuccess(bonusData: bonusPageModel);
      } catch (Exception) {
        yield BonusPremiumLoadFailure(bonusStoredData: bonusPageModel);
      }
    }

    if (event is BonusPremiumDataReadyEvent) {
      print("into state BonusDataReady");
      yield BonusPremiumDataReady(bonusData: bonusPageModel);
    }
  }
}
