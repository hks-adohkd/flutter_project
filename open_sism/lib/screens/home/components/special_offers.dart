import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            "Special for you",

            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            //press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/glap.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/tshirt.png",
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/ps4_console_blue_1.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/ps4_console_white_4.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/Image Popular Product 3.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  decoration: BoxDecoration(
                    ////

                    /////
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFB2EBF2).withOpacity(0.7),
                        Color(0xFF0097A7).withOpacity(0.50),
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Color(0xFF292432)),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
