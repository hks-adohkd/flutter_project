import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_sism/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/components/default_button.dart';
import 'package:open_sism/components/form_error.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/forgot_password/forgot_password_screen.dart';
import 'package:open_sism/screens/login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  bool remember = false;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(
            height: 30,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
              ),
              Text(
                "Remember me",
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: 20),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNullError);
        } else if (phoneRegExp.hasMatch(value)) {
          removeError(error: kInvalidPhoneError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        } else if (!phoneRegExp.hasMatch(value)) {
          addError(error: kInvalidPhoneError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.phone,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Phone",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
    );
  }
}
