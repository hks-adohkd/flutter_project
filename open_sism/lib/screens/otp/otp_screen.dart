import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  final bool isRegister;
  OtpScreen({@required this.isRegister});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Body(
          isRegister: isRegister,
          phoneNumber: "+963934631746",
        ),
      ),
    );
  }
}
