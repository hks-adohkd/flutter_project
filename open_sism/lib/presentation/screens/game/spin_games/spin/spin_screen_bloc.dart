import 'package:flutter/material.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_event.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/board_view.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/build.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_state.dart';
import 'package:open_sism/presentation/screens/game/spin_games/components/model.dart';

class WhellFortune extends StatefulWidget {
  static const String routeName = "/spin_screen";
  @override
  State<StatefulWidget> createState() {
    return _WhellFortuneState();
  }
}

class _WhellFortuneState extends State<WhellFortune>
    with SingleTickerProviderStateMixin {
  BuildMethod buildMethod = BuildMethod();
  List<int> giftId = [];
  var _value;
  var _angle;
  bool allowed = true;
  //bool alertAllowed = true;
  int remain;
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
    //setState(() {
    buildMethod.isStart = false;
    buildMethod.isEnd = false;
    // });
    super.dispose();
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
        child: buildAnimatedBuilder(),
      ),
    );
  }

  //build the main view of spin
  AnimatedBuilder buildAnimatedBuilder() {
    return AnimatedBuilder(
        animation: buildMethod.ani,
        builder: (context, child) {
          _value = buildMethod.ani.value;
          _angle = _value * buildMethod.angle;

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
                BlocBuilder<WheelBloc, WheelState>(builder: (context, state) {
                  if (state is WheelLoadInProgress) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _value = buildMethod.ani.value;
                      _angle = _value * buildMethod.angle;
                    });
                  }
                  if (state is WheelLoadedSuccess) {
                    print("WheelLoadedSuccess");
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _value = buildMethod.ani.value;
                      _angle = _value * buildMethod.angle;
                    });
                  }

                  return buildMethod.buildResult(_value);
                }),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                BlocBuilder<WheelBloc, WheelState>(builder: (context, state) {
                  if (state is WheelLoadedSuccess) {
                    context.read<WheelBloc>().add(WheelDataReadyEvent());
                    // return Luck Items contains the valid prizes and
                    // store in buildmethod.giftItemsN
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _value = buildMethod.ani.value;
                      _angle = _value * buildMethod.angle;
                    });
                    buildGift(state);
                    // WidgetsBinding.instance.addPostFrameCallback((_) {
                    //   buildGift(state);
                    // });

                    //  print(buildMethod.giftItemsN.first.point);
                    buildMethod.wheelGiftParts = state.wheelData.content.prizes
                        .map(
                          (item) => Luck(
                              buildMethod.itemsImages[
                                  state.wheelData.content.prizes.indexOf(item)],
                              buildMethod.itemsColors[
                                  state.wheelData.content.prizes.indexOf(item)],
                              state.wheelData.content.prizes[state.wheelData.content.prizes.indexOf(item)].value < 10000
                                  ? state
                                      .wheelData
                                      .content
                                      .prizes[state.wheelData.content.prizes
                                          .indexOf(item)]
                                      .value
                                      .toString()
                                  : (state.wheelData.content.prizes[state.wheelData.content.prizes.indexOf(item)].value ~/
                                              1000)
                                          .toString() +
                                      "K",
                              state
                                  .wheelData
                                  .content
                                  .prizes[state.wheelData.content.prizes.indexOf(item)]
                                  .prizeType
                                  .displayName),
                        )
                        .toList();

                    // return buildBoardViewWithData(_angle, context, state);
                    return Container(
                      child: Text("Preparing your Spin Data "),
                    );
                    // return buildMethod.buildResult(_value);
                  } else if (state is WheelDataReady) {
                    print(buildMethod.giftItemsN.first.point);
                    return buildBoardViewWithData(_angle, context, state);
                    // return Container(
                    //   child: Text(" your  Spin Data ready "),
                    // );
                  } else if (state is WheelAddPrize) {
                    // return buildBoardViewWithData(_angle, context, state);
                    return Container(
                      child: Text("Preparing your AddPrize Data "),
                    );
                  } else if (state is WheelAddSuccess) {
                    // return buildBoardViewWithData(_angle, context, state);
                    return Container(
                      child: Text(""),
                    );
                  } else
                    //return the standard spin view

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

