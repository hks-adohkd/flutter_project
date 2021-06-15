import 'package:open_sism/data_layer/model/customer/customer_response_model.dart';

import 'password.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';
import 'package:open_sism/data_layer/model/application_user/application_user_api_response.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;

  CustomerProfileApiResponse profileModel;
  PasswordBloc({@required this.internetCubit, @required this.userRepository})
      : assert(internetCubit != null),
        super(PasswordInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is PasswordInitial)) {
        //this.add(AccountDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    if (event is PasswordUpdate) {
      yield PasswordUpdateState();

      //  String mobile = event.mobile.replaceFirst("+", '');
      // print('mobile will be ${event.mobile}');

      if (event.oldPassword.isEmpty ||
          event.newPassword.isEmpty ||
          event.confirmPassword.isEmpty) {
        yield PasswordNotValidFormState();
      } else {
        try {
          ApplicationUserApiResponse user =
              await userRepository.updateCustomerPassword(
                  newPassword: event.newPassword,
                  oldPassword: event.oldPassword,
                  confirmPassword: event.confirmPassword,
                  token: await userRepository.getToken());
          if (user.message == "success") {
            yield PasswordUpdateSuccessState();
          } else
            yield PasswordUpdateMessageNotSuccess(user.message);
        } catch (e) {
          yield PasswordUpdateErrorState(e);
          print('Error is: $e');
        }
      }
    }
  }
}
