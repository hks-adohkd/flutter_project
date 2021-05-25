import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/home_repository.dart';
import 'package:open_sism/data_layer/model/home_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeRequested, HomeState> {
  final HomeRepository homeRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;

  HomeBloc({@required this.homeRepository, @required this.internetCubit})
      : assert(homeRepository != null && internetCubit != null),
        super(HomeInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        this.emit(HomeNoInternet());
      } else if (internetState is InternetConnected) {
        this.add(HomeRequested());
      } else if (internetState is InternetLoading) {
        this.emit(HomeLoadInProgress());
      }
    });
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (state is HomeNoInternet) {
      yield state;
    }

    if (event is HomeRequested) {
      if (!(state is HomeLoadInProgress)) {
        yield HomeLoadInProgress();
      }

      try {
        final HomeApiResponse homeModel = await homeRepository.getHomeData();

        yield HomeLoadedSuccess(homeData: homeModel);
      } catch (Exception) {
        yield HomeLoadFailure();
      }
    }
  }
}
