import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/home/components/body.dart';
import 'package:open_sism/presentation/components/appBar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (internetContext, internetState) {
        if(internetState is InternetConnected){
          print("Internet Connected");
        } else if(internetState is InternetDisconnected){
          print("Internet Disconnected");
        } else {
          print("Unknown State");
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: kAppBarHeight,
          child: ReusableAppBar(
            leadingIcon: null,
            appBarTitle: "Home",
          ),
        ),
        body: Body(),
        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
