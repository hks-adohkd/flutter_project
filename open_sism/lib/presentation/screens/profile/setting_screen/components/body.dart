import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:open_sism/main.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05), // 4%
                Center(
                  child: Text(
                    "Setting",
                    style: kHeadingStyle,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                // 4%
                Text(
                  "Language",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () async {
                    context
                        .findAncestorStateOfType<OpenSismState>()
                        .setLocale(Locale('ar', 'AR') , context);

                  },
                  child: const Text('عربي'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () async {
                   await context
                        .findAncestorStateOfType<OpenSismState>()
                        .setLocale(Locale('en', 'EN') , context);
                  },
                  child: const Text('English'),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () => context
                          .findAncestorStateOfType<OpenSismState>()
                          .setLocale(Locale('ar', 'AR')),
                      child: const Text('عربي'),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () => context
                          .findAncestorStateOfType<OpenSismState>()
                          .setLocale(Locale('en', 'EN')),
                      child: const Text('English'),
                    ),
                  ),
                ),
                Divider(color: Colors.black)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
