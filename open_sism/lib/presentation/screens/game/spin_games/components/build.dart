import 'package:flutter/material.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_event.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_state.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_state.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/model.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:open_sism/presentation/screens/reward/rewards_screen.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_bloc.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_event.dart';

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
  int finalIndex;
  List<int> giftIdTemp = [];
  List<Luck> giftItemsN = [];
  List<Luck> wheelGiftParts = [];

  List<Luck> giftPremiumItemsN = [];
  List<Luck> wheelPremiumGiftParts = [];

  List<String> itemsImages = [
    "apple",
    "raspberry",
    "grapes",
    "fruit",
    "milk",
    "salad",
    "cheese",
    "carrot",
  ];

  List<Color> itemsColors = [
    Color(0xFF9F6083),
    Color(0xFFFDB78B),
    Color(0xFF57CFE2),
    Color(0xFF606B7E),
    Color(0xFF24ACE9),
    Color(0xFFFB7C7A),
    Color(0xFF1BD3AC),
    Color(0xFFa73737),
  ];

  List<Luck> items = [
    Luck("apple", Color(0xFF9F6083), "0", "point"),
    Luck("raspberry", Color(0xFFFDB78B), "0", "point"),
    Luck("grapes", Color(0xFF57CFE2), "0", "point"),
    Luck("fruit", Color(0xFF606B7E), "0", "point"),
    Luck("milk", Color(0xFF24ACE9), "0", "point"),
    Luck("salad", Color(0xFFFB7C7A), "0", "point"),
    Luck("cheese", Color(0xFF1BD3AC), "0", "point"),
    Luck("carrot", Color(0xFFa73737), "0", "point"),
  ];

  List<Luck> goldItems = [
    Luck("apple", Color(0xFF9F6083), "1k", "point"),
    Luck("raspberry", Color(0xFFFDB78B), "30k", "point"),
    Luck("grapes", Color(0xFF57CFE2), "4.5k", "point"),
    Luck("fruit", Color(0xFF606B7E), "7.5k", "point"),
    Luck("milk", Color(0xFF24ACE9), "150k", "point"),
    Luck("salad", Color(0xFFFB7C7A), "25k", "point"),
    Luck("cheese", Color(0xFF1BD3AC), "50k", "point"),
    Luck("carrot", Color(0xFFa73737), "100k", "point"),
  ];

  List<Luck> gift_items = [
    Luck("apple", Color(0xFF9F6083), "10", "point"),
    Luck("raspberry", Color(0xFFFDB78B), "30", "point"),
    Luck("grapes", Color(0xFF57CFE2), "45", "point"),
    Luck("fruit", Color(0xFF606B7E), "75", "point"),
    Luck("milk", Color(0xFF24ACE9), "150", "point"),
  ];

  // main animation of wheel
  animation(BuildContext context, Function init, bool allowed) {
    if (!ctrl.isAnimating) {
      var _random = Random().nextDouble();
      angle = 20 + Random().nextInt(5) + _random;
      ctrl.forward(from: 0.0).then((_) {
        current = (current + _random);
        current = current - current ~/ 1;

        result =
            prevPoint; // to show the result in alert and in the main screen
        isEnd = true; // end of animation to control  the result visability
        init();
        Future.delayed(const Duration(milliseconds: 500), () {
          // function spin init state
          alert(context, allowed); //alert when the animation end
          ctrl.reset();
        });
      });
    }
  }

  // alert to go to reward screen and showing point in the end of animation
  alert(BuildContext context, bool allowed) {
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
      desc: allowed
          ? "You earned $result points. You can use it in your Rewards."
          : "Come back Later",
      buttons: [
        DialogButton(
          child: Text(
            "Get it ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            context
                .read<WheelBloc>()
                .add(WheelAddPrizeEvent(giftIdTemp[finalIndex]));
            // context.read<PrizeBloc>().add(PrizePageRequested());
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => RewardScreen()),
            //     ModalRoute.withName(HomeScreen.routeName));
            Navigator.pop(context);
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
    if (index > giftItemsN.length - 1) {
      index = Random().nextInt(giftItemsN.length);
    }
    if (index == prevIndex) {
      //result = prevPoint;
      finalIndex = index;
      return prevPoint;
    } else {
      // print({"getGiftItem  ", index});
      finalIndex = Random().nextInt(giftItemsN.length);
      prevPoint = giftItemsN[finalIndex].point;
      // print({index, prevPoint});
      prevIndex = index;

      //result = prevPoint;
      return prevPoint;
    }
  }

  String premiumGetGiftItem(var index) {
    if (index > giftPremiumItemsN.length - 1) {
      index = Random().nextInt(giftPremiumItemsN.length);
    }
    if (index == prevIndex) {
      //result = prevPoint;

      return prevPoint;
    } else {
      // print({"getGiftItem  ", index});

      prevPoint =
          giftPremiumItemsN[Random().nextInt(giftPremiumItemsN.length)].point;
      // print({index, prevPoint});
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
              BlocBuilder<WheelBloc, WheelState>(builder: (context, state) {
                if (state is WheelDataReady) {
                  getGiftItem(_index);
                  return Text(
                    // _items[_index].point,

                    "Spin your Gift ", // to get value from created items no all spin item
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  );
                } else
                  return Text(
                    // _items[_index].point,
                    "0", // to get value from created items no all spin item
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  );
              }),
            ],
          ), //gosterim
        ),
      ),
    );
  }

  buildPremiumResult(_value) {
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
              BlocBuilder<WheelPremiumBloc, WheelState>(
                  builder: (context, state) {
                if (state is WheelPremiumDataReady) {
                  premiumGetGiftItem(_index);
                  return Text(
                    // _items[_index].point,

                    "Spin your Gift ", // to get value from created items no all spin item
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  );
                } else
                  return Text(
                    // _items[_index].point,
                    "0", // to get value from created items no all spin item
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  );
              }),
            ],
          ), //gosterim
        ),
      ),
    );
  }
}
