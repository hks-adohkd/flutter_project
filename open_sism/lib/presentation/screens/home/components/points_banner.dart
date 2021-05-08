import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'dart:async';

Timer timer;

class PointsBanner extends StatelessWidget {
  final int points;
  final String badge;

  const PointsBanner({Key key, this.points = 0, this.badge = "bronze"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(1)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(5),
      ),
      decoration: kBoxDecoration.copyWith(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            points.toString(),
            style: TextStyle(
              fontSize: 24,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "  points",
            style: TextStyle(
              fontSize: 12,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
