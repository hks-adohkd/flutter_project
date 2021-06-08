import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/contact_us_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'contact_us_event.dart';
import 'contact_us_state.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_model.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_api_response.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final ContactUSRepository contactUSRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  ContactUS contactUSModel;
  ContactUSApiResponse contactUSPageModel;
  ContactUsBloc(
      {@required this.contactUSRepository,
      @required this.internetCubit,
      @required this.userRepository})
      : assert(contactUSRepository != null && internetCubit != null),
        super(ContactUSInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is ContactUSInitial)) {
        this.add(ContactUsDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<ContactUsState> mapEventToState(ContactUsEvent event) async* {
    if (event is ContactUsPageRequested || event is ContactUsDataRequested) {
      yield ContactUSLoadInProgress();

      try {
        contactUSPageModel = await contactUSRepository.getContactUSPage(
            token: await userRepository.getToken());
        yield ContactUSLoadedSuccess(contactData: contactUSPageModel);
      } catch (Exception) {
        yield ContactUSLoadFailure(contactStoredData: contactUSPageModel);
      }
    }
  }
}
