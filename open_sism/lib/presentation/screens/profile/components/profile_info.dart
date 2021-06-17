import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_sism/presentation/screens/profile/components/profile_constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:open_sism/logic/blocs/profile/profile.dart';
/* class return the first container of profile
 (image name email ponts group)
 */

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.init(context,
        height: SizeConfig.screenWidth,
        width: SizeConfig.screenWidth,
        allowFontScaling: true);
    return Expanded(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: kSpacingUnit.w * 10,
              width: kSpacingUnit.w * 10,
              margin: EdgeInsets.only(top: kSpacingUnit.w * 2),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: kSpacingUnit.w * 9,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: kSpacingUnit.w * 2.5,
                      width: kSpacingUnit.w * 2.5,
                      decoration: kBoxDecoration.copyWith(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffB3E5FC),
                            Color(0xffBBDEFB),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        heightFactor: kSpacingUnit.w * 1.5,
                        widthFactor: kSpacingUnit.w * 1.5,
                        child: GestureDetector(
                          //onTap: ,
                          child: Icon(
                            LineAwesomeIcons.pen,
                            color: Colors.black,
                            size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 1),
          Padding(
            padding: EdgeInsets.only(top: kSpacingUnit.w * 13.5),
            child: Center(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoadedSuccess) {
                    return Text(
                      state.profileData.content.firstName +
                          " " +
                          state.profileData.content.lastName,
                      style: kTitleTextStyle,
                    );
                  } else {
                    return Text(
                      ' ',
                      style: kTitleTextStyle,
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 1),
          Padding(
            padding: EdgeInsets.only(top: kSpacingUnit.w * 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: kSpacingUnit.w * 3,
                  width: kSpacingUnit.w * 8,
                  decoration: kBoxDecoration.copyWith(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xffB3E5FC),
                        Color(0xffBBDEFB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoadedSuccess) {
                            return Text(
                              state.profileData.content.currentPoints
                                      .toString() +
                                  " P",
                              style: kButtonTextStyle.copyWith(
                                  color: Colors.black),
                            );
                          } else {
                            return Text(
                              '0 P',
                              style: kButtonTextStyle.copyWith(
                                  color: Colors.black),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: kSpacingUnit.w * 11),
                Container(
                  height: kSpacingUnit.w * 3,
                  width: kSpacingUnit.w * 8,
                  decoration: kBoxDecoration.copyWith(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xffFFFFFF),
                        Color(0xffBBDEFB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoadedSuccess) {
                            return Text(
                              state.profileData.content.group.displayName,
                              style: kButtonTextStyle.copyWith(
                                  color: Colors.black),
                            );
                          } else {
                            return Text(
                              ' ',
                              style: kButtonTextStyle.copyWith(
                                  color: Colors.black),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: kSpacingUnit.w * 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
