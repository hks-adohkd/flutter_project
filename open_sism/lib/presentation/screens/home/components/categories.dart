import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_bloc.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_event.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/activity/activity_screen.dart';
import 'package:open_sism/presentation/screens/game/daily_bonus/dailyBonusScreen.dart';
import 'package:open_sism/presentation/screens/game/game_screen.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:open_sism/presentation/screens/profile/profile_screen.dart';
import 'package:open_sism/presentation/screens/profile/setting_screen/Setting_screen.dart';
import 'package:open_sism/presentation/screens/reward/rewards_screen.dart';
import 'package:open_sism/presentation/screens/task/task_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/bonusBloc/bonus_bloc.dart';
import 'package:open_sism/logic/blocs/bonusBloc/bonus_event.dart';
import 'package:open_sism/logic/blocs/taskBloc/task_bloc.dart';
import 'package:open_sism/logic/blocs/taskBloc/task_event.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoriesFirst = [
      {"icon": "assets/icons/task.svg", "text": "Task"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/prize.svg", "text": "Reward"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/star1.svg", "text": "activity"},
      {"icon": "assets/icons/profile.svg", "text": "Profile"},
      {"icon": "assets/icons/more.svg", "text": "More"},
    ];

    List<String> routeList = [
      TaskScreen.routeName,
      GameScreen.routeName,
      RewardScreen.routeName,
      DailyBonus.routeName,
      ActivityScreen.routeName,
      ProfileScreen.routeName,
      SettingsScreen.routeName,
    ];

    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categoriesFirst.length,
                (index) => Container(
                  margin: EdgeInsets.all(8.0),
                  child: CategoryCard(
                    icon: categoriesFirst[index]["icon"],
                    text: categoriesFirst[index]["text"],
                    press: () {
                      print(index);
                      switch (index) {
                        case 0:
                          {
                            context.read<TaskBloc>().add(TaskPageRequested());
                          }
                          break;
                        case 2:
                          {
                            context.read<PrizeBloc>().add(PrizePageRequested());
                          }
                          break;
                        case 3:
                          {
                            //read if user is Premium or not
                            context.read<BonusBloc>().add(BonusPageRequested());
                          }
                          break;
                        default:
                          {
                            //statements;
                          }
                          break;
                      }

                      Navigator.pushNamed(context, routeList[index]);
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(48),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(1)),
              height: getProportionateScreenWidth(50),
              width: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF512DA8).withOpacity(0.05),
                //borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white60,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
