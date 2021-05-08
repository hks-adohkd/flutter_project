import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_sism/presentation/screens/profile/components/profile_constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

/*
* return the bar of profile screen
* the back arrow with icon to switch theme
* */
class BarThemeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.init(context,
        height: SizeConfig.screenWidth,
        width: SizeConfig.screenWidth,
        allowFontScaling: true);
    return ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
              ThemeProvider.of(context).brightness == Brightness.dark
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );
  }
}
