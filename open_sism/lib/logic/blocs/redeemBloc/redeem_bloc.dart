import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/prize/prize_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'redeem_event.dart';
import 'redeem_state.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';

class RedeemBloc extends Bloc<RedeemEvent, RedeemState> {
  final PrizeRepository prizeRepository;
  final InternetCubit internetCubit;
  final UserRepository userRepository;
  StreamSubscription internetStreamSubscription;
  bool isConnected;

  PrizeApiResponse prizePageModel;
  RedeemBloc(
      {@required this.prizeRepository,
      @required this.userRepository,
      @required this.internetCubit})
      : assert(prizeRepository != null && internetCubit != null),
        super(RedeemInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      print(state.toString());
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is RedeemInitial)) {
        this.add(RedeemDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<RedeemState> mapEventToState(RedeemEvent event) async* {
    print(event.toString());
    print(state.toString());
    if (event is RedeemPageRequested || event is RedeemDataRequested) {
      yield RedeemLoadInProgress();
    }
    if (event is RedeemDataAdded) {
      yield RedeemLoadedSuccess();
    }
  }
}
