import 'package:flutter/material.dart';
//import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/home/components/body.dart';
import 'package:open_sism/components/appBar.dart';
import 'package:open_sism/configurations/size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          leadingIcon: Icons.emoji_people,
          appBarTitle: "Home",
        ),
      ),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}