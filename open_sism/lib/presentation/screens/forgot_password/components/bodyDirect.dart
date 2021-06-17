import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/password/password.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/components/form_error.dart';
import 'package:open_sism/presentation/components/no_account_text.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/presentation/screens/otp/otp_screen.dart';

class BodyDirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocListener<PasswordBloc, PasswordState>(
        listener: (context, state) {
          if (state is PasswordUpdateState) {
            showSnackBar(
              context,
              'يتم تحديث البيبانات ... الرجاء الانتظار',
              SnackBarType.loading,
            );
          }
          if (state is PasswordUpdateErrorState) {
            showSnackBar(
              context,
              state.error,
              SnackBarType.error,
            );
          }
          if (state is PasswordUpdateMessageNotSuccess) {
            showSnackBar(
              context,
              state.message,
              SnackBarType.error,
            );
          }
          if (state is PasswordUpdateSuccessState) {
            showSnackBar(
              context,
              "Update Password successful",
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
          if (state is PasswordNotValidFormState) {
            showSnackBar(
              context,
              'قم بإدخال كافة المعلومات!',
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
                    "Please enter your Old Password  and New Password ",
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
  String password;
  String confirmPassword;
  String oldPassword;

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
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildOldPasswordFormField(),
            SizedBox(height: 30),
            buildPasswordFormField(),
            SizedBox(height: 30),
            buildConfirmPasswordFormField(),
            SizedBox(height: 30),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    context.read<PasswordBloc>().add(
                          PasswordUpdate(
                            confirmPassword: confirmPassword,
                            oldPassword: oldPassword,
                            newPassword: password,
                          ),
                        );
                    // TODO: send verification code via message and move to OTP page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => OtpScreen(
                    //       isRegister: true,
                    //     ),
                    //   ),
                    // );
                  }
                }),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            NoAccountText(),
          ],
        ));
  }

  TextFormField buildOldPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => {
        setState(() {
          oldPassword = newValue;
        })
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        // setState(() {
        //   oldPassword = value;
        // });
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
        labelText: "Old Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
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
        labelText: "New Password",
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
        labelText: "Confirm New  Password",
        hintText: "Re-enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }
}
