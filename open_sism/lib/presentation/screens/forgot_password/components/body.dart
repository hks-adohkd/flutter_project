import 'package:flutter/material.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/components/form_error.dart';
import 'package:open_sism/presentation/components/no_account_text.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/otp/otp_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                ),
                Text(
                  "Please enter your phone number and we will send you a code via a message",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                ),
                ForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String phone;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (newValue) => phone = newValue,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kPhoneNullError)) {
                  setState(() {
                    errors.remove(kPhoneNullError);
                  });
                } else if (phoneRegExp.hasMatch(value) &&
                    errors.contains(kInvalidPhoneError)) {
                  setState(() {
                    errors.remove(kInvalidPhoneError);
                  });
                }
                return null;
              },
              validator: (value) {
                if (value.isEmpty && !errors.contains(kPhoneNullError)) {
                  setState(() {
                    errors.add(kPhoneNullError);
                  });
                } else if (!phoneRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidPhoneError)) {
                  setState(() {
                    errors.add(kInvalidPhoneError);
                  });
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone",
                hintText: "Enter your phone number",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
              ),
            ),
            SizedBox(height: 30),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState.validate()) {
                    // TODO: send verification code via message
                    Navigator.pushNamed(context, OtpScreen.routeName);
                  }
                }),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            NoAccountText(),
          ],
        ));
  }
}
