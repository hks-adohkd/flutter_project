import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/profile/components/homeGrad.dart';

class ProfileScreenGradient extends StatelessWidget {
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: kBoxDecoration,
        child: HomeProfileScreenGrad(),
      ),
    );
  }
}
