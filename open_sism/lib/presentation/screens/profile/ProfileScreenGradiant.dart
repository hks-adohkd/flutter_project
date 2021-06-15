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
        decoration: kBoxDecoration.copyWith(
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Color(0xff2196F3),
            //     Color(0xffBBDEFB),
            //   ],
            // ),
            ),
        child: HomeProfileScreenGrad(),
      ),
    );
  }
}
