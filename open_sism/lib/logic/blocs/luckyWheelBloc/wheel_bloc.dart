import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:open_sism/data_layer/Repositories/app_repo.dart';
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
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/application_user/time_model.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  final PrizeRepository prizeRepository;
  final InternetCubit internetCubit;
  final UserRepository userRepository;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  WheelModel wheelModel;
  WheelApiResponse wheelPageModel;
  CustomerPrizeApiResponse customerPrizeApiResponse;
  TimeModel timeNow;
  bool spinValid;
  WheelBloc(
      {@required this.prizeRepository,
      @required this.userRepository,
      @required this.internetCubit})
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
        wheelPageModel = await prizeRepository.getWheelPrizes(
            token: await userRepository.getToken());

        yield WheelLoadedSuccess(wheelData: wheelPageModel);
      } catch (Exception) {
        yield WheelLoadFailure(wheelStoredData: wheelPageModel);
      }
    }
    if (event is WheelAddPrizeEvent) {
      print("BonusAddPrizeEvent");

      yield WheelAddPrize(wheelData: wheelPageModel);
      try {
        customerPrizeApiResponse = await prizeRepository.addLuckyPrizes(
            prizeId: event.prizeId, token: await userRepository.getToken());
        print("customerPrizeApiResponse");
        timeNow = await userRepository.getTime();
        yield WheelAddSuccess(
            wheelPrize: customerPrizeApiResponse, dateNow: timeNow);
      } catch (Exception) {
        print("failure BonusAddPrize");
        print(Exception);
        yield WheelLoadFailure(wheelStoredData: wheelPageModel);
      }
    }

    if (event is WheelDataReadyEvent) {
      print("into state WheelDataReady");
      timeNow = await userRepository.getTime();
      print({"timeNow", timeNow});

      // DateTime now = DateTime.now();
      // String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      // DateTime dateTime = DateTime.parse(formattedDate);
      int mS = timeNow.dateTimeNow.millisecondsSinceEpoch -
          wheelPageModel
              .currentCustomer.luckyWheelLastSpinDate.millisecondsSinceEpoch;
      print({"timeNow", timeNow.dateTimeNow});
      print({
        "luckyWheelLastSpinDate",
        wheelPageModel.currentCustomer.luckyWheelLastSpinDate
      });
      int hour = (mS ~/ (1000 * 60 * 60));
      int minutes = (mS ~/ (1000 * 60)) % 60;
      print({"hour", hour});
      int nextSpinHourMs = (24 * 60 * 60 * 1000) - mS;
      int nextSpinMinutes = (nextSpinHourMs ~/ (1000 * 60)) % 60;
      int nextSpinHour = nextSpinHourMs ~/ (1000 * 60 * 60);
      print({"nextSpinHour", nextSpinHour});
      String spinTime = '$nextSpinHour h:$nextSpinMinutes m';
      if (nextSpinHour < 24 && nextSpinHour > 0) {
        spinValid = false;
      } else {
        spinValid = true;
      }
      yield WheelDataReady(
          wheelData: wheelPageModel, isAllowed: spinValid, nextSpin: spinTime);
    }
  }
}

class WheelPremiumBloc extends Bloc<WheelEvent, WheelState> {
  final PrizeRepository prizeRepository;
  final HomeRepository homeRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  CustomerPrizeApiResponse customerPrizeApiResponse;
  bool isConnected, spinPremiumValid;
  WheelModel wheelModel;
  WheelApiResponse wheelPageModel;
  HomeApiResponse customer;
  AppRepository appRepository;
  UserRepository userRepository;
  TimeModel timeNow;
  WheelPremiumBloc(
      {@required this.prizeRepository,
      @required this.internetCubit,
      @required this.homeRepository,
      @required this.userRepository,
      @required this.appRepository})
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
        wheelPageModel = await prizeRepository.getPremiumWheelPrizes(
            token: await userRepository.getToken());

        print("wheelPageModel");
        print(wheelPageModel.currentCustomer);
        print(wheelPageModel.currentCustomer.premium);
        yield WheelPremiumLoadedSuccess(
            wheelData: wheelPageModel,
            isPremium: wheelPageModel.currentCustomer.premium);
      } catch (Exception) {
        yield WheelPremiumLoadFailure(wheelStoredData: wheelPageModel);
      }
    }

    if (event is WheelPremiumAddPrizeEvent) {
      print("BonusAddPrizeEvent");

      yield WheelPremiumAddPrize(wheelData: wheelPageModel);
      try {
        customerPrizeApiResponse = await prizeRepository.addPremiumLuckyPrizes(
            prizeId: event.prizeId, token: await userRepository.getToken());
        timeNow = await userRepository.getTime();
        print("customerPrizeApiResponse");
        yield WheelPremiumAddSuccess(
            wheelPrize: customerPrizeApiResponse, dateNow: timeNow);
      } catch (Exception) {
        print("failure BonusAddPrize");
        print(Exception);
        yield WheelPremiumLoadFailure(wheelStoredData: wheelPageModel);
      }
    }

    if (event is WheelPremiumDataReadyEvent) {
      print("into state WheelDataReady");

      timeNow = await userRepository.getTime();
      // DateTime now = DateTime.now();
      // String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      // DateTime dateTime = DateTime.parse(formattedDate);
      int mS = timeNow.dateTimeNow.millisecondsSinceEpoch -
          wheelPageModel.currentCustomer.luckyWheelPremiumLastSpinDate
              .millisecondsSinceEpoch;
      int hour = (mS ~/ (1000 * 60 * 60));
      int minutes = (mS ~/ (1000 * 60)) % 60;

      int nextSpinHourMs = (24 * 60 * 60 * 1000) - mS;
      int nextSpinMinutes = (nextSpinHourMs ~/ (1000 * 60)) % 60;
      int nextSpinHour = nextSpinHourMs ~/ (1000 * 60 * 60);

      String spinTime = '$nextSpinHour h:$nextSpinMinutes m';
      if (nextSpinHour < 24 && nextSpinHour > 0) {
        spinPremiumValid = false;
      } else {
        spinPremiumValid = true;
      }
      yield WheelPremiumDataReady(
          wheelData: wheelPageModel,
          isPremium: event.isPremium,
          isAllowed: spinPremiumValid,
          nextSpin: spinTime);
    }

    if (event is WheelPremiumCustomerRequested) {
      print("into state WheelPremiumCustomerInitial");
      try {
        customer = await homeRepository.getHomeData(
            token: await userRepository.getToken());
        yield WheelPremiumCustomerInitial(customer: customer);
      } catch (Exception) {
        print("failure BonusAddPrize");
        print(Exception);
        yield WheelPremiumLoadFailure(wheelStoredData: wheelPageModel);
      }
    }

    if (event is WheelPremiumCustomerReadyEvent) {
      print("into state WheelPremiumCustomerReady");
      yield WheelPremiumCustomerReady();
    }
  }
}
