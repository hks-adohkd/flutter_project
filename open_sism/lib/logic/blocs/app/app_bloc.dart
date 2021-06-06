import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_sism/logic/blocs/app/app_event.dart';
import 'package:open_sism/logic/blocs/app/app_state.dart';
import 'package:open_sism/data_layer/Repositories/app_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository appRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  AppBloc(
      {@required this.appRepository,
      @required this.userRepository,
      this.internetCubit})
      : super(AppInitial()) {
    {
      internetStreamSubscription = internetCubit.stream.listen((internetState) {
        if (internetState is InternetDisconnected) {
          isConnected = false;
        } else if (internetState is InternetConnected &&
            !(state is AppInitial)) {
          this.add(AppStarted());
          isConnected = true;
        } else if (internetState is InternetLoading) {}
      });
    }
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    //todo: for testing only
    // _appRepository.clear();

    if (event is AppStarted) {
      print("come here AppStarted ");
      yield LoadingState();
      // await Future.delayed(Duration(seconds: 1));

      try {
        // var res = await _appRepository.getSettings();
        var res = true;
        if (isConnected) {
          // await appRepository.setIfOpenedBefore(false); // for testing
          bool hasOpenedBefore = await appRepository.checkIfOpenedBefore();
          print('Opened before?: $hasOpenedBefore');

          // returning user
          if (hasOpenedBefore) {
            bool shouldUpdate = await appRepository.checkShouldUpdate();
            print('Should update?: $shouldUpdate');

            if (shouldUpdate) {
              yield AppOutdated();
            } else {
              yield AppReady(showWalkthrough: false);
            }
          }
          // new user or deleted app date, either way
          // it should be considered a new user
          else if (!hasOpenedBefore) {
            // Future.delayed(const Duration(milliseconds: 500), () async* {
            //   yield AppReady(showWalkthrough: true);
            // });
            yield AppReady(showWalkthrough: true);
          }
        } else {
          yield AppOffline();
        }
      } catch (e) {
        yield AppOffline();
        print('Error AppStarted: $e');
      }
    }

    if (event is WalkthroughCompleted) {
      print('I am IN WalkthroughCompleted');
      //  yield AppReady(showWalkthrough: false);
      appRepository.setIfOpenedBefore(true);
    }

    if (event is UpdateFirebaseToken) {
      print('called UpdateFirebaseToken event');
      print(event.fcmToken);
      try {
        await userRepository.userSetFCMToken(fcmToken: event.fcmToken);
        // await userRepository.
        await userRepository.persistFCMToken(event.fcmToken);
      } catch (e) {
        print('Error is: $e');
      }
    }

    if (event is LogOut) {
      await userRepository.deleteToken();
      await userRepository.deleteFCMToken();
      await appRepository.clear();
      await appRepository.setIfOpenedBefore(false);
      yield LoggedOut();
    }

    if (event is LogIn) {
      try {
        await userRepository.persistToken(event.token);
//         await _userRepository.putFirebaseToken();
        await appRepository.setIfOpenedBefore(true);
      } catch (e) {
        print('Error is: $e');
      }

      //      yield LoggedIn();
    }
  }
}
