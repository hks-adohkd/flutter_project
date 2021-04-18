import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/profile/components/profile_theme.dart';
import 'package:open_sism/screens/profile/help_support/components/help_support_body.dart';
import 'package:open_sism/screens/profile/components/profile_constants.dart';

class HelpSupportScreen extends StatelessWidget {
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
          child: BodyHelpSupport(),
        ),
      ),
    );
  }
}
