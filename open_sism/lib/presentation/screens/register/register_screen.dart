import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:open_sism/logic/blocs/register/register_bloc.dart';
import 'package:open_sism/logic/blocs/register/register_state.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/register/components/body.dart';
import 'package:open_sism/presentation/configurations/utils.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Register",
          leadingIcon: null,
        ),
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            showSnackBar(
              context,
              'يتم التسجيل ... الرجاء الانتظار',
              SnackBarType.loading,
            );
          }
          if (state is RegisterErrorState) {
            showSnackBar(
              context,
              state.error,
              SnackBarType.error,
            );
          }
          if (state is RegisterMessageNotSuccess) {
            showSnackBar(
              context,
              state.message,
              SnackBarType.error,
            );
          }
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context)..hideCurrentSnackBar();
            // Scaffold.of(context).
            // hideCurrentSnackBar();
            Phoenix.rebirth(context);
          }
          if (state is RegisterNotValidFormState) {
            showSnackBar(
              context,
              'قم بإدخال كافة المعلومات!',
              SnackBarType.error,
            );
          }
          if (state is RegisterNotMatchedPasswordsState) {
            showSnackBar(
              context,
              'خطأ في كلمات المرور: الكلمات غير متطابقة!',
              SnackBarType.error,
            );
          }
          return Container();
        },
        child: Body(),
      ),
    );
  }
}
