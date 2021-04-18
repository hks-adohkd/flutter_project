import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/profile/account_screen/components/body_account_screen.dart';
import 'package:open_sism/screens/profile/profile_screen.dart';
import 'package:open_sism/theme.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = ProfileScreen.routeName + "/Account_Screen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: Text('Account Settings')),
        // ),
        body: Container(
          height: double.infinity,
          decoration: kBoxDecoration,
          child: BodyAccount(),
        ),
      ),
    );
  }
}
