import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/screens/task/components/body.dart';
import 'package:open_sism/presentation/components/appBar.dart';

import 'package:open_sism/presentation/screens/task/components/start_task_with_alert.dart';

class DetailsScreen extends StatelessWidget {
  final TaskBundle product;
  static const String routeName = "/detailsScreen";
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
      body: Body(),
      bottomNavigationBar: StartTaskAlertButton(),
    );
  }

  // not used in this version
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
