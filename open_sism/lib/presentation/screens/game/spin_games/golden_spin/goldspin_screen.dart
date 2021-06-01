import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_event.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/board_view.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/build.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_state.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/model.dart';

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
    //setState(() {
    buildMethod.isStart = false;
    buildMethod.isEnd = false;
    // });
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
                buildMethod.buildPremiumResult(_value),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                BlocBuilder<WheelPremiumBloc, WheelState>(
                    builder: (context, state) {
                  if (state is WheelPremiumLoadedSuccess) {
                    context
                        .read<WheelPremiumBloc>()
                        .add(WheelPremiumDataReadyEvent());
                    buildGift(state);
                    buildMethod.wheelPremiumGiftParts = state
                        .wheelData.content.prizes
                        .map(
                          (item) => Luck(
                              buildMethod.itemsImages[
                                  state.wheelData.content.prizes.indexOf(item)],
                              buildMethod.itemsColors[
                                  state.wheelData.content.prizes.indexOf(item)],
                              state
                                      .wheelData
                                      .content
                                      .prizes[state.wheelData.content.prizes
                                          .indexOf(item)]
                                      .value
                                      .toString() +
                                  "k",
                              state
                                  .wheelData
                                  .content
                                  .prizes[state.wheelData.content.prizes
                                      .indexOf(item)]
                                  .prizeType
                                  .displayName),
                        )
                        .toList();
                    return buildBoardViewWithData(_angle, context);
                  } else if (state is WheelPremiumDataReady) {
                    //  print("WheelDataReady");
                    print("premium");
                    // buildMethod.giftItemsN.forEach((element) {
                    //   print(element.point);
                    // });
                    //  print("WheelDataReadyEvent");
                    return buildBoardViewWithData(_angle, context);
                  } else
                    return buildBoardView(_angle, context);
                }),
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

  BoardView buildBoardView(_angle, BuildContext context) {
    return BoardView(
      items: buildMethod.items,
      current: buildMethod.current,
      angle: _angle,
      isStart: buildMethod.isStart,
      press: () {
        setState(
          () {
            buildMethod.isStart = true;
            buildMethod.isEnd = false;
            //   buildMethod.animation(context, spinInitState);
          },
        );
      },
    );
  }

  BoardView buildBoardViewWithData(_angle, BuildContext context) {
    return BoardView(
      items: buildMethod.wheelPremiumGiftParts,
      current: buildMethod.current,
      angle: _angle,
      isStart: buildMethod.isStart,
      press: () {
        setState(
          () {
            buildMethod.isStart = true;
            buildMethod.isEnd = false;
            //    buildMethod.animation(context, spinInitState);
          },
        );
      },
    );
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

  void buildGift(WheelState state) {
    List<Luck> items = [];
    //buildMethod.giftItemsN = [];
    if (state is WheelPremiumLoadedSuccess) {
      state.wheelData.content.prizes.map((item) {
        if (state.wheelData.content
            .prizes[state.wheelData.content.prizes.indexOf(item)].isValid) {
          items.add(Luck(
              buildMethod
                  .itemsImages[state.wheelData.content.prizes.indexOf(item)],
              buildMethod
                  .itemsColors[state.wheelData.content.prizes.indexOf(item)],
              state
                      .wheelData
                      .content
                      .prizes[state.wheelData.content.prizes.indexOf(item)]
                      .value
                      .toString() +
                  "k",
              state
                  .wheelData
                  .content
                  .prizes[state.wheelData.content.prizes.indexOf(item)]
                  .prizeType
                  .displayName));
        }
      }).toList();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      buildMethod.giftPremiumItemsN = items;
    });

    // print("new");
    // buildMethod.giftItemsN.forEach((element) {
    //   print(element.point);
    // });
  }
}
