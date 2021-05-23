import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/board_view.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/build.dart';

class GoldWheelFortune extends StatefulWidget {
  static const String routeName = "/gold_spin_screen";
  @override
  State<StatefulWidget> createState() {
    return _GoldWheelFortuneState();
  }
}

class _GoldWheelFortuneState extends State<GoldWheelFortune>
    with SingleTickerProviderStateMixin {
  BuildMethod buildMethod = BuildMethod();

  void spinInitState() {
    setState(() {
      buildMethod.current = 0;
      buildMethod.angle = 0;
      buildMethod.isStart = false;
      buildMethod.prevPoint = buildMethod.gift_items[0].point;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _duration = Duration(milliseconds: 5000);
    buildMethod.ctrl = AnimationController(vsync: this, duration: _duration);
    buildMethod.ani = CurvedAnimation(
        parent: buildMethod.ctrl, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {
      buildMethod.isStart = false;
      buildMethod.isEnd = false;
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
            image: AssetImage("assets/images/goldenwheel.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: buildAnimatedBuilder(),
      ),
    );
  }

  //build the main view of spin
  AnimatedBuilder buildAnimatedBuilder() {
    return AnimatedBuilder(
        animation: buildMethod.ani,
        builder: (context, child) {
          final _value = buildMethod.ani.value;
          final _angle = _value * buildMethod.angle;
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
                buildMethod.buildResult(_value),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                BoardView(
                  items: buildMethod.goldItems,
                  current: buildMethod.current,
                  angle: _angle,
                  isStart: buildMethod.isStart,
                  press: () {
                    setState(
                      () {
                        buildMethod.isStart = true;
                        buildMethod.isEnd = false;
                        buildMethod.animation(context, spinInitState);
                      },
                    );
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                resultVisibility(context),
                // _buildGo(),
              ],
            ),
          );
        });
  }

  //show the result in the screen buttom after animation end
  Visibility resultVisibility(BuildContext context) {
    return Visibility(
      visible: buildMethod.isEnd,
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(1)),
        alignment: Alignment.center,
        height: getProportionateScreenWidth(80),
        width: getProportionateScreenWidth(80),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.withOpacity(0.6),

          //borderRadius: BorderRadius.circular(10),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: buildMethod.result,
                style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
