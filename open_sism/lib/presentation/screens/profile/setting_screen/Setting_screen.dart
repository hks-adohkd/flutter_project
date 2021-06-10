import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/profile/setting_screen/components/body.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/SettingsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Account Settings')),
      // ),
      body: Container(
        height: double.infinity,
        decoration: kBoxDecoration,
        child: SettingsBody(),
      ),
    );
  }
}
