import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';

//import 'categories.dart';
//import 'discount_banner.dart';
//import 'home_header.dart';
//import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              // Color(0xff002171),
              // Color(0xff8bf6ff),
              Color(0xff512DA8),
              Color(0xff536DFE),
            ],
          ),
          border: Border.all(style: BorderStyle.solid, color: Colors.black),
        ),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(40)),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
    );
  }
}
