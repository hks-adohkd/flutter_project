import 'package:flutter/material.dart';
import 'file:///C:/Users/Yazbek/AndroidStudioProjects/Sism/opensism/open_sism/lib/logic/blocs/homeBloc/home_bloc.dart';
import 'file:///C:/Users/Yazbek/AndroidStudioProjects/Sism/opensism/open_sism/lib/logic/blocs/homeBloc/home_event.dart';
import 'package:open_sism/presentation/components/default_button.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            "Login Success",
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
              text: "Back to home",
              press: () {
                context.read<HomeBloc>().add(HomePageRequested());
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
