import 'package:flutter/material.dart';
import 'package:open_sism/configurations/constants.dart';

ThemeData theme() {
  return ThemeData(
    textTheme: textTheme(),
    primarySwatch: Colors.blue,
    inputDecorationTheme: inputDecorationTheme(),
  );
}

textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white.withOpacity(0.8)),
  );
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Colors.white),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 45,
      vertical: 20,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
