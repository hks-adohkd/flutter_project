import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/configurations/constants.dart';

class RecipeBundelCard extends StatelessWidget {
  final recipeBundle;
  final Function press;
  final ScreenType selectedGender;
  const RecipeBundelCard(
      {Key key,
      @required this.recipeBundle,
      this.press,
      @required this.selectedGender})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: selectedGender == ScreenType.task
                    ? cardTaskDesign(defaultSize)
                    : cardPrizeDesign(
                        defaultSize), // this method implemented in bottom
              ),
            ),
            SizedBox(width: defaultSize * 0.1), //5
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                "assets/images/googlePlay.png",
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container cardTaskDesign(double defaultSize) {
    return Container(
      //alignment: Alignment.centerLeft,
      height: 160,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Spacer(),
          Text(
            recipeBundle.title,
            style: TextStyle(
                fontSize: defaultSize * 2.0, //22
                color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: defaultSize * 0.5), // 5
          // Text(
          //   recipeBundle.description,
          //   style: TextStyle(color: Colors.white),
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          // ),
          SizedBox(height: defaultSize * 0.5),
          buildInfoRow(
            defaultSize,
            iconSrc: "assets/icons/pot.svg",
            iconData: Icons.alarm,
            text: "${recipeBundle.hours}",
          ),
          SizedBox(height: defaultSize * 0.5), //5
          buildInfoRow(
            defaultSize,
            iconData: Icons.face,
            iconSrc: "assets/icons/chef.svg",
            text: "${recipeBundle.person} Person",
          ),
          SizedBox(height: defaultSize * 0.5),
          buildInfoRow(
            defaultSize,
            iconData: Icons.star,
            iconSrc: "assets/icons/chef.svg",
            text: "${recipeBundle.points} Points",
          ),
        ],
      ),
    );
  }

  Container cardPrizeDesign(double defaultSize) {
    return Container(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            recipeBundle.title,
            style: TextStyle(
                fontSize: defaultSize * 2.5, //22
                color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: defaultSize * 1.5), // 5
          Text(
            recipeBundle.title + " From OpenSimsm Team",
            style: TextStyle(color: Colors.white, fontSize: 11),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: defaultSize * 1.5),
          buildInfoRow(
            defaultSize,
            iconData: Icons.star,
            text: "${recipeBundle.points} Points",
          ),
          SizedBox(height: defaultSize * 1.2), //5
          Center(
            child: Text(
              recipeBundle.value,
              style: TextStyle(
                fontSize: defaultSize * 2.5, //22
                color: Color(0xFF512DA8),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildInfoRow(double defaultSize,
      {String iconSrc, text, IconData iconData}) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: selectedGender == ScreenType.task
              ? Colors.white
              : Color(0xFFFFC107),
        ),
        //SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize), // 10
        Text(
          text,
          style: TextStyle(
            color: selectedGender == ScreenType.task
                ? Colors.white
                : Color(0xFFFFC107),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
