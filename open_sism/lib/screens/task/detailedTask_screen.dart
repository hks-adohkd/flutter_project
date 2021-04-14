import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/taskBundel.dart';
import 'package:open_sism/screens/task/components/body.dart';
import 'package:open_sism/components/appBar.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:open_sism/screens/task/components/add_to_cart.dart';

class DetailsScreen extends StatelessWidget {
  final TaskBundle product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Color(0xFF512DA8),
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Task Details",
        ),
      ),
      body: Body(product: product),
      bottomNavigationBar: AddToCart(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
