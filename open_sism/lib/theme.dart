import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    primarySwatch: Colors.blue,
    inputDecorationTheme: inputDecorationTheme(),
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