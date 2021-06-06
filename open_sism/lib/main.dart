import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/app_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:open_sism/presentation/screens/offline/offline.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/logic/blocs/app/app_event.dart';
import 'package:open_sism/logic/blocs/app/app_state.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:open_sism/presentation/components/loading.dart';
import 'package:open_sism/presentation/screens/onBoardScreen/smart_onboarding.dart';
import 'package:open_sism/router.dart';
import 'package:open_sism/presentation/screens/login/login_screen.dart';
import 'package:open_sism/presentation/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Connectivity connectivity = Connectivity();
  AppRouter _appRouter = AppRouter(connectivity: connectivity);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _appRouter.homeBloc),
        // BlocProvider<HomeAdsBloc>(
        //   create: (context) => HomeAdsBloc(dataRepository, userRepository),
        // ),
        BlocProvider.value(value: _appRouter.appBloc),
        BlocProvider.value(value: _appRouter.taskBloc),
        BlocProvider.value(value: _appRouter.bonusBloc),
        BlocProvider.value(value: _appRouter.bonusPremiumBloc),
        BlocProvider.value(value: _appRouter.prizeBloc),
        BlocProvider(
          create: (_) => InternetCubit(connectivity: connectivity),
        ),
      ],
      child: Phoenix(
        child: OpenSism(
          appRepository: _appRouter.appRepository,
          userRepository: _appRouter.userRepository,
          appRouter: _appRouter,
        ),
      ),
    );

    BlocProvider(
      create: (_) => InternetCubit(connectivity: connectivity),
      //lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        //initialRoute: LoginScreen.routeName,
        onGenerateRoute: _appRouter.onGenerateRoute,
        //home: ,
      ),
    );
  }
}

class OpenSism extends StatefulWidget {
  final AppRepository appRepository;
  final UserRepository userRepository;
  final AppRouter appRouter;
  const OpenSism({
    Key key,
    this.appRepository,
    this.userRepository,
    this.appRouter,
  }) : super(key: key);
  @override
  _OpenSismState createState() => _OpenSismState();
}

class _OpenSismState extends State<OpenSism> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppRepository>(
          create: (context) => this.widget.appRepository,
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => this.widget.userRepository,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: this.widget.appRouter.onGenerateRoute,
        title: 'Open Sism',
        theme: theme(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', 'AR'),
          const Locale('en', 'EN'),
        ],
        home: BlocBuilder<AppBloc, AppState>(
          //bloc: widget.appRouter.appBloc,
          //ignore: missing_return
          builder: (context, state) {
            if (state is AppInitial || state is LoadingState) {
              return LoadingWidget();
            }
            if (state is AppReady) {
              return state.showWalkthrough
                  ? SmartOnBoardingPage()
                  : HomeScreen();
              // return LoginScreen();
            }
            if (state is AppOutdated) {
              // return Outdated();
              return Container(
                child: Text("Outdated"),
              );
            }
            if (state is AppOffline) {
              Future.delayed(const Duration(milliseconds: 2000), () {
                return Offline(
                  callback: () {
                    context.read<AppBloc>().add(AppStarted());
                    // _appBloc.add(AppStarted());
                  },
                );
              });

              // return Container(
              //   child: Text("AppOffline"),
              // );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
