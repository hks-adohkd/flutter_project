import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/game/daily_bonus/components/cardItem.dart';
import 'package:open_sism/presentation/screens/game/daily_bonus/components/buttom_clipper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_sism/logic/blocs/bonusBloc/bonus_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/bonusBloc/bonus_state.dart';
import 'package:open_sism/logic/blocs/bonusBloc/bonus_event.dart';

List<CardItem> cards;
CardItem card;
List<String> images = [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png',
  'assets/images/5.png',
  'assets/images/6.png',
  'assets/images/7.png',
  'assets/images/7.png',
];
List<String> title = [
  'Day One',
  'Day Two',
  'Day Three',
  'Day Four',
  'Day Five',
  'Day Six',
  'Day Seven',
  'Day eight',
];

class DailyBonus extends StatefulWidget {
  static const String routeName = "/daily_bonus_screen";
  @override
  _DailyBonusState createState() => _DailyBonusState();
}

class _DailyBonusState extends State<DailyBonus> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: kAppBarHeight,
          child: ReusableAppBar(
            appBarTitle: "Daily Bonus",
          ),
        ),
        body: Container(
          decoration: kBoxDecoration,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'Daily',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Surfer',
                        color: Colors.yellow[700],
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 8, top: 10),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: SizeConfig.screenHeight * 0.3,
                        child: BlocBuilder<BonusBloc, BonusState>(
                            builder: (context, state) {
                          if (state is BonusLoadedSuccess) {
                            print("BonusLoadedSuccess");
                            // print(state.bonusData.content.prizes.last.value);

                            cards = state.bonusData.content.prizes
                                .map((item) => CardItem(
                                      imagePath: images[state
                                          .bonusData.content.prizes
                                          .indexOf(item)],
                                      title: title[state
                                          .bonusData.content.prizes
                                          .indexOf(item)],
                                      description: 'None',
                                      price: state
                                          .bonusData
                                          .content
                                          .prizes[state.bonusData.content.prizes
                                              .indexOf(item)]
                                          .value
                                          .toString(),
                                    ))
                                .toList();
                            //
                            // print(cards.last.price);
                            // cards.forEach((element) {
                            //   print(element.price);
                            // });
                            context
                                .read<BonusBloc>()
                                .add(BonusDataReadyEvent());
                            return ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  CardItem(
                                    imagePath: 'assets/images/logo.png',
                                    title: 'No Data',
                                    description: 'Mix vegetables',
                                    price: '0',
                                  ),
                                ]);
                          } else if (state is BonusDataReady) {
                            print("BonusDataReady");
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (BuildContext context, int index) {
                                  cards[index].press =
                                      () => addGift(context, state);
                                  if (index < 7) {
                                    // Return Widget for this condition,
                                    if (index + 1 <
                                        state.bonusData.currentCustomer
                                            .dailyBonusLevel) {
                                      cards[index].visibility = true;
                                    } else {
                                      cards[index].visibility = false;
                                    }
                                    return Row(
                                      children: [
                                        cards[index],
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ); //cards[index];
                                  } else {
                                    // Return else widget
                                    // if you don't have else widget the return null like below
                                    return null;
                                  }
                                });
                          } else if (state is BonusAddPrize) {
                            print("BonusAddPrize state");

                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (BuildContext context, int index) {
                                  print(cards[index].visibility);
                                  return Row(
                                    children: [
                                      cards[index],
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ); //cards[index];
                                });
                          } else if (state is BonusAddSuccess) {
                            context.read<BonusBloc>().add(BonusPageRequested());
                            return null;
                          } else
                            return ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  CardItem(
                                    imagePath: 'assets/images/logo.png',
                                    title: 'Failure Data',
                                    description: 'Mix vegetables',
                                    price: '0',
                                  ),
                                ]);
                        }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<BonusBloc, BonusState>(builder: (context, state) {
                    print(state);
                    if (state is BonusAddPrize) {
                      return ElevatedButton(
                          onPressed: () => addGift(context, state),
                          child: Text("new"));
                    } else
                      return ElevatedButton(
                          onPressed: () => addGift(context, state),
                          child: Text("hhhhhhhh"));
                  }),
                  Text(
                    'Weekly',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Surfer',
                      color: Colors.yellow[700],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  passwordIconWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stack passwordIconWidget() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: CircleAvatar(
            maxRadius: 30,
            child: Container(child: Image.asset("assets/images/imgforgot.png")),
            //backgroundColor: Colors.white,
          ),
        ),
        Opacity(
          opacity: 0.2,
          child: Image.asset(
            "assets/images/giftt.png",
            height: 150,
            width: 150,
          ),
        ),
      ],
    );
  }

  void addGift(BuildContext context, BonusState state) {
    if (state is BonusDataReady) {
      // int index = state.bonusData.currentCustomer.dailyBonusLevel - 1;
      // print(index);

      // int id = state.bonusData.content.prizes[index].id;
      //  print({"id: ", id});
      setState(() {
        cards[3].visibility = true;
        //
        //     //BlocProvider.of<BonusBloc>(context).add(BonusAddPrizeEvent(id));
        //     //context.read<BonusBloc>().add(BonusAddPrizeEvent(id));
      });
      context.read<BonusBloc>().add(BonusAddPrizeEvent(3));
    } else
      return null;
  }
}
