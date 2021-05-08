import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/game/daily_bonus/components/cardItem.dart';
import 'package:open_sism/presentation/screens/game/daily_bonus/components/buttom_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyBonus extends StatefulWidget {
  static String routeName = "/daily_bonus_screen";
  @override
  _DailyBonusState createState() => _DailyBonusState();
}

class _DailyBonusState extends State<DailyBonus> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: kAppBarHeight,
          child: ReusableAppBar(
            appBarTitle: "Daily Bonus",
          ),
        ),
        body: Container(
          decoration: kBoxDecoration,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'Daily',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Surfer',
                        color: Colors.yellow[700],
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 8, top: 10),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: SizeConfig.screenHeight * 0.3,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CardItem(
                              imagePath: 'assets/images/1.png',
                              title: 'Day one',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/2.png',
                              title: 'Day Two',
                              description: 'spicy with garlic',
                              price: '24 Dt',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/3.png',
                              title: 'Day Three',
                              description: 'with parmesan ',
                              price: '20 Dt',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/4.png',
                              title: 'Day Four',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/5.png',
                              title: 'Day Five',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/6.png',
                              title: 'Day Six',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/7.png',
                              title: 'Day Seven',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Weekly',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Surfer',
                      color: Colors.yellow[700],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  passwordIconWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stack passwordIconWidget() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: CircleAvatar(
            maxRadius: 30,
            child: Container(child: Image.asset("assets/images/imgforgot.png")),
            //backgroundColor: Colors.white,
          ),
        ),
        Opacity(
          opacity: 0.2,
          child: Image.asset(
            "assets/images/giftt.png",
            height: 150,
            width: 150,
          ),
        ),
      ],
    );
  }
}
