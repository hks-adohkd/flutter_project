import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/home_repository.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_bloc.dart';
import 'package:open_sism/logic/blocs/register/register_bloc.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/presentation/screens/activity/activity_screen.dart';
import 'package:open_sism/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:open_sism/presentation/screens/game/components/game_bundle.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:open_sism/presentation/screens/login/login_screen.dart';
import 'package:open_sism/presentation/screens/login_success/login_success_screen.dart';
import 'package:open_sism/presentation/screens/onBoardScreen/smart_onboarding.dart';
import 'package:open_sism/presentation/screens/otp/otp_screen.dart';
import 'package:open_sism/presentation/screens/profile/account_screen/account_screen.dart';
import 'package:open_sism/presentation/screens/profile/help_support/Help_support_screen.dart';
import 'package:open_sism/presentation/screens/profile/profile_screen.dart';
import 'package:open_sism/presentation/screens/profile/ProfileScreenGradiant.dart';
import 'package:open_sism/presentation/screens/register/register_screen.dart';
import 'package:open_sism/presentation/screens/reward/rewards_screen.dart';
import 'package:open_sism/presentation/screens/task/task_screen.dart';
import 'package:open_sism/presentation/screens/activity/message/message_screen.dart';
import 'package:open_sism/presentation/screens/activity/order/order_screen.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/finished_task_screen.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/AboutUS_screen.dart';
import 'package:open_sism/presentation/screens/game/game_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/spin/spin_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/spin/spin_screen_bloc.dart';

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

class AppRouter {
  final AppRepository appRepository = AppRepository();
  final UserRepository userRepository = UserRepository();

  Connectivity connectivity;
  HomeBloc homeBloc;
  PrizeBloc prizeBloc;
  TaskBloc taskBloc;
  WheelBloc _wheelBloc;
  AppBloc appBloc;
  LoginBloc loginBloc;
  RegisterBloc registerBloc;
  WheelPremiumBloc _wheelPremiumBloc;
  BonusBloc bonusBloc;
  BonusPremiumBloc bonusPremiumBloc;
  AppRouter({@required this.connectivity}) {
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
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );

    taskBloc = new TaskBloc(
      userRepository: userRepository,
      taskRepository: new TaskRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );

    _wheelBloc = new WheelBloc(
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
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    bonusPremiumBloc = new BonusPremiumBloc(
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: loginBloc),
                    BlocProvider.value(value: appBloc),
                  ],
                  child: LoginScreen(),
                ));
        break;
      case SmartOnBoardingPage.routeName:
        return MaterialPageRoute(builder: (context) => SmartOnBoardingPage());

        break;
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
        break;
      case TaskScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: taskBloc,
                  child: TaskScreen(),
                ));
      case RewardScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: prizeBloc,
                  child: RewardScreen(),
                ));
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: appBloc,
            child: ProfileScreenGradient(),
          ),
        );
      case LoginSuccessScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: homeBloc,
            child: LoginSuccessScreen(),
          ),
        );
      case AccountScreen.routeName:
        return MaterialPageRoute(builder: (context) => AccountScreen());
      case HelpSupportScreen.routeName:
        return MaterialPageRoute(builder: (context) => HelpSupportScreen());
      case ActivityScreen.routeName:
        return MaterialPageRoute(builder: (context) => ActivityScreen());
      case Messages.routeName:
        return MaterialPageRoute(builder: (context) => Messages());
      case FinishedTask.routeName:
        return MaterialPageRoute(builder: (context) => FinishedTask());
      case Order.routeName:
        return MaterialPageRoute(builder: (context) => Order());
      case AboutUs.routeName:
        return MaterialPageRoute(builder: (context) => AboutUs());
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
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: homeBloc),
              BlocProvider.value(value: prizeBloc),
              BlocProvider.value(value: bonusBloc),
              BlocProvider.value(value: bonusPremiumBloc),
              BlocProvider.value(value: appBloc),
              BlocProvider.value(value: taskBloc)
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
