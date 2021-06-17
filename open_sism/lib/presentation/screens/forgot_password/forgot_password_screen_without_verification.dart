import 'package:flutter/material.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/forgot_password/components/bodyDirect.dart';

class ForgotPasswordScreenDirect extends StatelessWidget {
  static const String routeName = "/forgot_password_direct";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Forgot Password",
          isHome: false,
          leadingIcon: null,
        ),
      ),
      body: BodyDirect(),
    );
  }
}
