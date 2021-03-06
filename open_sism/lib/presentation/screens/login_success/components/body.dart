import 'package:flutter/material.dart';

import 'package:open_sism/logic/blocs/homeBloc/home_bloc.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_event.dart';

import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success_blue.png",
            width: SizeConfig.screenWidth, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            AppLocalizations.of(context).loginSuccess,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: AppLocalizations.of(context).backToHome,
              press: () {
                context.read<HomeBloc>().add(HomePageRequested());
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.routeName, (Route<dynamic> route) => false);
                // Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
