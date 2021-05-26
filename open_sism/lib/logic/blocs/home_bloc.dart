import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/home_repository.dart';
import 'package:open_sism/data_layer/model/home_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;

  HomeBloc({@required this.homeRepository, @required this.internetCubit})
      : assert(homeRepository != null && internetCubit != null),
        super(HomeBeforeInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected) {
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomePageRequested) {
      print("Home Page Requested!");
      yield HomeLoadInProgress();

      try {
        final HomeApiResponse homeModel = await homeRepository.getHomeData();
        yield HomeLoadedSuccess(homeData: homeModel);
      } catch (Exception) {
        print("Exception");
        print(Exception);
        yield HomeLoadFailure();
      }
    }
  }
}
