import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/support_message/support.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/presentation/screens/profile/components/default_Button.dart';
import 'package:open_sism/presentation/screens/profile/components/form_error.dart';

class SportMatchForm extends StatefulWidget {
  @override
  _SportMatchFormState createState() => _SportMatchFormState();
}

class _SportMatchFormState extends State<SportMatchForm> {
  String firstTeamScore;
  String secondTeamScore;
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildFirstTeamFormField(),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        buildSecondTeamFormField(),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        FloatingActionButton(onPressed: () => {}),
        // DefaultButton(
        //   text: "Send",
        //   icon: Icons.send,
        //   press: () {
        //     if (_formKey.currentState.validate()) {
        //       _formKey.currentState.save();
        //       print(firstName);
        //       print(lastName);
        //       print(email);
        //       print(phone);
        //       print(subject);
        //       print(myController.text);
        //       context.read<SupportBloc>().add(
        //             SupportAddMessage(
        //                 subject: subject,
        //                 phone: phone,
        //                 message: myController.text,
        //                 email: email,
        //                 firstName: firstName,
        //                 lastName: lastName),
        //           );
        //       // if all are valid then go to success screen
        //       // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
        //     }
        //   },
        // ),
      ],
    );
  }

  Container buildFirstTeamFormField() {
    return Container(
      width: SizeConfig.screenWidth / 2.5,
      child: TextFormField(
        onSaved: (newValue) => {
          setState(() {
            firstTeamScore = newValue;
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
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        // decoration: InputDecoration(
        //   labelText: "FirstName",
        //   hintText: "Enter your FirstName",
        //   floatingLabelBehavior: FloatingLabelBehavior.always,
        //   suffixIcon: CustomSuffixIcon(
        //     svgIcon: 'assets/icons/User.svg',
        //   ),
        // ),
      ),
    );
  }

  Container buildSecondTeamFormField() {
    return Container(
      width: SizeConfig.screenWidth / 2.5,
      child: TextFormField(
        onSaved: (newValue) => {
          setState(() {
            secondTeamScore = newValue;
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
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        // decoration: InputDecoration(
        //   labelText: "LastName",
        //   hintText: "Enter your LastName",
        //   floatingLabelBehavior: FloatingLabelBehavior.always,
        //   suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
        // ),
      ),
    );
  }
}
