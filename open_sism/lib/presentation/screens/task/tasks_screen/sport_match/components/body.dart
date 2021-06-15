import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/task/tasks_screen/sport_match/components/sport_match_form.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/tasks_screen/sport_match/components/body.dart';

class BodySportMatch extends StatefulWidget {
  @override
  _BodySportMatchState createState() => _BodySportMatchState();
}

class _BodySportMatchState extends State<BodySportMatch> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: SizeConfig.screenHeight * 0.05), // 4%
                //SizedBox(height: SizeConfig.screenHeight * 0.08),
                SportMatchForm(),
                // SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
