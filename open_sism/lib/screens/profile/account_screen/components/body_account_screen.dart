import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:open_sism/screens/profile/account_screen/components/account_screen_form.dart';
import 'package:open_sism/configurations/constants.dart';

class BodyAccount extends StatefulWidget {
  @override
  _BodyAccountState createState() => _BodyAccountState();
}

class _BodyAccountState extends State<BodyAccount> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Account Setting", style: kHeadingStyle),
                Text(
                  "Complete your details ",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                AccountScreenForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
