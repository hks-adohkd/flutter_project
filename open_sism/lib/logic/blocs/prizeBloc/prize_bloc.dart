import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'prize_event.dart';
import 'prize_state.dart';
import 'package:open_sism/data_layer/model/prize_model.dart';

class PrizeBloc extends Bloc<PrizeEvent, PrizeState> {
  final PrizeRepository prizeRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  PrizeModel prizeModel;
  PrizeBloc({@required this.prizeRepository, @required this.internetCubit})
      : assert(prizeRepository != null && internetCubit != null),
        super(PrizeInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected) {
        this.add(PrizeDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<PrizeState> mapEventToState(PrizeEvent event) async* {
    if (event is PrizePageRequested || event is PrizeDataRequested) {
      yield PrizeLoadInProgress();

      try {
        prizeModel = await prizeRepository.getPrizeAll();
        yield PrizeLoadedSuccess(prizeData: prizeModel);
      } catch (Exception) {
        yield PrizeLoadFailure(prizeStoredData: prizeModel);
      }
    }
  }
}
