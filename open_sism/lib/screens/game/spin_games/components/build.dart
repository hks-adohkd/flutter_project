import 'package:flutter/material.dart';
import 'package:open_sism/screens/game/spin_games/components/model.dart';
import 'package:open_sism/screens/home/home_screen.dart';
import 'package:open_sism/screens/reward/rewards_screen.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

class BuildMethod {
  double angle = 0;
  double current = 0;
  AnimationController ctrl;
  Animation ani;
  bool isStart = false;
  bool isEnd = false;
  var prevIndex;
  String prevPoint;
  String result;

  List<Luck> items = [
    Luck("apple", Color(0xFF9F6083), "10"),
    Luck("raspberry", Color(0xFFFDB78B), "30"),
    Luck("grapes", Color(0xFF57CFE2), "45"),
    Luck("fruit", Color(0xFF606B7E), "75"),
    Luck("milk", Color(0xFF24ACE9), "150"),
    Luck("salad", Color(0xFFFB7C7A), "250"),
    Luck("cheese", Color(0xFF1BD3AC), "500"),
    Luck("carrot", Color(0xFFa73737), "1000"),
  ];

  List<Luck> goldItems = [
    Luck("apple", Color(0xFF9F6083), "1k"),
    Luck("raspberry", Color(0xFFFDB78B), "30k"),
    Luck("grapes", Color(0xFF57CFE2), "4.5k"),
    Luck("fruit", Color(0xFF606B7E), "7.5k"),
    Luck("milk", Color(0xFF24ACE9), "150k"),
    Luck("salad", Color(0xFFFB7C7A), "25k"),
    Luck("cheese", Color(0xFF1BD3AC), "50k"),
    Luck("carrot", Color(0xFFa73737), "100k"),
  ];

  List<Luck> gift_items = [
    Luck("apple", Color(0xFF9F6083), "10"),
    Luck("raspberry", Color(0xFFFDB78B), "30"),
    Luck("grapes", Color(0xFF57CFE2), "45"),
    Luck("fruit", Color(0xFF606B7E), "75"),
    Luck("milk", Color(0xFF24ACE9), "150"),
  ];

  // main animation of wheel
  animation(BuildContext context, Function init) {
    if (!ctrl.isAnimating) {
      var _random = Random().nextDouble();
      angle = 20 + Random().nextInt(5) + _random;
      ctrl.forward(from: 0.0).then((_) {
        current = (current + _random);
        current = current - current ~/ 1;
        result =
            prevPoint; // to show the result in alert and in the main screen
        isEnd = true; // end of animation to control  the result visability
        init(); // function spin init state
        alert(context); //alert when the animation end
        ctrl.reset();
      });
    }
  }

  // alert to go to reward screen and showing point in the end of animation
  alert(BuildContext context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.shrink,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.none,
      title: "Free Points",
      desc: "You earned $result points. You can use it in your Rewards.",
      buttons: [
        DialogButton(
          child: Text(
            "GO to Reward",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => RewardScreen()),
                ModalRoute.withName(HomeScreen.routeName))
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }

  //calculate the index of spin
  int _calIndex(value) {
    var _base = (2 * pi / items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * items.length).floor();
  }

  // get the available list point not all items showing in spin
  String getGiftItem(var index) {
    if (index == prevIndex) {
      //result = prevPoint;
      return prevPoint;
    } else {
      prevPoint = gift_items[Random().nextInt(gift_items.length - 1)].point;
      prevIndex = index;

      //result = prevPoint;
      return prevPoint;
    }
  }

  // show the result in the top of screen above wheel when start is pressed
  buildResult(_value) {
    var _index = _calIndex(_value * angle + current);

    return Visibility(
      visible: isStart,
      child: Padding(
        //padding: EdgeInsets.symmetric(vertical: 48.0),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.red,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                // _items[_index].point,
                getGiftItem(
                    _index), // to get value from created items no all spin item
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ), //gosterim
        ),
      ),
    );
  }
}
