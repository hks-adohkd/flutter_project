import 'package:flutter/material.dart';
import 'package:open_sism/components/appBar.dart';
import 'package:open_sism/configurations/constants.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Success",
        ),
      ),
      body: Body(),
    );
  }
}