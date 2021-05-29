import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/home_repository.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_bloc.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/presentation/screens/activity/activity_screen.dart';
import 'package:open_sism/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:open_sism/presentation/screens/game/components/game_bundle.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:open_sism/presentation/screens/login/login_screen.dart';
import 'package:open_sism/presentation/screens/login_success/login_success_screen.dart';
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
import 'package:open_sism/presentation/screens/game/spin_games/golden_spin/goldspin_screen.dart';
import 'package:open_sism/presentation/screens/game/daily_bonus/dailyBonusScreen.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_bloc.dart';
import 'package:open_sism/logic/blocs/bonusBloc/bonus_bloc.dart';

class AppRouter {
  Connectivity connectivity;
  HomeBloc _homeBloc;
  PrizeBloc _prizeBloc;
  WheelBloc _wheelBloc;

  WheelPremiumBloc _wheelPremiumBloc;
  BonusBloc _bonusBloc;
  BonusPremiumBloc _bonusPremiumBloc;
  AppRouter({@required this.connectivity}) {
    _homeBloc = new HomeBloc(
      homeRepository: new HomeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );

    _prizeBloc = new PrizeBloc(
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );

    _wheelBloc = new WheelBloc(
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    _wheelPremiumBloc = new WheelPremiumBloc(
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    _bonusBloc = new BonusBloc(
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
    _bonusPremiumBloc = new BonusPremiumBloc(
      prizeRepository: new PrizeRepository(),
      internetCubit: new InternetCubit(connectivity: connectivity),
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => LoginScreen());
        break;
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
        break;
      case TaskScreen.routeName:
        return MaterialPageRoute(builder: (context) => TaskScreen());
      case RewardScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _prizeBloc,
                  child: RewardScreen(),
                ));
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (context) => ProfileScreenGradient());
      case LoginSuccessScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _homeBloc,
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
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _homeBloc),
              BlocProvider.value(value: _prizeBloc),
              BlocProvider.value(value: _bonusBloc),
              BlocProvider.value(value: _bonusPremiumBloc),
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
                  value: _bonusBloc,
                  child: DailyBonus(),
                ));
      default:
        return null;
    }
  }

  void dispose() {
    _homeBloc.close();
  }
}
