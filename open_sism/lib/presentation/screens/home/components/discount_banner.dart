import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.star,
              size: 40,
              color: Colors.amber,
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
          ],
        ),
      ),
    );
  }
}
