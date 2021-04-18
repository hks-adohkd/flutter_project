import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_sism/screens/profile/components/profile_constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:open_sism/screens/profile/components/profile_info.dart';
import 'package:open_sism/screens/profile/components/barThemeSwitcher.dart';
import "package:open_sism/screens/home/home_screen.dart";

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    ScreenUtil.init(context,
        height: SizeConfig.screenWidth,
        width: SizeConfig.screenWidth,
        allowFontScaling: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        GestureDetector(
          onTap: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          },
          child: Icon(
            LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
        ProfileInfo(),
        BarThemeSwitcher(),
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );
  }
}
