import 'package:open_sism/data_layer/model/customer/customer_response_model.dart';

import 'support.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';
import 'package:open_sism/data_layer/model/contactUS/support_message_api_response.dart';
import 'package:open_sism/data_layer/Repositories/contact_us_repo.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  final ContactUSRepository contactUsRepository;
  StreamSubscription internetStreamSubscription;
  bool isConnected;

  SupportMessageApiResponse supportModel;
  SupportBloc(
      {@required this.internetCubit,
      @required this.userRepository,
      @required this.contactUsRepository})
      : assert(internetCubit != null),
        super(SupportInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is SupportInitial)) {
        //this.add(AccountDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<SupportState> mapEventToState(SupportEvent event) async* {
    if (event is SupportAddMessage) {
      yield SupportAddState();

      //  String mobile = event.mobile.replaceFirst("+", '');
      // print('mobile will be ${event.mobile}');

      if (event.firstName.isEmpty ||
          event.email.isEmpty ||
          event.message.isEmpty ||
          event.phone.isEmpty ||
          event.subject.isEmpty) {
        yield SupportNotValidFormState();
      } else {
        try {
          String lastName = " ";
          if (event.lastName.isNotEmpty) {
            lastName = event.lastName;
          }

          SupportMessageApiResponse message =
              await contactUsRepository.addSupportMessage(
                  firstName: event.firstName,
                  lastName: lastName,
                  email: event.email,
                  phone: event.phone,
                  message: event.message,
                  subject: event.subject,
                  token: await userRepository.getToken());
          if (message.message == "success") {
            yield SupportSuccessState();
          } else
            yield SupportMessageNotSuccess(message.message);
        } catch (e) {
          yield SupportErrorState(e);
          print('Error is: $e');
        }
      }
    }
  }
}
