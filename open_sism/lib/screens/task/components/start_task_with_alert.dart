import 'package:flutter/material.dart';
import 'package:open_sism/screens/task/components/taskBundel.dart';
import 'package:open_sism/components/alert_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class StartTaskAlertButton extends StatefulWidget {
  final TaskBundle product;
  const StartTaskAlertButton({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _StartTaskAlertButtonState createState() => _StartTaskAlertButtonState();
}

class _StartTaskAlertButtonState extends State<StartTaskAlertButton> {
  AlertWidget startTaskAlert = AlertWidget();
  var result;
  // return success dialog after redeemption accepted
  startTaskResultAweasom(bool result) {
    if (result) {
      return AwesomeDialog(
              context: context,
              animType: AnimType.LEFTSLIDE,
              headerAnimationLoop: false,
              dialogType: DialogType.SUCCES,
              title: 'Succes',
              desc: 'Task started put your code here ',
              btnOkOnPress: () {
                //  debugPrint('OnClcik');
              },
              btnOkIcon: Icons.check_circle,
              onDissmissCallback: () {
                // debugPrint('Dialog Dissmiss from callback');
              })
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.teal,
                  backgroundColor: Color(0xFF512DA8),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () async {
                  result = await startTaskAlert.onAlertButtonsPressed(
                    context,
                    "Start Task ALERT",
                    "Are you sure to start this Task",
                  );
                  startTaskResultAweasom(result);
                },
                child: Text(
                  "Start Task".toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
AlertWidget _startTaskAlert = AlertWidget();
class StartTaskAlertButton extends StatelessWidget {
  const StartTaskAlertButton({
    Key key,
    @required this.product,
  }) : super(key: key);

  final TaskBundle product;

  // return success dialog after redeemption accepted
  startTaskResultAweasom(bool result) {
    if (result) {
      return AwesomeDialog(
          context: context,
          animType: AnimType.LEFTSLIDE,
          headerAnimationLoop: false,
          dialogType: DialogType.SUCCES,
          title: 'Succes',
          desc: 'Task started put your code here ',
          btnOkOnPress: () {
            //  debugPrint('OnClcik');
          },
          btnOkIcon: Icons.check_circle,
          onDissmissCallback: () {
            // debugPrint('Dialog Dissmiss from callback');
          })
          .show();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.teal,
                  backgroundColor: Color(0xFF512DA8),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                onPressed: () {},
                child: Text(
                  "Start Task".toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

*/
