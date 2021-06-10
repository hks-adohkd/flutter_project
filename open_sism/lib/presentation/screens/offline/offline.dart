import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/custom_text.dart';
import 'package:open_sism/presentation/configurations/utils.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Offline extends StatelessWidget {
  final Function callback;

  const Offline({Key key, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          //height: ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logoBody.png',
                width: MediaQuery.of(context).size.width * 4 / 5,
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 3,
                alignment: Alignment(0, 1),
              ),
              Height(Values.big),
              CustomText(
                AppLocalizations.of(context).noInternetAccess,
                color: CustomColors.black,
                type: TextType.title,
              ),
              Height(Values.small),
              CustomText(
                AppLocalizations.of(context).beSureToConnectToInternetAndTryAgain,
                color: CustomColors.black,
                type: TextType.body,
                align: TextAlign.center,
              ).respectGuidelinesMargins(),
              Height(Values.extra),
              RaisedButton(
                onPressed: callback,
                child: Center(
                  child: CustomText(AppLocalizations.of(context).retry),
                ),
              ).respectGuidelinesMargins()
            ],
          ),
        ),
      ),
    );
  }
}
