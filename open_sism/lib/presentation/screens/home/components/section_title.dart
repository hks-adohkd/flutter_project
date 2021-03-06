import 'package:flutter/material.dart';

import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            AppLocalizations.of(context).seeMore,
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
