import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/profile/account_screen/components/account_screen_form.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';

class BodyAccount extends StatefulWidget {
  // final CustomerProfileApiResponse profileData;
  // BodyAccount({this.profileData});
  @override
  _BodyAccountState createState() => _BodyAccountState();
}

class _BodyAccountState extends State<BodyAccount> {
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
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Account Setting", style: kHeadingStyle),
                Text(
                  "Complete your details ",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                AccountScreenForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
