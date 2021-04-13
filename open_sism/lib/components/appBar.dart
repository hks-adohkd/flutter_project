import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';

class ReusableAppBar extends StatelessWidget {
  final String appBarTitle;
  final IconData leadingIcon;
  ReusableAppBar({@required this.appBarTitle, this.leadingIcon = Icons.home});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: LeadingAppBarIcon(
        leadingIcon: leadingIcon,
      ),
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
  final IconData leadingIcon;
  LeadingAppBarIcon({this.leadingIcon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 8.0),
        child: Icon(
          leadingIcon,
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
