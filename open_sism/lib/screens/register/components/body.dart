import 'package:flutter/material.dart';
import 'package:open_sism/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/components/default_button.dart';
import 'package:open_sism/components/form_error.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:open_sism/screens/register/components/register_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: kGradiantsPrimaryColor,
        ),
        border: Border.all(style: BorderStyle.solid, color: Colors.black),
      ),
      constraints: BoxConstraints.expand(),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: (SizeConfig.screenHeight * 0.02 + 30),
                ),
                Text(
                  "Register Account",
                  style: headingStyle,
                ),
                Text(
                  "Complete your details or continue",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                RegisterForm(),
                SizedBox(
                  height: (30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
