// import 'package:flutter/material.dart';
// import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_bloc.dart';
// import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_event.dart';
// import 'package:open_sism/presentation/configurations/size_config.dart';
// import 'package:open_sism/presentation/screens/game/spin_games/components/board_view.dart';
// import 'package:open_sism/presentation/screens/game/spin_games/components/build.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:open_sism/logic/blocs/luckyWheelBloc/wheel_state.dart';
// import 'package:open_sism/presentation/screens/game/spin_games/components/model.dart';
//
// class WhellFortune extends StatefulWidget {
//   static const String routeName = "/spin_screen";
//   @override
//   State<StatefulWidget> createState() {
//     return _WhellFortuneState();
//   }
// }
//
// class _WhellFortuneState extends State<WhellFortune>
//     with SingleTickerProviderStateMixin {
//   BuildMethod buildMethod = BuildMethod();
//   List<int> giftId = [];
//   var  _value  ;
//   var  _angle ;
//   void spinInitState() {
//     setState(() {
//       buildMethod.current = 0;
//       buildMethod.angle = 0;
//       buildMethod.isStart = false;
//       buildMethod.prevPoint = buildMethod.gift_items[0].point;
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     var _duration = Duration(milliseconds: 5000);
//     buildMethod.ctrl = AnimationController(vsync: this, duration: _duration);
//     buildMethod.ani = CurvedAnimation(
//         parent: buildMethod.ctrl, curve: Curves.fastLinearToSlowEaseIn);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     //setState(() {
//     buildMethod.isStart = false;
//     buildMethod.isEnd = false;
//     // });
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context); // to get the screen size
//     return Scaffold(
//       body: Container(
//         height: SizeConfig.screenHeight,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/wheel.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: buildAnimatedBuilder(),
//       ),
//     );
//   }
//
//   //build the main view of spin
//   AnimatedBuilder buildAnimatedBuilder() {
//     return AnimatedBuilder(
//         animation: buildMethod.ani,
//         builder: (context, child) {
//            _value = buildMethod.ani.value;
//            _angle = _value * buildMethod.angle;
//           // print("res");
//           //  print(res);
//           return SingleChildScrollView(
//             child: Column(
//               //alignment: Alignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 50.0),
//                     child: Text(
//                       "Spin To Win",
//                       style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(10),
//                 ),
//                 buildMethod.buildResult(_value),
//                 SizedBox(
//                   height: getProportionateScreenHeight(10),
//                 ),
//                 BlocBuilder<WheelBloc, WheelState>(builder: (context, state) {
//                   if (state is WheelLoadedSuccess) {
//                     context.read<WheelBloc>().add(WheelDataReadyEvent());
//                     //return Luck Items contains the valid prizes and
//                     // store in buildmethod.giftItemsN
//                     // ignore: unnecessary_statements
//                     buildGift(state);
//                     //  print(state.wheelData.content.prizes.first.description);
//                     buildMethod.wheelGiftParts = state.wheelData.content.prizes
//                         .map(
//                           (item) => Luck(
//                               buildMethod.itemsImages[
//                                   state.wheelData.content.prizes.indexOf(item)],
//                               buildMethod.itemsColors[
//                                   state.wheelData.content.prizes.indexOf(item)],
//                               state.wheelData.content.prizes[state.wheelData.content.prizes.indexOf(item)].value < 10000
//                                   ? state
//                                       .wheelData
//                                       .content
//                                       .prizes[state.wheelData.content.prizes
//                                           .indexOf(item)]
//                                       .value
//                                       .toString()
//                                   : (state.wheelData.content.prizes[state.wheelData.content.prizes.indexOf(item)].value ~/
//                                               1000)
//                                           .toString() +
//                                       "K",
//                               state
//                                   .wheelData
//                                   .content
//                                   .prizes[state.wheelData.content.prizes.indexOf(item)]
//                                   .prizeType
//                                   .displayName),
//                         )
//                         .toList();
//
//                     return buildBoardViewWithData(_angle, context, state);
//                   } else if (state is WheelDataReady) {
//                     return buildBoardViewWithData(_angle, context, state);
//                   } else if (state is WheelAddPrize) {
//                     return buildBoardViewWithData(_angle, context, state);
//                   } else if (state is WheelAddSuccess) {
//                     return buildBoardViewWithData(_angle, context, state);
//                   } else
//                     //return the standard spin view
//
//                     return buildBoardView(_angle, context);
//                 }),
//                 SizedBox(
//                   height: getProportionateScreenHeight(10),
//                 ),
//                 resultVisibility(context),
//                 // _buildGo(),
//               ],
//             ),
//           );
//         });
//   }
//
// //return the Bord Vire with data of  spin
//   Widget buildBoardViewWithData(
//       _angle, BuildContext context, WheelState state) {
//     if (state is WheelDataReady) {
//       return BoardView(
//         items: buildMethod.wheelGiftParts,
//         current: buildMethod.current,
//         angle: _angle,
//         isStart: buildMethod.isStart,
//         press: () {
//           setState(
//             () {
//               buildMethod.isStart = true;
//               buildMethod.isEnd = false;
//               buildMethod.animation(context, spinInitState);
//             },
//           );
//         },
//       );
//     } else if (state is WheelAddPrize) {
//
//       return Container(
//         height: getProportionateScreenWidth(80),
//         width: getProportionateScreenWidth(80),
//         child: Text("adding your Prize"),
//       );
//     } else if (state is WheelAddSuccess) {
//       return Container(
//         height: getProportionateScreenWidth(80),
//         width: getProportionateScreenWidth(80),
//         child: Text("adding your Prize Success "),
//       );
//     }
//     // return BoardView(
//     //   items: buildMethod.wheelGiftParts,
//     //   current: buildMethod.current,
//     //   angle: _angle,
//     //   isStart: buildMethod.isStart,
//     //   press: () {
//     //     setState(
//     //       () {
//     //         buildMethod.isStart = true;
//     //         buildMethod.isEnd = false;
//     //         buildMethod.animation(context, spinInitState);
//     //       },
//     //     );
//     //   },
//     // );
//   }
//
//   //return the standard spin view
//   BoardView buildBoardView(_angle, BuildContext context) {
//     return BoardView(
//       items: buildMethod.items,
//       current: buildMethod.current,
//       angle: _angle,
//       isStart: buildMethod.isStart,
//       press: () {
//         setState(
//           () {
//             buildMethod.isStart = true;
//             buildMethod.isEnd = false;
//             buildMethod.animation(context, spinInitState);
//           },
//         );
//       },
//     );
//   }
//
//   void buildGift(WheelState state) {
//     List<Luck> items = [];
//     //buildMethod.giftItemsN = [];
//     if (state is WheelLoadedSuccess) {
//       state.wheelData.content.prizes.map((item) {
//         if (state.wheelData.content
//             .prizes[state.wheelData.content.prizes.indexOf(item)].isValid) {
//           items.add(Luck(
//               buildMethod
//                   .itemsImages[state.wheelData.content.prizes.indexOf(item)],
//               buildMethod
//                   .itemsColors[state.wheelData.content.prizes.indexOf(item)],
//               state.wheelData.content
//                   .prizes[state.wheelData.content.prizes.indexOf(item)].value
//                   .toString(),
//               state
//                   .wheelData
//                   .content
//                   .prizes[state.wheelData.content.prizes.indexOf(item)]
//                   .prizeType
//                   .displayName));
//           giftId.add(state.wheelData.content
//               .prizes[state.wheelData.content.prizes.indexOf(item)].id);
//           // giftId = state.wheelData.content.prizes
//           //     .map((item) => state
//           //     .wheelData
//           //     .content
//           //     .prizes[
//           // state.wheelData.content.prizes.indexOf(item)]
//           //     .id)
//           //     .toList();
//         }
//       }).toList();
//     }
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       buildMethod.giftItemsN = items;
//     });
//   }
//
//   //show the result in the screen buttom after animation end
//   Visibility resultVisibility(BuildContext context) {
//     return Visibility(
//       visible: buildMethod.isEnd,
//       child: Container(
//         padding: EdgeInsets.all(getProportionateScreenWidth(1)),
//         alignment: Alignment.center,
//         height: getProportionateScreenWidth(80),
//         width: getProportionateScreenWidth(80),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.amber.withOpacity(0.6),
//
//           //borderRadius: BorderRadius.circular(10),
//         ),
//         child: BlocBuilder<WheelBloc, WheelState>(builder: (context, state) {
//           if (state is WheelDataReady) {
//             // print(giftId[buildMethod.finalIndex]);
//             context
//                 .read<WheelBloc>()
//                 .add(WheelAddPrizeEvent(giftId[buildMethod.finalIndex]));
//             return RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: buildMethod.result,
//                     style: Theme.of(context).textTheme.headline4.copyWith(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24),
//                   ),
//                 ],
//               ),
//             );
//           } else if (state is WheelAddPrize) {
//             // context.read<WheelBloc>().add(WheelPageRequested());
//             return RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: buildMethod.result,
//                     style: Theme.of(context).textTheme.headline4.copyWith(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24),
//                   ),
//                 ],
//               ),
//             );
//           } else if (state is WheelAddSuccess) {
//             // Future.delayed(const Duration(milliseconds: 1000), () {
//             // function spin init state
//             context.read<WheelBloc>().add(WheelPageRequested());
//             // });
//             return RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: buildMethod.result,
//                     style: Theme.of(context).textTheme.headline4.copyWith(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24),
//                   ),
//                 ],
//               ),
//             );
//           } else
//             return RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "0",
//                     style: Theme.of(context).textTheme.headline4.copyWith(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24),
//                   ),
//                 ],
//               ),
//             );
//         }),
//       ),
//     );
//   }
// }
