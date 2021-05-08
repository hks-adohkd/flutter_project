import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/theme.dart';
import 'package:open_sism/presentation/screens/profile/help_support/components/help_support_body.dart';

class HelpSupportScreen extends StatelessWidget {
  static String routeName = "/Help_Support_Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Account Settings')),
      // ),
      body: Container(
        height: double.infinity,
        decoration: kBoxDecoration,
        child: BodyHelpSupport(),
      ),
    );
  }
}
