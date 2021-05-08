import 'dart:ui' as ui;
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/components/build_content.dart';

class AboutUs extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile6.dart";
  static String routeName = "/aboutUsScreen";
  BuildContent buildContent = BuildContent();
  //AboutUs({this.dev});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 50.0,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          //PNetworkImage(dev.backdropPhoto, fit: BoxFit.cover), //big image
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: kBoxDecoration,
              child: buildContent.buildContent(context),
            ),
          ),
        ],
      ),
    );
  }
}
