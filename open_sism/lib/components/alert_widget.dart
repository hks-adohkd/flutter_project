import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertWidget extends StatelessWidget {
  bool isRedeem;

  Future<bool> getDialogResult() async {
    if (isRedeem) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(),
    );
  }

  // Alert with multiple and custom buttons
  Future<bool> onAlertButtonsPressed(
    BuildContext context,
    String title,
    String message,
  ) async {
    return Alert(
      context: context,
      type: AlertType.warning,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          child: Text(
            "Accept",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            isRedeem = true;
            Navigator.of(context, rootNavigator: true).pop(isRedeem);
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Decline",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            isRedeem = false;
            Navigator.of(context, rootNavigator: true).pop(isRedeem);
          },
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ]),
        )
      ],
    ).show();
  }
}
