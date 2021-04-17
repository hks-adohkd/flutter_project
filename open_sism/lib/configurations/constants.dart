import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF84AB5C);
const kTextColor = Color(0xFF202E2E);
const kTextLightColor = Color(0xFF7286A5);

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

const kDefaultPaddin = 20.0;

const kGradiantsPrimaryColor = [
  Color(0xff512DA8),
  Color(0xff536DFE),
];

// Form Error
//final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final phoneRegExp = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
const String kPhoneNullError = "Please enter your phone number";
const String kInvalidPhoneError = "Please enter Valid Phone Number";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";