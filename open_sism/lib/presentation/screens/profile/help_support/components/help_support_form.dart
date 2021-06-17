import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/support_message/support.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/presentation/screens/profile/components/profile_constants.dart';
import 'package:open_sism/presentation/screens/profile/components/default_Button.dart';
import 'package:open_sism/presentation/screens/profile/components/form_error.dart';

class SupportScreenForm extends StatefulWidget {
  @override
  _SupportScreenFormState createState() => _SupportScreenFormState();
}

class _SupportScreenFormState extends State<SupportScreenForm> {
  String email;
  String subject;
  String body;
  String firstName;
  String lastName = " ";
  String phone;
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final myController = TextEditingController();
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
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Form(
        key: _formKey,
        child: BlocListener<SupportBloc, SupportState>(
          listener: (context, state) {
            if (state is SupportAddState) {
              showSnackBar(
                context,
                'Sending message , please Wait ...',
                SnackBarType.loading,
              );
            }
            if (state is SupportErrorState) {
              showSnackBar(
                context,
                state.error,
                SnackBarType.error,
              );
            }
            if (state is SupportMessageNotSuccess) {
              showSnackBar(
                context,
                state.message,
                SnackBarType.error,
              );
            }
            if (state is SupportSuccessState) {
              showSnackBar(
                context,
                "Sent message successful",
                SnackBarType.wheel,
              );
              ScaffoldMessenger.of(context)..hideCurrentSnackBar();
              Future.delayed(const Duration(milliseconds: 2000), () {
                // function spin init state
                Navigator.pop(context);
              });

              // Scaffold.of(context).
              // hideCurrentSnackBar();
              //Phoenix.rebirth(context);
              // context.read<AccountBloc>().add(
              //   AccountPageRequested(),
              // );
            }
            if (state is SupportNotValidFormState) {
              showSnackBar(
                context,
                'Please Add All required information',
                SnackBarType.error,
              );
            } else {
              print("no");
              //isValidProfile = false;
              // showSnackBar(
              // context,
              // "Error Loading Profile",
              // SnackBarType.error,
              // );
            }
          },
          child: buildColumn(),
        ));
  }

  Column buildColumn() {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          buildFirstNameFormField(),
          SizedBox(width: 5),
          buildLastNameFormField(),
        ]),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        buildPhoneFormField(),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
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
              print(firstName);
              print(lastName);
              print(email);
              print(phone);
              print(subject);
              print(myController.text);
              context.read<SupportBloc>().add(
                    SupportAddMessage(
                        subject: subject,
                        phone: phone,
                        message: myController.text,
                        email: email,
                        firstName: firstName,
                        lastName: lastName),
                  );
              // if all are valid then go to success screen
              // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            }
          },
        ),
      ],
    );
  }

  TextFormField buildDefaultField(
      String title, String hint, bool showError, int maxline) {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        setState(() {
          subject = newValue;
        });
      },
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
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
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
        controller: myController,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: title,
          hintText: "Enter a message",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
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

  Container buildPhoneFormField() {
    return Container(
      width: SizeConfig.screenWidth,
      child: TextFormField(
        onSaved: (newValue) => {
          setState(() {
            phone = newValue;
          })
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: "Phone doesn't exist!");
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: "Phone doesn't exist!");
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.phone,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "PHone",
          hintText: "Enter your PHone",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/Phone.svg',
          ),
        ),
      ),
    );
  }
}
