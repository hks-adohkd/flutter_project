import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:open_sism/data_layer/Repositories/app_repo.dart';
import 'package:open_sism/data_layer/Repositories/app_repo.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/logic/blocs/app/app_event.dart';
import 'package:open_sism/presentation/configurations/custom_text.dart';
import 'package:open_sism/presentation/screens/login/login_screen.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool visible = false;

class SmartOnBoardingPage extends StatelessWidget {
  static const String routeName = "/onBoarding_screen";
  final pages = [
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Welcome to Smart Wallet'),
          Text(
            'Welcome To Open Sism',
            style: TextStyle(color: Colors.blueAccent, fontSize: 30.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/logoBodyCircle.png',
        width: 200.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Welcome to Smart Wallet'),
          Text(
            'Plan your finance, anytime, anywhere.',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/wallet1.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('One Touch Send Money'),
          Text(
            'Send money in just one touch and organize your wallet smart.',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/wallet2.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Automatically Organize'),
          Text(
            'Organize your expenses and incomes and secure your wallet with pin.',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/wallet3.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = new AppRepository();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                //LoginScreen();
                // appRepository.setIfOpenedBefore(true);
                //context.read<AppBloc>().add(WalkthroughCompleted());
                Navigator.pushNamed(context, LoginScreen.routeName);
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => LoginScreen(),
                //   ),
                // );
              },
              showSkipButton: false,
              doneText: Text(
                "Get Started",
              ),
              pageButtonsColor: Colors.indigo,
              pageButtonTextStyles: new TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),
            Visibility(
              visible: false,
              child: Positioned(
                  top: 30.0,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
