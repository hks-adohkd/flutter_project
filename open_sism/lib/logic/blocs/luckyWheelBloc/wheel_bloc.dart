import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
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

    if (event is WheelDataReadyEvent) {
      yield WheelDataReady();
    }
  }
}
