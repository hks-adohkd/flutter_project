import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/custom_text.dart';

abstract class Configurations {
  static const String _HOST_URL =
      'https://wingame.org.192-185-7-203.hgws10.hgwin.temp.domains';
  static const String BASE_URL = '$_HOST_URL/api';
}

abstract class CustomColors {
  //main colors
  static Color blue = HexColor('#025AB4');
  static Color yellow = HexColor('#FFC33A');
  static Color black = HexColor('#808080');
  static Color darkBlack = HexColor('#333333');
  static Color disabledLight = HexColor('#ECEEF0');
  static Color green = HexColor('#18b52f');
  static Color red = HexColor('#e62222');
  static Color white = HexColor('#FFFFFF');
  static Color lightGrey = HexColor('#DCDCDC');
  static Color darkGrey = HexColor('#979797');

  //backgrounds
  static Color background = HexColor('#FFFFFF');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

abstract class Paddings {
  static const double small = 10.0;
  static const double left = 12.0;
  static const double right = 12.0;
  static const double top = 12.0;
  static const double bottom = 12.0;
  static const double bottomInPage = 60.0;
  static const double topInPage = 30.0;
}

abstract class Values {
  static const double small = 6.0;
  static const double medium = 12.0;
  static const double big = 25.0;
  static const double extra = 40.0;
}

extension ExtendedWidget on Widget {
  respectGuidelinesMargins({bool left = true, bool right = true}) {
    return Container(
      margin: EdgeInsets.only(
        left: left ? Paddings.left : 0,
        right: right ? Paddings.right : 0,
      ),
      child: this,
    );
  }

  wrapper({value: Values.medium}) {
    return Container(
      margin: EdgeInsets.only(
        left: value,
        right: value,
      ),
      child: this,
    );
  }

  bodyWrapper({
    bool closeLeft = false,
    bool closeRight = false,
    bool closeTop = true,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: closeLeft ? Paddings.left : 0,
        right: closeRight ? Paddings.right : 0,
        top: closeTop ? Paddings.top : 0,
      ),
      child: this,
    );
  }

  topInPage() {
    return Container(
      margin: EdgeInsets.only(top: Paddings.topInPage),
      child: this,
    );
  }

  bottomInPage({double value = Paddings.bottomInPage}) {
    return Container(
      margin: EdgeInsets.only(bottom: value),
      child: this,
    );
  }
}

class Height extends StatelessWidget {
  final double height;

  const Height(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(height: height);
  }
}

showSnackBar(context, message, SnackBarType type) {
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        elevation: 4,
        margin: EdgeInsets.only(
          left: Values.medium,
          right: Values.medium,
          bottom: Values.big,
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: type == SnackBarType.loading ? 30 : 3),
        content: type == SnackBarType.loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    message,
                  ),
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(CustomColors.white),
                  )
                ],
              )
            : CustomText(
                message,
                maxLines: 2,
                type: TextType.smallBody,
              ),
        backgroundColor: getSnackBarColor(type),
      ),
    );
}

enum SnackBarType { normal, loading, error }

Color getSnackBarColor(SnackBarType type) {
  switch (type) {
    case SnackBarType.normal:
      return CustomColors.blue;
      break;
    case SnackBarType.loading:
      return CustomColors.yellow;
      break;
    case SnackBarType.error:
      return CustomColors.red;
      break;
    default:
      return CustomColors.black;
  }
}
