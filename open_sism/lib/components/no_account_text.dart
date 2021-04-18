import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ",
            style: TextStyle(fontSize: 16, color: Colors.white)),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context ,'register/'),
          child: Text(
            "Sign up",
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
