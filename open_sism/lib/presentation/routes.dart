import 'package:flutter/material.dart';
import 'package:open_sism/presentation/screens/activity/activity_screen.dart';
import 'package:open_sism/presentation/screens/forgot_password/forgot_password_screen.dart';
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
import 'package:open_sism/main.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/finished_task_screen.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/AboutUS_screen.dart';
import 'package:open_sism/presentation/screens/otp/otp_screen.dart';
import 'package:open_sism/presentation/screens/game/game_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/spin/spin_screen.dart';
import 'package:open_sism/presentation/screens/game/spin_games/golden_spin/goldspin_screen.dart';
import 'package:open_sism/presentation/screens/game/daily_bonus/dailyBonusScreen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  TaskScreen.routeName: (context) => TaskScreen(),
  RewardScreen.routeName: (context) => RewardScreen(),
  ProfileScreen.routeName: (context) => ProfileScreenGradient(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
  HelpSupportScreen.routeName: (context) => HelpSupportScreen(),
  ActivityScreen.routeName: (context) => ActivityScreen(),
  Messages.routeName: (context) => Messages(),
  Order.routeName: (context) => Order(),
  FinishedTask.routeName: (context) => FinishedTask(),
  AboutUs.routeName: (context) => AboutUs(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  GameScreen.routeName: (context) => GameScreen(),
  WhellFortune.routeName: (context) => WhellFortune(),
  GoldWheelFortune.routeName: (context) => GoldWheelFortune(),
  DailyBonus.routeName: (context) => DailyBonus(),
  WhellFortune.routeName: (context) => WhellFortune(),
  GoldWheelFortune.routeName: (context) => GoldWheelFortune(),
};
