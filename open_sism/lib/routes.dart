import 'package:flutter/material.dart';
import 'package:open_sism/screens/activity/activity_screen.dart';
import 'package:open_sism/screens/forgot_password/forgot_password_screen.dart';
import 'package:open_sism/screens/home/home_screen.dart';
import 'package:open_sism/screens/login/login_screen.dart';
import 'package:open_sism/screens/login_success/login_success_screen.dart';
import 'package:open_sism/screens/otp/otp_screen.dart';
import 'package:open_sism/screens/profile/account_screen/account_screen.dart';
import 'package:open_sism/screens/profile/help_support/Help_support_screen.dart';
import 'package:open_sism/screens/profile/profile_screen.dart';
import 'package:open_sism/screens/profile/ProfileScreenGradiant.dart';
import 'package:open_sism/screens/register/register_screen.dart';
import 'package:open_sism/screens/reward/rewards_screen.dart';
import 'package:open_sism/screens/task/task_screen.dart';
import 'package:open_sism/screens/activity/message/message_screen.dart';
import 'package:open_sism/screens/activity/order/order_screen.dart';
import 'main.dart';
import 'package:open_sism/screens/activity/finished_task/finished_task_screen.dart';
import 'package:open_sism/screens/profile/aboutus_screen/AboutUS_screen.dart';
import 'package:open_sism/screens/otp/otp_screen.dart';
import 'package:open_sism/screens/game/game_screen.dart';
import 'package:open_sism/screens/game/spin_games/spin/spin_screen.dart';
import 'package:open_sism/screens/game/spin_games/golden_spin/goldspin_screen.dart';
import 'package:open_sism/screens/game/daily_bonus/dailyBonusScreen.dart';

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
