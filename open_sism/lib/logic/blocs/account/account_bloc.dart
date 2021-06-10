import 'account.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;

  CustomerProfileApiResponse profileModel;
  AccountBloc({@required this.internetCubit, @required this.userRepository})
      : assert(internetCubit != null),
        super(AccountInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is AccountInitial)) {
        this.add(AccountDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if (event is AccountPageRequested || event is AccountDataRequested) {
      yield AccountLoadInProgress();

      try {
        profileModel = await userRepository.getCustomerProfile(
            token: await userRepository.getToken());

        yield AccountLoadedSuccess(profileData: profileModel);
      } catch (Exception) {
        yield AccountLoadFailure(profileData: profileModel);
      }
    }
  }
}
