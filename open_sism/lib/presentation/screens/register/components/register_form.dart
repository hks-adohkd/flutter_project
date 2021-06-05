import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:open_sism/logic/blocs/register/register_bloc.dart';
import 'package:open_sism/logic/blocs/register/register_event.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/components/form_error.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/otp/otp_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  String firstName;
  String lastName;
  String password;
  String confirmPassword;
  final List<String> errors = [];
  int _value = 0; //female  =1 , male = 0

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            buildFirstNameFormField(),
            SizedBox(width: 5),
            buildLastNameFormField(),
          ]),
          SizedBox(height: 30),
          buildGenderField(),
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
                _formKey.currentState.save();

                print({
                  "register Button Pressed",
                  _value,
                  phone,
                  email,
                  firstName,
                  lastName,
                  password,
                  confirmPassword,
                });
                context.read<RegisterBloc>().add(
                      RegisterButtonPressed(
                        mobile: phone,
                        email: email,
                        firstName: firstName,
                        lastName: lastName,
                        password: password,
                        gender: _value,
                      ),
                    );

                // TODO: Go to complete profile page
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => OtpScreen(
                //               isRegister: true,
                //               phoneNumber: phone,
                //             )));
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
      //initialValue: PhoneNumber(isoCode: 'SY', phoneNumber: "123456789"),
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
        if (!phoneRegExp.hasMatch(value)) {
          addError(error: kInvalidPhoneError);
          return "";
        }
        return null;
      },
      onSaved: (newValue) => {
        setState(
          () {
            phone = newValue.phoneNumber;
          },
        )
      },
      textStyle: TextStyle(color: Colors.white),
      initialValue: PhoneNumber(isoCode: "SY"), //number
      selectorConfig: SelectorConfig(
        leadingPadding: 20,
        setSelectorButtonAsPrefixIcon: true,
        trailingSpace: false,
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      inputDecoration: InputDecoration(
        // contentPadding: EdgeInsets.only(bottom: 30),

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

  Padding buildGenderField() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => setState(() => _value = 0),
            child: Container(
              height: 36,
              width: 36,
              color: _value == 0 ? Colors.grey : Colors.transparent,
              child: Icon(FontAwesomeIcons.male),
            ),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: () => setState(() => _value = 1),
            child: Container(
              height: 36,
              width: 36,
              color: _value == 1 ? Colors.grey : Colors.transparent,
              child: Icon(FontAwesomeIcons.female),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => {
        setState(() {
          password = newValue;
        })
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        setState(() {
          password = value;
        });
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
      onSaved: (newValue) => {
        setState(() {
          confirmPassword = newValue;
        })
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        if (value == password) {
          removeError(error: kMatchPassError);
        }
        //password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        }
        if (password != value) {
          print({password, "password"});
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
      onSaved: (newValue) => {
        setState(() {
          email = newValue;
        })
      },
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
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your Email (Optional)",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
    );
  }

  Container buildFirstNameFormField() {
    return Container(
      width: SizeConfig.screenWidth / 2.5,
      child: TextFormField(
        onSaved: (newValue) => {
          setState(() {
            firstName = newValue;
          })
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: "FirstName doesn't exist!");
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: "FirstName doesn't exist!");
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "FirstName",
          hintText: "Enter your FirstName",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/User.svg',
          ),
        ),
      ),
    );
  }

  Container buildLastNameFormField() {
    return Container(
      width: SizeConfig.screenWidth / 2.5,
      child: TextFormField(
        onSaved: (newValue) => {
          setState(() {
            lastName = newValue;
          })
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: "LastName doesn't exist!");
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: "LastName doesn't exist!");
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "LastName",
          hintText: "Enter your LastName",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
        ),
      ),
    );
  }
}
