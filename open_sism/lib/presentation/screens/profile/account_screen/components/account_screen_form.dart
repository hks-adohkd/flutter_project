import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/profile/components/default_Button.dart';
import 'package:open_sism/presentation/screens/profile/components/form_error.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';

class AccountScreenForm extends StatefulWidget {
  @override
  _AccountScreenFormState createState() => _AccountScreenFormState();
}

class _AccountScreenFormState extends State<AccountScreenForm> {
  String email = "Mohammed.yazbek@gmail.com";
  String name = "Yazbek";
  String password = "password";
  String address = "damascus";
  String confirmPassword;
  String phone = "934631746";
  bool showPassword = false;
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameField('Name', 'Enter your Name'),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          buildEmailFormField(),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          buildAddressField('Address', 'Enter your Address'),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          buildPasswordFormField(),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          buildPhoneFormField(),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => {},
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * 0.04),
              InkWell(
                onTap: () => {},
                child: Text(
                  "Change Phone Number",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          DefaultButton(
            text: "Save",
            icon: Icons.save,
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // Navigator.pushNamedAndRemoveUntil(
                //     context, HomeScreen.routeName, (route) => false);
                Navigator.pop(context);
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  InternationalPhoneNumberInput buildPhoneFormField() {

    return InternationalPhoneNumberInput(
      isEnabled: false,
      onInputChanged: (value) {
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
        // if (!phoneRegExp.hasMatch(value)) {
        //   addError(error: kInvalidPhoneError);
        //   return "";
        // }
        return null;
      },
      onSaved: (newValue) => phone = newValue.phoneNumber,
      textStyle: TextStyle(color: Colors.white),
      initialValue: PhoneNumber(phoneNumber: "934631746", isoCode: "SY"),
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

  TextFormField buildAddressField(String title, String hint) {
    return TextFormField(
      initialValue: address,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: title,
        hintText: hint,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg'),
      ),
    );
  }

  TextFormField buildNameField(String title, String hint) {
    return TextFormField(
      initialValue: name,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: title,
        hintText: hint,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      readOnly: true,
      obscureText: showPassword,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
      initialValue: password,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: email,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
