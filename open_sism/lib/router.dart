import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/home_repository.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/logic/blocs/notificationBloc/notification_bloc.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_bloc.dart';
import 'package:open_sism/logic/blocs/redeemBloc/redeem_bloc.dart';
import 'package:open_sism/logic/blocs/register/register_bloc.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/presentation/screens/activity/activity_screen.dart';
import 'package:open_sism/presentation/screens/activity/notification/notification_screen.dart';
import 'package:open_sism/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:open_sism/presentation/screens/forgot_password/forgot_password_screen_without_verification.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:open_sism/presentation/screens/login/login_screen.dart';
import 'package:open_sism/presentation/screens/login_success/login_success_screen.dart';
import 'package:open_sism/presentation/screens/onBoardScreen/smart_onboarding.dart';
import 'package:open_sism/presentation/screens/otp/otp_screen.dart';
import 'package:open_sism/presentation/screens/profile/account_screen/account_screen.dart';
import 'package:open_sism/presentation/screens/profile/help_support/Help_support_screen.dart';
import 'package:open_sism/presentation/screens/profile/profile_screen.dart';
import 'package:open_sism/presentation/screens/profile/ProfileScreenGradiant.dart';
import 'package:open_sism/presentation/screens/profile/setting_screen/Setting_screen.dart';
import 'package:open_sism/presentation/screens/register/register_screen.dart';
import 'package:open_sism/presentation/screens/reward/components/redeem_screen.dart';
import 'package:open_sism/presentation/screens/reward/rewards_screen.dart';
import 'package:open_sism/presentation/screens/task/detailedTask_screen.dart';
import 'package:open_sism/presentation/screens/task/task_screen.dart';
import 'package:open_sism/presentation/screens/activity/message/message_screen.dart';
import 'package:open_sism/presentation/screens/activity/order/order_screen.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/finished_task_screen.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/AboutUS_screen.dart';
import 'package:open_sism/presentation/screens/game/game_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/spin/spin_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/spin/spin_screen_bloc.dart';
import 'package:open_sism/presentation/screens/task/tasks_screen/sport_match/sport_match_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/golden_spin/goldspin_screen.dart';
import 'package:open_sism/presentation/screens/game/daily_bonus/dailyBonusScreen.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_bloc.dart';
import 'package:open_sism/logic/blocs/bonusBloc/bonus_bloc.dart';
import 'package:open_sism/logic/blocs/login/login_bloc.dart';
import 'package:open_sism/data_layer/Repositories/app_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/blocs/taskBloc/task_bloc.dart';
import 'package:open_sism/data_layer/Repositories/task_repo.dart';
import 'package:open_sism/logic/blocs/finished_task_bloc/finishedTask_bloc.dart';
import 'package:open_sism/logic/blocs/contactUSBloc/contact_us_bloc.dart';
import 'package:open_sism/data_layer/Repositories/contact_us_repo.dart';
import 'package:open_sism/logic/blocs/requested_prize_bloc/requestedPrize_bloc.dart';
import 'package:open_sism/logic/blocs/profile/profile.dart';
import 'package:open_sism/logic/blocs/account/account.dart';
import 'package:open_sism/logic/blocs/password/password.dart';
import 'package:open_sism/logic/blocs/support_message/support.dart';
import 'package:open_sism/logic/blocs/aboutBloc/about.dart';
import 'package:open_sism/logic/blocs/singleTaskBloc/singleTask.dart';
import 'package:open_sism/logic/blocs/sport_match_bloc/match.dart';

