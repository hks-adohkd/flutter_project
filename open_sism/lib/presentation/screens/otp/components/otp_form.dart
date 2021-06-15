import 'package:flutter/material.dart';
import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';

import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:open_sism/main.dart";
import 'package:open_sism/presentation/screens/home/home_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class OtpForm extends StatefulWidget {
  final String phone;

  const OtpForm({Key key, @required this.phone}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    print(widget.phone);
    _verifyPhoneNumber();
    //_verifyPhone();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
    _auth.signOut();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  String code1 = "";
  String code2 = "";
  String code3 = "";
  String code4 = "";
  String code5 = "";
  String code6 = "";
  String code = "";
  String verificationCode;
  String _message = '';
  String _verificationId;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(30),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      setState(() {
                        code1 = value;
                        code = code1 + code2 + code3 + code4 + code5 + code6;
                      });
                      nextField(value, pin2FocusNode);
                      print(code);
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(30),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      setState(() {
                        code2 = value;
                        code = code1 + code2 + code3 + code4 + code5 + code6;
                      });
                      nextField(value, pin3FocusNode);
                      print(code);
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(30),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      setState(() {
                        code3 = value;
                        code = code1 + code2 + code3 + code4 + code5 + code6;
                      });
                      nextField(value, pin4FocusNode);
                      print(code);
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(30),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      setState(() {
                        code4 = value;
                        code = code1 + code2 + code3 + code4 + code5 + code6;
                      });
                      nextField(value, pin5FocusNode);
                      print(code);
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(30),
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      setState(() {
                        code5 = value;
                        code = code1 + code2 + code3 + code4 + code5 + code6;
                      });
                      print(code);
                      nextField(value, pin6FocusNode);
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(30),
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    //print(value);
                    if (value.length == 1) {
                      setState(() {
                        code6 = value;
                        code = code1 + code2 + code3 + code4 + code5 + code6;
                      });
                      print(code);
                      pin6FocusNode.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () async {
              FirebaseAuth auth = FirebaseAuth.instance;
              print(widget.phone);
              print(code);
              print(verificationCode);
              try {
                await FirebaseAuth.instance
                    .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: verificationCode, smsCode: code))
                    .then((value) async {
                  if (value.user != null) {
                    print("signIn");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
                  } else {
                    print("user not found ");
                  }
                });
              } catch (e) {
                // FocusScope.of(context).unfocus();
                // _scaffoldkey.currentState
                //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
              }
            },
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phone,
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  Future<String> setVerificationID(String verificationId) async {
    return verificationId;
  }

  // Example code of how to verify phone number
  Future<void> _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      print(
          'Phone number automatically verified and user signed in: $phoneAuthCredential');
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      print('Please check your phone for the verification code.');
      print(verificationId);

      setState(() {
        verificationCode = verificationId;
      });

      // print(" code sent verification ID :" + verificationId);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      setState(() {
        verificationCode = verificationId;
      });
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: widget.phone,
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      print('Failed to Verify Phone Number: $e');
      print(widget.phone);
    }
  }
}
