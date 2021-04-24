import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:open_sism/components/appBar.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/game/daily_bonus/components/cardItem.dart';
import 'package:open_sism/screens/game/daily_bonus/components/buttom_clipper.dart';
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
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 8, top: 40),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: SizeConfig.screenHeight * 0.3,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CardItem(
                              imagePath: 'assets/images/logo.png',
                              title: 'Day one',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/logo.png',
                              title: 'Day Two',
                              description: 'spicy with garlic',
                              price: '24 Dt',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/logo.png',
                              title: 'Day Three',
                              description: 'with parmesan ',
                              price: '20 Dt',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/logo.png',
                              title: 'Day Four',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/logo.png',
                              title: 'Day Five',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/logo.png',
                              title: 'Day Six',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CardItem(
                              imagePath: 'assets/images/logo.png',
                              title: 'Day Seven',
                              description: 'Mix vegetables',
                              price: '15 DT',
                            ),
                          ],
                        ),
                      ),
                    ],
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

  CircleAvatar passwordIconWidget() {
    return CircleAvatar(
      maxRadius: 80,
      child: Container(child: Image.asset("assets/images/imgforgot.png")),
      //backgroundColor: Colors.white,
    );
  }
}
