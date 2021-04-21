import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:open_sism/components/appBar.dart';

class GameScreen extends StatelessWidget {
  static String routeName = "/game";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Game",
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: kGradiantsPrimaryColor,
            ),
            border: Border.all(style: BorderStyle.solid, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
