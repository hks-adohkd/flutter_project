import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/logic/blocs/app/app_event.dart';
import 'package:open_sism/presentation/screens/login/login_screen.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/AboutUS_screen.dart';
import 'package:open_sism/presentation/screens/profile/account_screen/account_screen.dart';
import 'package:open_sism/presentation/screens/profile/components/profile_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:open_sism/presentation/screens/profile/components/profile_constants.dart';
import 'package:open_sism/presentation/screens/profile/components/profile_list_item.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/profile/help_support/Help_support_screen.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/logic/blocs/profile/profile.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';
import 'package:open_sism/logic/blocs/account/account.dart';
import 'package:open_sism/presentation/screens/profile/setting_screen/Setting_screen.dart';
import 'package:open_sism/logic/blocs/aboutBloc/about.dart';

bool isValidProfile = false;

/*
* Main profile class */
class HomeProfileScreenGrad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomerProfileApiResponse profileData;
    SizeConfig().init(context);
    //ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    ScreenUtil.init(context,
        height: SizeConfig.screenWidth,
        width: SizeConfig.screenWidth,
        allowFontScaling: true);

    return SafeArea(
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          print(state.toString());
          if (state is ProfileLoadedSuccess) {
            isValidProfile = true;
            profileData = state.profileData;
          } else {
            print("no");
            isValidProfile = false;
            showSnackBar(
              context,
              "Error Loading Profile",
              SnackBarType.error,
            );
          }
        },
        child: Column(
          children: <Widget>[
            SizedBox(height: kSpacingUnit.w * 1),
            ProfileHeader(),
            // provide the container header
            SizedBox(height: kSpacingUnit.w * 3),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ProfileListItem(
                    press: () {
                      if (isValidProfile) {
                        context.read<AccountBloc>().add(AccountPageRequested());
                        Navigator.pushNamed(
                          context,
                          AccountScreen.routeName,
                        );
                      }
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
                    press: () {
                      if (isValidProfile) {
                        Navigator.pushNamed(
                            context, HelpSupportScreen.routeName);
                      }
                    },
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Settings',
                    press: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.question,
                    text: 'About Us',
                    press: () {
                      if (isValidProfile) {
                        context.read<AboutBloc>().add(AboutPageRequested());

                        Navigator.pushNamed(context, AboutUs.routeName);
                      }
                    },
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Logout',
                    hasNavigation: false,
                    press: () {
                      context.read<AppBloc>().add(LogOut());
                      Phoenix.rebirth(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName,
                          (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
