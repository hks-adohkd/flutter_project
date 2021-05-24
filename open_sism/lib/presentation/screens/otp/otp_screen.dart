import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/otp";
  final bool isRegister;
  final String phoneNumber;
  OtpScreen({@required this.isRegister , @required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Body(
          isRegister: isRegister,
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }
}

/*
How to send:

    Navigator.pushNamed(ctx, '/foo', arguments: someObject);
How to receive:

...
    return MaterialApp(
        ...
        onGenerateRoute: _getRoute,
        ...
    );
...

Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/foo') {
        // FooRoute constructor expects SomeObject
        return _buildRoute(settings, new FooRoute(settings.arguments));
    }

    return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
        settings: settings,
        builder: (ctx) => builder,
    );
}
 */
