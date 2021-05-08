import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/components/form_error.dart';
import 'package:open_sism/presentation/components/no_account_text.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/login/components/sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: kGradiantsPrimaryColor,
          ),
          border: Border.all(style: BorderStyle.solid, color: Colors.black),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in with your phone number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    SignForm(),
                    SizedBox(
                      height: 20,
                    ),
                    NoAccountText()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
