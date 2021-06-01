import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/home_repository.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_prize_api_response.dart';
import 'package:open_sism/data_layer/model/home/home_api_response.dart';
import 'package:open_sism/data_layer/model/prize/prize_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'wheel_event.dart';
import 'wheel_state.dart';
import 'package:open_sism/data_layer/model/luckyWheel/wheel_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';
import 'package:open_sism/data_layer/model/luckyWheel/wheel_api_response.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  final PrizeRepository prizeRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  WheelModel wheelModel;
  WheelApiResponse wheelPageModel;
  CustomerPrizeApiResponse customerPrizeApiResponse;
  WheelBloc({@required this.prizeRepository, @required this.internetCubit})
      : assert(prizeRepository != null && internetCubit != null),
        super(WheelInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is WheelInitial)) {
        this.add(WheelDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<WheelState> mapEventToState(WheelEvent event) async* {
    if (event is WheelPageRequested || event is WheelDataRequested) {
      yield WheelLoadInProgress();

      try {
        wheelPageModel = await prizeRepository.getWheelPrizes();
        yield WheelLoadedSuccess(wheelData: wheelPageModel);
      } catch (Exception) {
        yield WheelLoadFailure(wheelStoredData: wheelPageModel);
      }
    }
    if (event is WheelAddPrizeEvent) {
      print("BonusAddPrizeEvent");

      yield WheelAddPrize(wheelData: wheelPageModel);
      try {
        customerPrizeApiResponse =
            await prizeRepository.addLuckyPrizes(prizeId: event.prizeId);
        print("customerPrizeApiResponse");
        yield WheelAddSuccess(wheelPrize: customerPrizeApiResponse);
      } catch (Exception) {
        print("failure BonusAddPrize");
        print(Exception);
        yield WheelLoadFailure(wheelStoredData: wheelPageModel);
      }
    }

    if (event is WheelDataReadyEvent) {
      print("into state WheelDataReady");
      yield WheelDataReady(wheelData: wheelPageModel);
    }
  }
}

class WheelPremiumBloc extends Bloc<WheelEvent, WheelState> {
  final PrizeRepository prizeRepository;
  final HomeRepository homeRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  CustomerPrizeApiResponse customerPrizeApiResponse;
  bool isConnected;
  WheelModel wheelModel;
  WheelApiResponse wheelPageModel;
  HomeApiResponse customer;
  WheelPremiumBloc(
      {@required this.prizeRepository,
      @required this.internetCubit,
      @required this.homeRepository})
      : assert(prizeRepository != null && internetCubit != null),
        super(WheelPremiumInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is WheelInitial)) {
        this.add(WheelPremiumDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<WheelState> mapEventToState(WheelEvent event) async* {
    if (event is WheelPremiumPageRequested ||
        event is WheelPremiumDataRequested) {
      yield WheelPremiumLoadInProgress();

      try {
        wheelPageModel = await prizeRepository.getPremiumWheelPrizes();
        yield WheelPremiumLoadedSuccess(wheelData: wheelPageModel);
      } catch (Exception) {
        yield WheelPremiumLoadFailure(wheelStoredData: wheelPageModel);
      }
    }

    if (event is WheelPremiumAddPrizeEvent) {
      print("BonusAddPrizeEvent");

      yield WheelPremiumAddPrize(wheelData: wheelPageModel);
      try {
        customerPrizeApiResponse =
            await prizeRepository.addLuckyPrizes(prizeId: event.prizeId);
        print("customerPrizeApiResponse");
        yield WheelPremiumAddSuccess(wheelPrize: customerPrizeApiResponse);
      } catch (Exception) {
        print("failure BonusAddPrize");
        print(Exception);
        yield WheelPremiumLoadFailure(wheelStoredData: wheelPageModel);
      }
    }

    if (event is WheelPremiumDataReadyEvent) {
      print("into state WheelDataReady");
      yield WheelPremiumDataReady(wheelData: wheelPageModel);
    }

    if (event is WheelPremiumCustomerRequested) {
      print("into state WheelPremiumCustomerInitial");
      customer = await homeRepository.getHomeData();
      yield WheelPremiumCustomerInitial(customer: customer);
    }
  }
}