class AppRouter {
  final AppRepository appRepository = AppRepository();
  final UserRepository userRepository = UserRepository();
  final ContactUSRepository contactUsRepository = ContactUSRepository();
  Connectivity connectivity;
  HomeBloc homeBloc;
  AboutBloc aboutBloc;
  PrizeBloc prizeBloc;
  RedeemBloc redeemBloc;
  RequestedPrizeBloc requestedPrizeBloc;
  TaskBloc taskBloc;
  SingleTaskBloc singleTaskBloc;
  ContactUsBloc contactUSBloc;
  NotificationBloc notificationBloc;
  FinishedTaskBloc finishedTaskBloc;
  WheelBloc _wheelBloc;
  AppBloc appBloc;
  LoginBloc loginBloc;
  RegisterBloc registerBloc;
  WheelPremiumBloc _wheelPremiumBloc;
  BonusBloc bonusBloc;
  BonusPremiumBloc bonusPremiumBloc;
  ProfileBloc profileBloc;
  AccountBloc accountBloc;
  PasswordBloc passwordBloc;
  SupportBloc supportBloc;
  MatchBloc matchBloc;
  AppRouter({@required this.connectivity}) {
    profileBloc = new ProfileBloc(
        userRepository: userRepository,
        internetCubit: new InternetCubit(connectivity: connectivity));
    accountBloc = new AccountBloc(
        userRepository: userRepository,
        internetCubit: new InternetCubit(connectivity: connectivity));
    passwordBloc = new PasswordBloc(
        userRepository: userRepository,
        internetCubit: new InternetCubit(connectivity: connectivity));
    supportBloc = new SupportBloc(
        contactUsRepository: contactUsRepository,
        userRepository: userRepository,
        internetCubit: new InternetCubit(connectivity: connectivity));
    appBloc = new AppBloc(
        appRepository: appRepository,
        userRepository: userRepository,
        internetCubit: new InternetCubit(connectivity: connectivity));

    loginBloc = new LoginBloc(
        appBloc: appBloc,
        userRepository: new UserRepository(),
        internetCubit: new InternetCubit(connectivity: connectivity));

    registerBloc = new RegisterBloc(
        appBloc: appBloc,
        userRepository: new UserRepository(),
        internetCubit: new InternetCubit(connectivity: connectivity));
    homeBloc = new HomeBloc(
      appBloc: appBloc,
      userRepository: userRepository,
      homeRepository: new HomeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );

    prizeBloc = new PrizeBloc(
      userRepository: userRepository,
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );

    redeemBloc = new RedeemBloc(
      userRepository: userRepository,
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    taskBloc = new TaskBloc(
      userRepository: userRepository,
      taskRepository: new TaskRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    singleTaskBloc = new SingleTaskBloc(
      userRepository: userRepository,
      taskRepository: new TaskRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    matchBloc = new MatchBloc(
      userRepository: userRepository,
      taskRepository: new TaskRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    contactUSBloc = new ContactUsBloc(
      userRepository: userRepository,
      contactUSRepository: new ContactUSRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    aboutBloc = new AboutBloc(
      userRepository: userRepository,
      appRepository: appRepository,
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    notificationBloc = new NotificationBloc(
      userRepository: userRepository,
      internetCubit: new InternetCubit(connectivity: connectivity),
    );

    finishedTaskBloc = new FinishedTaskBloc(
      userRepository: userRepository,
      taskRepository: new TaskRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    requestedPrizeBloc = new RequestedPrizeBloc(
      userRepository: userRepository,
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    _wheelBloc = new WheelBloc(
      userRepository: userRepository,
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    _wheelPremiumBloc = new WheelPremiumBloc(
      appRepository: appRepository,
      userRepository: userRepository,
      homeRepository: new HomeRepository(),
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    bonusBloc = new BonusBloc(
      userRepository: userRepository,
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    bonusPremiumBloc = new BonusPremiumBloc(
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    print(routeSettings.name);

    switch (routeSettings.name) {
      case SettingsScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: loginBloc),
                    BlocProvider.value(value: appBloc),
                  ],
                  child: SettingsScreen(),
                ));
        break;
      // case WebViewHome.routeName:
      //   return MaterialPageRoute(
      //       builder: (context) => MultiBlocProvider(
      //             providers: [
      //               BlocProvider.value(value: loginBloc),
      //               BlocProvider.value(value: appBloc),
      //             ],
      //             child: WebViewHome(),
      //           ));
      //   break;
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: loginBloc),
                    BlocProvider.value(value: appBloc),
                  ],
                  child: LoginScreen(),
                ),
            settings: routeSettings);
        break;
      case SmartOnBoardingPage.routeName:
        return MaterialPageRoute(builder: (context) => SmartOnBoardingPage());

        break;
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
        break;
      case TaskScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: taskBloc),
                    BlocProvider.value(value: singleTaskBloc),
                  ],
                  child: TaskScreen(),
                ),
            settings: routeSettings);
      case DetailsScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: singleTaskBloc),
                    BlocProvider.value(value: matchBloc),
                  ],
                  child: DetailsScreen(),
                ),
            settings: routeSettings);
      case SportMatchScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: singleTaskBloc),
                    BlocProvider.value(value: matchBloc),
                  ],
                  child: SportMatchScreen(),
                ),
            settings: routeSettings);
      case RewardScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: prizeBloc),
                    BlocProvider.value(value: redeemBloc),
                  ],
                  child: RewardScreen(),
                ),
            settings: routeSettings);
      case ForgotPasswordScreenDirect.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: appBloc),
                    BlocProvider.value(value: passwordBloc),
                  ],
                  child: ForgotPasswordScreenDirect(),
                ),
            settings: routeSettings);
        break;
      case ProfileScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: appBloc),
                    BlocProvider.value(value: profileBloc),
                    BlocProvider.value(value: accountBloc),
                    BlocProvider.value(value: supportBloc),
                    BlocProvider.value(value: aboutBloc),
                  ],
                  child: ProfileScreenGradient(),
                ),
            settings: routeSettings);
        break;
      case LoginSuccessScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: homeBloc,
            child: LoginSuccessScreen(),
          ),
        );
      case AccountScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: appBloc),
                    BlocProvider.value(value: accountBloc),
                    BlocProvider.value(value: passwordBloc),
                  ],
                  child: AccountScreen(),
                ),
            settings: routeSettings);
        break;
      case RedeemScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: redeemBloc),
                    BlocProvider.value(value: homeBloc),
                  ],
                  child: RedeemScreen(),
                ),
            settings: routeSettings);
      case HelpSupportScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: appBloc),
                    BlocProvider.value(value: supportBloc),
                  ],
                  child: HelpSupportScreen(),
                ),
            settings: routeSettings);
        break;
      case ActivityScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: finishedTaskBloc),
                    BlocProvider.value(value: contactUSBloc),
                    BlocProvider.value(value: requestedPrizeBloc),
                  ],
                  child: ActivityScreen(),
                ));
        break;

      case Messages.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: contactUSBloc,
            child: Messages(),
          ),
        );
      case Notifications.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: notificationBloc,
            child: Notifications(),
          ),
        );
      case FinishedTask.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: finishedTaskBloc,
            child: FinishedTask(),
          ),
        );
      case Order.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: requestedPrizeBloc,
            child: Order(),
          ),
        );
      case AboutUs.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: appBloc),
                    BlocProvider.value(value: aboutBloc),
                  ],
                  child: AboutUs(),
                ),
            settings: routeSettings);
        break;
      case RegisterScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: registerBloc),
                    BlocProvider.value(value: appBloc),
                  ],
                  child: RegisterScreen(),
                ));
        break;
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: homeBloc),
              BlocProvider.value(value: prizeBloc),
              BlocProvider.value(value: bonusBloc),
              BlocProvider.value(value: bonusPremiumBloc),
              BlocProvider.value(value: appBloc),
              BlocProvider.value(value: taskBloc),
              BlocProvider.value(value: notificationBloc),
            ],
            child: HomeScreen(),
          ),
        );
      case OtpScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => OtpScreen(isRegister: false));
      case GameScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _wheelBloc),
                    BlocProvider.value(value: _wheelPremiumBloc),
                  ],
                  child: GameScreen(),
                ));
      case WhellFortune.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _wheelBloc,
                  child: WhellFortune(),
                ));

      case GoldWheelFortune.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _wheelPremiumBloc,
                  child: GoldWheelFortune(),
                ));
      case DailyBonus.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: bonusBloc,
                  child: DailyBonus(),
                ));
      default:
        return null;
    }
  }

  void dispose() {
    homeBloc.close();
  }
}
