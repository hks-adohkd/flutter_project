import 'package:open_sism/components/appBar.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/login/components/Body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Login",
          leadingIcon: null,
        ),
      ),
      body: Body(),
    );
  }
}
