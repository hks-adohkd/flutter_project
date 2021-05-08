import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/components/form_error.dart';
import 'package:open_sism/presentation/configurations/constants.dart';

class PhoneForm extends StatefulWidget {
  final bool readOnly;
  PhoneForm({this.readOnly = false});
  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final _formKey = GlobalKey<FormState>();

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
            height: 10,
          ),
          FormError(errors: errors),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      readOnly: widget.readOnly,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNullError);
        }
        if (phoneRegExp.hasMatch(value)) {
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
