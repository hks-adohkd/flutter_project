import 'package:flutter/material.dart';
import 'package:open_sism/screens/profile/account_screen/account_screen.dart';

import 'package:open_sism/screens/profile/components/profile_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:open_sism/screens/profile/components/profile_constants.dart';
import 'package:open_sism/screens/profile/components/profile_list_item.dart';
import 'package:open_sism/configurations/size_config.dart';

/*
* Main profile class */
class HomeProfileScreenGrad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    ScreenUtil.init(context,
        height: SizeConfig.screenWidth,
        width: SizeConfig.screenWidth,
        allowFontScaling: true);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 4),
          ProfileHeader(),
          // provide the container header
          SizedBox(height: kSpacingUnit.w * 1),
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  press: () {
                    Navigator.pushNamed(context, AccountScreen.routeName);
                  },
                  icon: LineAwesomeIcons.user_shield,
                  text: 'Account Settings',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'Upgrade To Pro',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.cog,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.question,
                  text: 'About Us',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Logout',
                  hasNavigation: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}