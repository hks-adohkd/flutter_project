import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_sism/screens/profile/ProfileScreenGradiant.dart';
import 'package:open_sism/screens/profile/components/profile_constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:open_sism/screens/profile/components/profile_info.dart';

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
        SizedBox(width: kSpacingUnit.w * 2),
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, ProfileScreenGradient.routeName);
          },
          child: Icon(
            LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 2),
          ),
        ),
        ProfileInfo(),
        //BarThemeSwitcher(),
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );
  }
}
