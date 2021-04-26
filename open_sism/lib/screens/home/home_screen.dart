import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/home/components/body.dart';
import 'package:open_sism/components/appBar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          leadingIcon: null,
          appBarTitle: "Home",
        ),
      ),
      body: DoubleBackToCloseApp(
        child: Body(),
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
