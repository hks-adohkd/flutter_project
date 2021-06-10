import 'package:flutter/material.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/configurations/constants.dart';

import 'components/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginSuccessScreen extends StatelessWidget {
  static const String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: AppLocalizations.of(context).success,
        ),
      ),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
