import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
//import 'home_header.dart';
//import 'popular_product.dart';
import 'special_offers.dart';
import 'package:open_sism/screens/home/components/gategories_grid.dart';

class Body extends StatelessWidget {
  bool discountBannerShow;

  @override
  Widget build(BuildContext context) {
    discountBannerShow = true;
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        decoration: kBoxDecoration,
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(40)),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenHeight(30)),
              DiscountBanner(isShown: true),
              Categories(),
              SizedBox(height: getProportionateScreenHeight(30)),
             // CategoriesGrid(),
             // SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
    );
  }
}
