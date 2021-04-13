import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';

class ReusableAppBar extends StatelessWidget {
  final String appBarTitle;
  ReusableAppBar({@required this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: LeadingAppBarIcon(),
      elevation: 5.0,
      backgroundColor: kAppBarBackgroundColor,
      centerTitle: true,
      shape: Cuvedshape(20),
      title: Container(
        margin: EdgeInsets.only(top: 25),
        child: Text(
          appBarTitle,
          textAlign: TextAlign.end,
          style: kAppBarTextStyle,
        ),
      ),
    );
  }
}

class LeadingAppBarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 8.0),
        child: Icon(
          Icons.home,
          color: kAppBarLeadingIconColor,
          size: kAppBarLeadingIconSize, // add custom icons also
        ),
      ),
    );
  }
}

class Cuvedshape extends ContinuousRectangleBorder {
  const Cuvedshape(this.curveheights);
  final double curveheights;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(rect.size.width / 2,
        rect.size.height + curveheights * 2, rect.size.width, rect.size.height)
    ..lineTo(rect.size.width, 0)
    ..close();
}
