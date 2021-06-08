import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/logic/blocs/app/app_event.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_bloc.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_event.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/home/components/body.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/main.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:open_sism/logic/blocs/homeBloc/home_state.dart';

import '../../../logic/blocs/homeBloc/home_state.dart';

// Crude counter to make messages unique
int _messageCount = 0;

/// The API endpoint here accepts a raw FCM payload for demonstration purposes.
String constructFCMPayload(String token) {
  _messageCount++;
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      'count': _messageCount.toString(),
    },
    'notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This notification (#$_messageCount) was created via FCM!',
    },
  });
}

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _token;
  Stream<String> _tokenStream;

  void setToken(String token) {
    print('FCM Token: $token');
    if (token != null || token != "") {
      context.read<AppBloc>().add(UpdateFirebaseToken(fcmToken: token));
    }
    setState(() {
      _token = token;
    });
    // print(" set FCM Token");
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {}
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      print(notification.body);
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'notif',
                styleInformation: DefaultStyleInformation(true, true),
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    //FirebaseAuth.getInstance().useEmulator('10.0.2.2', 9099);
    FirebaseMessaging.instance.getToken().then(setToken);

    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);

    context.read<HomeBloc>().add(HomePageRequested());
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    // _bloc.add(LoadHomeAds());
    // _categoriesBloc.add(LoadCategories());
    // _featuredBloc.add(LoadFeaturedAds());
    await Future.delayed(Duration(milliseconds: 1000));
    context.read<HomeBloc>().add(HomePageRequested());
    print("refresh");
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    // print(_token);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: kAppBarHeight,
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeLoadedSuccess) {
              return ReusableAppBar(
                leadingIcon: null,
                appBarTitle: AppLocalizations.of(context).home,
                isHome: true,
                newMessage: state.newMessage,
                newNotification: state.newNotification,
              );
            }
            return ReusableAppBar(
              leadingIcon: null,
              appBarTitle: AppLocalizations.of(context).home,
              isHome: true,
            );
          })),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () => _onRefresh(context),
        child: DoubleBackToCloseApp(
          child: Body(),
          snackBar: const SnackBar(
            behavior: SnackBarBehavior.floating,
            elevation: 6.0,
            content: Text(
              'Tap back again to leave',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.orange,
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
