import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'time_and_preson.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    SizeConfig().init(context); // to get the screen size

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.screenHeight * 1.2,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.3),
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.02,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 1),
                      TimeAndPerson(),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(),
                      SizedBox(height: kDefaultPaddin / 2),
                      // AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
