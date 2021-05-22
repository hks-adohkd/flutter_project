import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/components/form_error.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/otp/otp_screen.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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

  final _formKey = GlobalKey<FormState>();
  String phone;
  String email;
  String name;
  String password;
  String confirmPassword;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          buildPhoneFormField(),
          SizedBox(
            height: 30,
          ),
          buildNameFormField(),
          SizedBox(height: 30),
          buildEmailFormField(),
          SizedBox(
            height: 30,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 30,
          ),
          buildConfirmPasswordFormField(),
          FormError(errors: errors),
          SizedBox(
            height: 30,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                // TODO: Go to complete profile page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OtpScreen(
                              isRegister: true,
                              phoneNumber: phone,
                            )));
              }
            },
          )
        ],
      ),
    );
  }

  InternationalPhoneNumberInput buildPhoneFormField() {
    PhoneNumber number = PhoneNumber(isoCode: 'SY');

    return InternationalPhoneNumberInput(
      onInputChanged: (value) {
        setState(() {
          phone = value.phoneNumber;
        });
        if (value.phoneNumber.isNotEmpty) {
          removeError(error: kPhoneNullError);
        }
        if (phoneRegExp.hasMatch(value.phoneNumber)) {
          removeError(error: kInvalidPhoneError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        }
        if (!phoneRegExp.hasMatch(value)) {
          addError(error: kInvalidPhoneError);
          return "";
        }
        return null;
      },
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
      textStyle: TextStyle(color: Colors.white),
      initialValue: number,
      selectorConfig: SelectorConfig(
        setSelectorButtonAsPrefixIcon: true,
        trailingSpace: false,
        //selectorType: PhoneInputSelectorType.DIALOG,
      ),
      inputDecoration: InputDecoration(
        //labelText: "Phone",
        hintText: "Phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
      selectorTextStyle: TextStyle(color: Colors.white),
      searchBoxDecoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 40),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        if (value.length < 8) {
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

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        }
        if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.phone,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your Email (Optional)",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Name doesn't exist!");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Name doesn't exist!");
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.name,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }
}
