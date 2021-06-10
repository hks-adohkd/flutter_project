import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesGrid extends StatelessWidget {
  final String path = 'assets/icons/';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 2.0,
          color: Colors.lightBlueAccent,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(1)),
            //height: getProportionateScreenWidth(90),
            // width: getProportionateScreenWidth(90),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF512DA8).withOpacity(0.05),
              //borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              AppLocalizations.of(context).categories,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              //press: () {},
            ), //Image.asset('assets/images/logo21.png'),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: SizeConfig.screenHeight < 700
                ? SizeConfig.screenHeight * 0.19
                : SizeConfig.screenHeight * 0.18,
            child: GridView.count(
              crossAxisCount: 4,
              children: imageList
                  .map((item) => Column(
                        children: <Widget>[
                          // Image.asset(
                          //   '$path${item['name']}',
                          //   height: 50.0,
                          // ),
                          Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(1)),
                              height: getProportionateScreenWidth(30),
                              width: getProportionateScreenWidth(30),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF512DA8).withOpacity(0.05),
                                //borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset('$path${item['name']}')),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            item['title'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  //not used
  List<Map<String, dynamic>> categoriesFirst = [
    {"icon": "assets/icons/task.svg", "text": "Task"},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    {"icon": "assets/icons/prize.svg", "text": "Reward"},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    {"icon": "assets/icons/star1.svg", "text": "activity"},
    {"icon": "assets/icons/profile.svg", "text": "Profile"},
    {"icon": "assets/icons/more.svg", "text": "More"},
  ];

  final List imageList = [
    {'name': 'task.svg', 'title': 'Task'},
    {'name': 'Game Icon.svg', 'title': 'Game'},
    {'name': 'prize.svg', 'title': 'Reward'},
    {'name': 'Gift Icon.svg', 'title': 'Daily Gift'},
    {'name': 'star1.svg', 'title': 'activity'},
    {'name': 'profile.svg', 'title': 'Profile'},
    {'name': 'more.svg', 'title': 'More'},
  ];
}

//not used
class Category {
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});
}
