import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/presentation/screens/profile/components/default_Button.dart';
import 'package:open_sism/presentation/screens/profile/components/form_error.dart';
import 'package:open_sism/presentation/components/custom_suffix_svgIcon.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';
import 'phone.dart';
import 'package:open_sism/logic/blocs/account/account.dart';
import 'package:open_sism/presentation/screens/forgot_password/forgot_password_screen_without_verification.dart';

class AccountScreenForm extends StatefulWidget {
  // final CustomerProfileApiResponse profileData;
  //
  // AccountScreenForm({this.profileData});
  @override
  _AccountScreenFormState createState() => _AccountScreenFormState();
}

class _AccountScreenFormState extends State<AccountScreenForm> {
  String email = "";
  String firstName = " ";
  String lastName = "";
  String password = "";
  String address = "damascus";
  String confirmPassword;
  String phone = "934631746";
  String isoCode = "";
  bool showPassword = false;
  bool remember = false;
  PhoneData phones = PhoneData();
  Map<String, String> desiredPhoneInfo;
  var firstNameController = TextEditingController(text: " ");
  var lastNameController = TextEditingController(text: " ");
  var emailController = TextEditingController(text: " ");
  var addressController = TextEditingController(text: " ");
  var phoneController = TextEditingController(text: " ");
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
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // email = widget.profileData.content.user.email;
    // firstName = widget.profileData.content.firstName;
    // lastName = widget.profileData.content.lastName;
    // phone = widget.profileData.content.user.phoneNumber;
    //
    // desiredPhoneInfo = phones.phoneData
    //     .firstWhere((element) => phone.contains(element['dial_code']));
    // phone = widget.profileData.content.user.phoneNumber
    //     .substring(widget.profileData.content.user.phoneNumber.length - 9);

    //password = widget.profileData.content.user.
    // var code = phones.phoneData.map((item) {
    //    isoCode = item.map((code) {
    //
    //   });
    // });

    SizeConfig().init(context); // to get the screen size
    return BlocListener<AccountBloc, AccountState>(
        listener: (context, state) {
          print(state.toString());
          if (state is AccountUpdateProfilestate) {
            showSnackBar(
              context,
              'يتم تحديث البيبانات ... الرجاء الانتظار',
              SnackBarType.loading,
            );
          }
          if (state is AccountUpdateErrorState) {
            showSnackBar(
              context,
              state.error,
              SnackBarType.error,
            );
          }
          if (state is AccountUpdateMessageNotSuccess) {
            showSnackBar(
              context,
              state.message,
              SnackBarType.error,
            );
          }
          if (state is AccountUpdateSuccessState) {
            showSnackBar(
              context,
              "Update Profile successful",
              SnackBarType.wheel,
            );
            ScaffoldMessenger.of(context)..hideCurrentSnackBar();
            // Scaffold.of(context).
            // hideCurrentSnackBar();
            //Phoenix.rebirth(context);
            context.read<AccountBloc>().add(
                  AccountPageRequested(),
                );
          }
          if (state is AccountNotValidFormState) {
            showSnackBar(
              context,
              'قم بإدخال كافة المعلومات!',
              SnackBarType.error,
            );
          }

          if (state is AccountLoadedSuccess) {
            setState(() {
              emailController.text = state.profileData.content.user.email;
              firstNameController.text = state.profileData.content.firstName;
              lastNameController.text = state.profileData.content.lastName;
              phoneController.text = state.profileData.content.user.phoneNumber;
              addressController.text = state.profileData.content.address;
            });

            //isValidProfile = true;
            //profileData = state.profileData;
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildFirstNameField('First Name', 'Enter your First Name'),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              buildLastNameField('Last Name', 'Enter your Last Name'),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              buildEmailFormField(),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              buildAddressField('Address', 'Enter your Address'),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              //buildPhoneFormField(),
              buildPhoneField('Phone', "your phone"),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => {
                      Navigator.pushNamed(
                          context, ForgotPasswordScreenDirect.routeName)
                    },
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
                    print(email);
                    print(lastName);
                    _formKey.currentState.save();
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, HomeScreen.routeName, (route) => false);
                    //  Navigator.pop(context);
                    context.read<AccountBloc>().add(
                          AccountUpdateProfile(
                            address: address,
                            email: email,
                            firstName: firstName,
                            lastName: lastName,
                          ),
                        );
                    // if all are valid then go to success screen
                    // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                  }
                },
              ),
            ],
          ),
        ));
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
      onSaved: (newValue) {
        setState(() {
          phone = newValue.phoneNumber;
        });
      },
      textStyle: TextStyle(color: Colors.white),
      initialValue:
          PhoneNumber(phoneNumber: phone, isoCode: desiredPhoneInfo['code']),
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
      controller: addressController,
      // initialValue: address,
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        setState(() {
          address = newValue;
        });
      },
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

  TextFormField buildFirstNameField(String title, String hint) {
    return TextFormField(
      //initialValue: firstName,
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        setState(() {
          firstName = newValue;
        });
      },
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
      controller: firstNameController,
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

  TextFormField buildPhoneField(String title, String hint) {
    return TextFormField(
      controller: phoneController,
      // initialValue: phone, //desiredPhoneInfo['code'] + " :" + phone,
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        setState(() {
          phone = newValue;
        });
      },
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
        enabled: false,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField buildLastNameField(String title, String hint) {
    return TextFormField(
      controller: lastNameController,
      //initialValue: lastName,
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        setState(() {
          lastName = newValue;
        });
      },
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
      controller: emailController,
      // initialValue: email,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        setState(() {
          email = newValue;
        });
      },
      onChanged: (value) {
        print(value);
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      // validator: (value) {
      //   print(value);
      //   if (value.isEmpty) {
      //     addError(error: kEmailNullError);
      //     return "";
      //   }
      //   if (!emailValidatorRegExp.hasMatch(value)) {
      //     addError(error: kInvalidEmailError);
      //     return "";
      //   }
      //   return null;
      // },
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
