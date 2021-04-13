import 'package:flutter/material.dart';
import 'package:open_sism/models/constants.dart';

const String appBarTitle = "Task";

class ReusableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {/* Write listener code here */},
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 15.0),
          child: Icon(
            Icons.home,
            color: kAppBarLeadingIconColor,
            size: 30, // add custom icons also
          ),
        ),
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
