import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: kGradiantsPrimaryColor,
          ),
          border: Border.all(style: BorderStyle.solid, color: Colors.black),
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(100),
        child: Center(
          child: FlareActor(
            "assets/images/circular.flr",
            animation: "circular",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            isPaused: false,
            snapToEnd: true,
            // color: Colors.yellow,
          ),
        ),
      ),
      // body: Center(child: Text('الرجاء الانتظار...')),
    );
  }
}
