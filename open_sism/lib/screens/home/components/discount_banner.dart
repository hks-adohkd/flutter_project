import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'dart:async';

Timer timer;

class DiscountBanner extends StatelessWidget {
  final bool isShown;

  const DiscountBanner({Key key, this.isShown = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isShown ? 1.0 : 0.0,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(10)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: kBoxDecoration,
        child: Row(children: [
          Icon(
            Icons.star,
            size: 40,
            color: Colors.red,
          ),
          Text.rich(
            TextSpan(
              style: TextStyle(
                color: Color(0xFF212121),
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "A  Surpise\n",
                ),
                TextSpan(
                  text: "Your points will be +20",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
