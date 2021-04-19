import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';

import 'package:open_sism/screens/profile/components/profile_constants.dart';
import 'package:open_sism/screens/profile/components/home.dart';
import 'package:open_sism/screens/profile/components/homeGrad.dart';
import 'package:open_sism/theme.dart';

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
