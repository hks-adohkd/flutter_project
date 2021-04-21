import 'package:flutter/material.dart';
import 'package:open_sism/components/appBar.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/register/components/body.dart';

class RegisterScreen extends StatelessWidget {

  static String routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Register",
        ),
      ),
      body: Body(),
    );
  }
}
