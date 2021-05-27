import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';

class SpecialOfferPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: () => {},
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFB2EBF2).withOpacity(0.7),
                        Color(0xFF0097A7).withOpacity(0.50),
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/logoBodyCircle.png",
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
