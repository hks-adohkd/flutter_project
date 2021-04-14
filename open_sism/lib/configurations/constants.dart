import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF84AB5C);
const kTextColor = Color(0xFF202E2E);
const kTextLigntColor = Color(0xFF7286A5);

const kAppBarHeight = Size.fromHeight(50);
const kAppBarLeadingIconSize = 40.0;
const kAppBarBackgroundColor = Color(0xff512DA8);
const kAppBarLeadingIconColor = Colors.white; //Color(0xff002984);
const kAppBarTitleColor = Color(0xffD1C4E9);

const kAppBarTextStyle = TextStyle(
  letterSpacing: 2,
  fontSize: 30,
  color: kAppBarTitleColor,
  fontFamily: 'Pacifico',
  fontWeight: FontWeight.bold,
);

const kYoutubeCardColor = Colors.black45;
const kWatchVideoCardColor = Color(0xFF90AF17);
const kQuestionnaireCardColor = Color(0xFF2DBBD8);

enum ScreenType {
  task,
  prize,
}
enum MenuState { home, activity, game, profile, Task, rewards, more }

const kGooglePlayCardColor = Color(0xFF2DBBD8);
const kSyriatelCardColor = Color(0xFFD82D40);
const kMtnCardColor = Color(0xFFFFA000);
