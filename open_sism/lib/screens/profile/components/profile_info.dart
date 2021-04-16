import 'package:flutter/material.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_sism/screens/profile/components/profile_constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

/* class return the first container of profile
 (image name email ponts group)
 */
class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    ScreenUtil.init(context,
        height: SizeConfig.screenWidth,
        width: SizeConfig.screenWidth,
        allowFontScaling: true);

    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 7,
            width: kSpacingUnit.w * 7,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 2),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 8,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: GestureDetector(
                        //onTap: ,
                        child: Icon(
                          LineAwesomeIcons.pen,
                          color: kDarkPrimaryColor,
                          size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 1),
          Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: kSpacingUnit.w * 3,
                width: kSpacingUnit.w * 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                  color: Theme.of(context).accentColor,
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      '15000 P',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(width: kSpacingUnit.w * 1),
              Container(
                height: kSpacingUnit.w * 3,
                width: kSpacingUnit.w * 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                  color: Theme.of(context).accentColor,
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      'Pronze',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
