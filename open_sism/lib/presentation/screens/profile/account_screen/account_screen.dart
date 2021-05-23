import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/profile/account_screen/components/body_account_screen.dart';
import 'package:open_sism/presentation/screens/profile/profile_screen.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = ProfileScreen.routeName + "/Account_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Account Settings')),
      // ),
      body: Container(
        height: double.infinity,
        decoration: kBoxDecoration,
        child: BodyAccount(),
      ),
    );
  }
}
