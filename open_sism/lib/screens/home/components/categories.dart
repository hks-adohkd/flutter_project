import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_sism/configurations/size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoriesFirst = [
      {"icon": "assets/icons/task.svg", "text": "Task"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/prize.svg", "text": "Reward"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/activity.svg", "text": "activity"},
      {"icon": "assets/icons/profile.svg", "text": "Profile"},
      {"icon": "assets/icons/more.svg", "text": "More"},
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
                    press: () {},
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
              height: getProportionateScreenWidth(30),
              width: getProportionateScreenWidth(30),
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
