import 'package:flutter/material.dart';
import 'package:open_sism/main.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/main.dart';

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05), // 4%
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () => context
                      .findAncestorStateOfType<OpenSismState>()
                      .setLocale(Locale('ar', 'AR')),
                  child: const Text('عربي'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () => context
                      .findAncestorStateOfType<OpenSismState>()
                      .setLocale(Locale('en', 'EN')),
                  child: const Text('English'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
