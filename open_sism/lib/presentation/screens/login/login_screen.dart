import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/logic/blocs/login/login_event.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/login/components/Body.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/logic/blocs/login/login_bloc.dart';
import 'package:open_sism/logic/blocs/login/login_state.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Connectivity connectivity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loginBloc = LoginBloc(
    //   appBloc: BlocProvider.of<AppBloc>(context),
    //   userRepository: RepositoryProvider.of<UserRepository>(context),
    // );
    // //getPrizeAll
    // loginBloc.add(LoginWithCredentialsPressed(
    //   mobile: "+963999999998",
    //   password: "Yazbek@123",
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: AppLocalizations.of(context).login,
          leadingIcon: null,
        ),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        //bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginFailed) {
            showSnackBar(
              context,
              state.message,
              SnackBarType.error,
            );
          }
          if (state is LoginLoading) {
            showSnackBar(
              context,
              AppLocalizations.of(context).loggingInPleaseWait,
              SnackBarType.loading,
            );
          }
          if (state is LoginSuccess) {
            print('here is login success');

            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  elevation: 4,
                  margin: EdgeInsets.only(
                    left: Values.medium,
                    right: Values.medium,
                    bottom: Values.big,
                  ),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).pleaseWait,
                      ),
                      CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(CustomColors.white),
                      )
                    ],
                  ),
                  backgroundColor: CustomColors.green,
                ),
              ).closed.then(
                (v) async {
                  Phoenix.rebirth(context);
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) => MainScaffold(),
                  //   ),
                  // );
//                  Navigator.of(context).maybePop();
                },
              );
          }
        },
        child: Body(),
      ),
    );
  }
}
