import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/profile/components/profile_constants.dart';
import 'package:open_sism/presentation/screens/profile/components/default_Button.dart';
import 'package:open_sism/presentation/screens/profile/components/form_error.dart';

class SupportScreenForm extends StatefulWidget {
  @override
  _SupportScreenFormState createState() => _SupportScreenFormState();
}

class _SupportScreenFormState extends State<SupportScreenForm> {
  String email;
  String title;
  String body;
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
          buildEmailFormField(),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          buildDefaultField('title', 'Enter your title', true, 1),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          buildTextField('message'),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          DefaultButton(
            text: "Send",
            icon: Icons.send,
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildDefaultField(
      String title, String hint, bool showError, int maxline) {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => body = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && showError) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && showError) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      maxLines: maxline,
      decoration: InputDecoration(
        labelText: title,
        hintText: hint,

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/na"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  Widget buildTextField(String title) {
    final maxLines = 5;

    return Container(
      margin: EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: title,
          hintText: "Enter a message",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
