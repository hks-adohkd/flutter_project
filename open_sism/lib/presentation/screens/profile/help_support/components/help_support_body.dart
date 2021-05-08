import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/profile/help_support/components/help_support_form.dart';
import 'package:open_sism/presentation/configurations/constants.dart';

class BodyHelpSupport extends StatefulWidget {
  @override
  _BodyHelpSupportState createState() => _BodyHelpSupportState();
}

class _BodyHelpSupportState extends State<BodyHelpSupport> {
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
                Text(
                  "Help & Support",
                  style: kHeadingStyle,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SupportScreenForm(),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
