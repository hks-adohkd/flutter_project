import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/screens/profile/components/profile_constants.dart';
import 'package:open_sism/screens/profile/components/home.dart';

class ProfileScreen extends StatelessWidget {

  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kDarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: HomeProfileScreen(),
          );
        },
      ),
    );
  }
}
