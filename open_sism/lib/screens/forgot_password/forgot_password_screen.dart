import 'package:flutter/material.dart';
import 'package:open_sism/components/appBar.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {

  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Forgot Password",
        ),
      ),
      body: Body(),
    );
  }
}