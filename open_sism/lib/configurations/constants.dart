import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';

const String youtubeChannel = "https://youtube.com/c/UCRYieA2e9jaDIb-8mLPrzUA";
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

enum TaskTypes {
  youtube,
  video,
  quiz,
  link,
}

enum MenuState { home, activity, game, profile, Task, rewards, more }

const kGooglePlayCardColor = Color(0xFF2DBBD8);
const kSyriatelCardColor = Color(0xFFD82D40);
const kMtnCardColor = Color(0xFFAFB42B);

var kBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: kGradiantsPrimaryColor,
  ),
  border: Border.all(style: BorderStyle.solid, color: Colors.black),
);

const kDefaultPaddin = 20.0;

const kGradiantsPrimaryColor = [
  Color(0xff512DA8),
  Color(0xff536DFE),
];

const kHeadingStyle = TextStyle(
  color: Colors.white,
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
final phoneRegExp = RegExp(r"\(?\d+\)?[-.\s]?\d+[-.\s]?\d+");
const String kPhoneNullError = "Please enter your phone number";
const String kInvalidPhoneError = "Please enter Valid Phone Number";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

enum ActivityType {
  message,
  order,
  finished_task,
}

const pendingColor = Color(0xffE64A19);
const verifiedColor = Color(0xff689F38);
const rejectColor = Color(0xffD32F2F);

const TextStyle headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  height: 1.5,
  color: Colors.white,
);

//OTP
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
    borderSide: BorderSide(color: kTextColor),
  );
}
