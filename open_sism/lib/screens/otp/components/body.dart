import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'otp_form.dart';
import 'package:open_sism/screens/otp/components/phone_form.dart';

class Body extends StatefulWidget {
  final String phoneNumber;
  final bool isRegister;
  Body({
    this.phoneNumber,
    @required this.isRegister,
  });
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool sendCode = false;
  @override
  Widget build(BuildContext context) {
    //sendCode = !widget.isRegister;
    return Container(
      height: double.infinity,
      decoration: kBoxDecoration,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text(
                  "OTP Verification",
                  style: headingStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image(
                    image: AssetImage('assets/images/otp-icon.png'),
                    height: 55.0,
                    width: 55.0,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Visibility(
                  visible: widget.isRegister,
                  child: Text("We sent your code to ${widget.phoneNumber}"),
                ),
                Visibility(
                  visible: !widget.isRegister,
                  child: PhoneForm(
                    readOnly: sendCode,
                  ),
                ),
                //SizedBox(height: SizeConfig.screenHeight * 0.001),
                Visibility(
                  visible:
                      !widget.isRegister ? (sendCode ? false : true) : false,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sendCode = true;
                      });
                      // OTP code resend
                    },
                    child: Text(
                      "Send OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Visibility(
                  child: buildTimer(),
                  visible: sendCode || widget.isRegister,
                ),
                Visibility(
                  visible: sendCode || widget.isRegister,
                  child: Column(
                    children: [
                      OtpForm(),
                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                      GestureDetector(
                        onTap: () {
                          // OTP code resend
                          setState(() {
                            if (widget.isRegister) {
                            } else {
                              sendCode = false;
                            }
                          });
                        },
                        child: Text(
                          "Resend OTP Code",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 120.0, end: 0.0),
          duration: Duration(seconds: 120),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
