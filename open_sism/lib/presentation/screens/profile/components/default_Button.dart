import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/profile/components/profile_constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key key, this.text, this.press, this.icon})
      : super(key: key);
  final String text;
  final Function press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenHeight(200),
      height: getProportionateScreenHeight(80),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kAccentColor,
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: getProportionateScreenHeight(10),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
