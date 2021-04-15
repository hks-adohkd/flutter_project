import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'file:///E:/AndroidApp/opensism/open_sism/lib/screens/task/components/taskBundel.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'time_and_preson.dart';
import 'description.dart';
import 'product_title_with_image.dart';
import 'start_task_with_alert.dart';

class Body extends StatelessWidget {
  final TaskBundle product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    SizeConfig().init(context); // to get the screen size

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.screenHeight,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.4),
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.10,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topRight,
                    //   end: Alignment.bottomLeft,
                    //   colors: [
                    //     Color(0xFF7C4DFF),
                    //     Colors.white70,
                    //   ],
                    // ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      // AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
