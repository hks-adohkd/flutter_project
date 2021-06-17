import 'profile.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;

  CustomerProfileApiResponse profileModel;
  ProfileBloc({@required this.internetCubit, @required this.userRepository})
      : assert(internetCubit != null),
        super(ProfileInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is ProfileInitial)) {
        this.add(ProfileDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfilePageRequested || event is ProfileDataRequested) {
      yield ProfileLoadInProgress();

      try {
        profileModel = await userRepository.getCustomerProfile(
            token: await userRepository.getToken());
        if (profileModel.message == "success") {
          yield ProfileLoadedSuccess(profileData: profileModel, valid: true);
        } else {
          yield ProfileMessageNotSuccess(profileModel.message);
        }
      } catch (Exception) {
        yield ProfileLoadFailure(profileData: profileModel);
      }
    }
  }
}
