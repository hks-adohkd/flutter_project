import 'dart:math';

import 'package:flutter/material.dart';
import 'package:open_sism/screens/game/components/navigator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/screens/game/spin/components/board_view.dart';

import 'package:open_sism/screens/game/spin/components/build.dart';
import 'package:open_sism/screens/game/spin/components/model.dart';

class WhellFortune extends StatefulWidget {
  static String routeName = "/spin_screen";
  @override
  State<StatefulWidget> createState() {
    return _WhellFortuneState();
  }
}

class _WhellFortuneState extends State<WhellFortune>
    with SingleTickerProviderStateMixin {
  BuildMethod buildMethod = BuildMethod();

  double _angle = 0;
  double _current = 0;
  AnimationController _ctrl;
  Animation _ani;
  bool isStart = false;
  bool isEnd = false;
  var prevIndex;
  String prevPoint;
  String result;

  void spinInitState() {
    setState(() {
      _current = 0;
      _angle = 0;
      isStart = false;
      prevPoint = buildMethod.gift_items[0].point;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _duration = Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {
      isStart = false;
      isEnd = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wheel.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedBuilder(
            animation: _ani,
            builder: (context, child) {
              final _value = _ani.value;
              final _angle = _value * this._angle;
              return SingleChildScrollView(
                child: Column(
                  //alignment: Alignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          "Spin To Win",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    _buildResult(_value),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    BoardView(
                      items: buildMethod.items,
                      current: _current,
                      angle: _angle,
                      isStart: isStart,
                      press: () {
                        setState(
                          () {
                            isStart = true;
                            isEnd = false;
                            _animation();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Visibility(
                      visible: isEnd,
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(1)),
                        alignment: Alignment.center,
                        height: getProportionateScreenWidth(80),
                        width: getProportionateScreenWidth(80),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber.withOpacity(0.6),

                          //borderRadius: BorderRadius.circular(10),
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: result,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // _buildGo(),
                  ],
                ),
              );
            }),
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        result = prevPoint;
        isEnd = true;
        spinInitState();
        _alert(context); //end whell
        _ctrl.reset();
      });
    }
  }

  _alert(BuildContext context) {
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
          //onPressed: () => Nav.route(context, Home()),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }

  int _calIndex(value) {
    var _base = (2 * pi / buildMethod.items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * buildMethod.items.length).floor();
  }

  String getGiftItem(var index) {
    if (index == prevIndex) {
      //result = prevPoint;
      return prevPoint;
    } else {
      prevPoint = buildMethod
          .gift_items[Random().nextInt(buildMethod.gift_items.length - 1)]
          .point;
      prevIndex = index;

      print(prevPoint);

      //result = prevPoint;
      return prevPoint;
    }
  }

  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);

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
                color: Colors.amber,
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
                    color: Colors.amber,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ), //gosterim
        ),
      ),
    );
  }
}
