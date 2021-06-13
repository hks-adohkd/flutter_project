import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/tasks_screen/sport_match/components/body.dart';

class SportMatchScreen extends StatelessWidget {
  static const String routeName = "/sport_match_Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Account Settings')),
      // ),

      body: Container(
        height: double.infinity,
        decoration: kBoxDecoration.copyWith(
          image: DecorationImage(
            image: AssetImage("assets/images/playGround1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BodySportMatch(),
      ),
    );
  }
}
