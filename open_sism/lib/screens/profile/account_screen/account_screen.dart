import 'package:flutter/material.dart';
import 'package:open_sism/screens/profile/account_screen/components/body_account_screen.dart';
import 'package:open_sism/screens/profile/components/profile_theme.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: Text('Account Settings')),
        // ),
        body: BodyAccount(),
      ),
    );
  }
}
