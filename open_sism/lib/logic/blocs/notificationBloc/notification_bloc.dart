import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/contact_us_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/message/customer_message_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/presentation/screens/activity/notification/components/build_notification.dart';
import '../../../presentation/screens/activity/message/components/build_message.dart';
import '../../../presentation/screens/activity/message/components/build_message.dart';
import 'notification_event.dart';
import 'notification_state.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_model.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_api_response.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  List<NotificationList> notificationList;

  CustomerMessageApiResponse messagePageModel;
  NotificationBloc(
      {@required this.internetCubit, @required this.userRepository})
      : assert(internetCubit != null),
        super(NotificationInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is NotificationInitial)) {
        this.add(NotificationDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is NotificationPageRequested ||
        event is NotificationDataRequested) {
      yield NotificationLoadInProgress();
      print("contact us ");
      try {
        print(await userRepository.getToken());
        messagePageModel = await userRepository.getCustomerMessage(
            token: await userRepository.getToken());

        notificationList = messagePageModel.content.content
            .map(
              (item) => NotificationList(
                subject: messagePageModel
                    .content
                    .content[messagePageModel.content.content.indexOf(item)]
                    .message
                    .title,
                message: messagePageModel
                    .content
                    .content[messagePageModel.content.content.indexOf(item)]
                    .message
                    .script,
                sendDate: messagePageModel
                    .content
                    .content[messagePageModel.content.content.indexOf(item)]
                    .sendDate,
              ),
            )
            .toList();
        yield NotificationLoadedSuccess(
            messageData: messagePageModel, notificationList: notificationList);
      } catch (Exception) {
        yield NotificationLoadFailure(messageStoredData: messagePageModel);
      }
    }
  }
}
