import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/home_repository.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/home/home_api_response.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  final AppBloc appBloc;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  HomeApiResponse homeModel;
  HomeBloc(
      {@required this.homeRepository,
      @required this.userRepository,
      @required this.internetCubit,
      this.appBloc})
      : assert(homeRepository != null && internetCubit != null),
        super(HomeBeforeInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is HomeBeforeInitial)) {
        this.add(HomeDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomePageRequested || event is HomeDataRequested) {
      yield HomeLoadInProgress();
      print("HomeLoadInProgress");
      try {
        homeModel = await homeRepository.getHomeData(
            token: await userRepository.getToken());
        yield HomeLoadedSuccess(homeData: homeModel);
        print("HomeLoadedSuccess");
      } catch (Exception) {
        yield HomeLoadFailure(homeStoredData: homeModel);
      }
    }
  }
}