//return the Bord Vire with data of  spin
  Widget buildBoardViewWithData(
      _angle, BuildContext context, WheelState state) {
    if (state is WheelDataReady) {
      return BoardView(
        items: buildMethod.wheelGiftParts,
        current: buildMethod.current,
        angle: _angle,
        isStart: buildMethod.isStart,
        press: () {
          buildMethod.isStart = true;
          buildMethod.isEnd = false;
          buildMethod.animation(context, spinInitState, allowed);
          // setState(
          //   () {
          //     buildMethod.isStart = true;
          //     buildMethod.isEnd = false;
          //     buildMethod.animation(context, spinInitState);
          //   },
          // );
        },
      );
    } else if (state is WheelAddPrize) {
      return Container(
        height: getProportionateScreenWidth(80),
        width: getProportionateScreenWidth(80),
        child: Text("adding your Prize"),
      );
    } else if (state is WheelAddSuccess) {
      return Container(
        height: getProportionateScreenWidth(80),
        width: getProportionateScreenWidth(80),
        child: Text("adding your Prize Success "),
      );
    }
    // return BoardView(
    //   items: buildMethod.wheelGiftParts,
    //   current: buildMethod.current,
    //   angle: _angle,
    //   isStart: buildMethod.isStart,
    //   press: () {
    //     setState(
    //       () {
    //         buildMethod.isStart = true;
    //         buildMethod.isEnd = false;
    //         buildMethod.animation(context, spinInitState);
    //       },
    //     );
    //   },
    // );
  }

  //return the standard spin view
  BoardView buildBoardView(_angle, BuildContext context) {
    return BoardView(
      items: buildMethod.items,
      current: buildMethod.current,
      angle: _angle,
      isStart: buildMethod.isStart,
      press: () {
        buildMethod.isStart = true;
        buildMethod.isEnd = false;
        buildMethod.animation(context, spinInitState, allowed);
        // setState(
        //   () {
        //     buildMethod.isStart = true;
        //     buildMethod.isEnd = false;
        //     buildMethod.animation(context, spinInitState);
        //   },
        // );
      },
    );
  }

  void buildGift(WheelState state) {
    List<Luck> items = [];
    //buildMethod.giftItemsN = [];
    if (state is WheelLoadedSuccess) {
      state.wheelData.content.prizes.map((item) {
        if (state.wheelData.content
            .prizes[state.wheelData.content.prizes.indexOf(item)].isValid) {
          items.add(Luck(
              buildMethod
                  .itemsImages[state.wheelData.content.prizes.indexOf(item)],
              buildMethod
                  .itemsColors[state.wheelData.content.prizes.indexOf(item)],
              state.wheelData.content
                  .prizes[state.wheelData.content.prizes.indexOf(item)].value
                  .toString(),
              state
                  .wheelData
                  .content
                  .prizes[state.wheelData.content.prizes.indexOf(item)]
                  .prizeType
                  .displayName));
          giftId.add(state.wheelData.content
              .prizes[state.wheelData.content.prizes.indexOf(item)].id);
          // giftId = state.wheelData.content.prizes
          //     .map((item) => state
          //     .wheelData
          //     .content
          //     .prizes[
          // state.wheelData.content.prizes.indexOf(item)]
          //     .id)
          //     .toList();
        }
      }).toList();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // setState(() {
      buildMethod.giftItemsN = items;
      buildMethod.giftIdTemp = giftId;
      //  });
    });

    // print(buildMethod.giftItemsN.first.point);
  }

  //show the result in the screen buttom after animation end
  Visibility resultVisibility(BuildContext context) {
    return Visibility(
      visible: buildMethod.isEnd,
      child: BlocBuilder<WheelBloc, WheelState>(builder: (context, state) {
        if (state is WheelDataReady) {
          if (allowed) {
            return Column(
              children: [
                Container(
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
                SizedBox(
                  height: 5,
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 20, color: Colors.amber),
                )
              ],
            );
          } else if (!allowed) {
            return Text("");
          } else
            return Text("error in Ready");
        } else if (state is WheelAddSuccess) {
          Future.delayed(const Duration(milliseconds: 2000), () {
            context.read<WheelBloc>().add(WheelPageRequested());
          });

          if (state.wheelPrize.message == "NotAllowed") {
            allowed = false;
            int nowHour = new DateTime.now().hour;
            // print({"now", nowHour});
            int doHour =
                state.wheelPrize.currentCustomer.luckyWheelLastSpinDate.hour;
            //print({"doHour", doHour});
            remain = 24 - (nowHour - doHour);
            return Center(
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(1)),
                alignment: Alignment.center,
                height: getProportionateScreenWidth(120),
                width: getProportionateScreenWidth(140),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  //color: Colors.amber.withOpacity(0.6),

                  //borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Added  Error",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        'Come Back in ',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        '$remain : 00 ',
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
          } else if (state.wheelPrize.message == "success") {
            allowed = true;
            return Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(1)),
              alignment: Alignment.center,
              height: getProportionateScreenWidth(120),
              width: getProportionateScreenWidth(140),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                //color: Colors.amber.withOpacity(0.6),

                //borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Added Successful",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            );
          } else
            allowed = false;
          return Text("Error");
        } else {
          return Text("");
        }
      }),
    );
  }
}
