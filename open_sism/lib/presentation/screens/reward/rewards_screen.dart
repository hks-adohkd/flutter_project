import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_state.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_bloc.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_state.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/reward/components/prizeBundel.dart';
import 'package:open_sism/presentation/components/card_component.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/screens/reward/components/reward_PlaceHolder.dart';
import 'components/redeem_screen.dart';

class RewardScreen extends StatefulWidget {
  static const String routeName = "/prizeScreen";

  @override
  _RewardScreenState createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: 'Rewards',
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff512DA8),
                Color(0xff536DFE),
              ],
            ),
            border: Border.all(style: BorderStyle.solid, color: Colors.black),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                //Categories(),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize * 2),
                    child: BlocBuilder<PrizeBloc, PrizeState>(
                      builder: (context, state) {
                        if (state is PrizeLoadedSuccess) {
                          List<PrizeBundle> prizeList =
                              createPrizeList(state: state);
                          //print(prizeList.first.description);
                          return buildGridView(prizeList);
                        } else
                          return RewardPlaceHolder();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GridView buildGridView(List<PrizeBundle> prizeList) {
    return GridView.builder(
      itemCount: prizeBundles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: SizeConfig.orientation == Orientation.landscape ? 2 : 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.defaultSize * 2
            : 0,
        childAspectRatio: 1.65,
      ),
      itemBuilder: (context, index) => RecipeBundelCard(
        selectedGender: ScreenType.prize,
        recipeBundle: prizeList[index],
        press: () {
          setState(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RedeemScreen(prizeBundle: prizeList[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color getPrizeColor(PrizeLoadedSuccess state, int index) {
    if (state.prizeData.content.prizes[index].prizeType.name == "gift_card") {
      return kGooglePlayCardColor;
    } else if (state.prizeData.content.prizes[index].prizeType.name ==
        "units") {
      return kSyriatelCardColor;
    } else
      return kMtnCardColor;
  }

  List<PrizeBundle> createPrizeList({PrizeState state}) {
    //List<PrizeBundle> prizeBundles;
    if (state is PrizeLoadedSuccess) {
      return prizeBundles = state.prizeData.content.prizes
          .map(
            (item) => PrizeBundle(
              id: state.prizeData.content
                  .prizes[state.prizeData.content.prizes.indexOf(item)].id,
              description: state
                  .prizeData
                  .content
                  .prizes[state.prizeData.content.prizes.indexOf(item)]
                  .description,
              imageSrc: state
                  .prizeData
                  .content
                  .prizes[state.prizeData.content.prizes.indexOf(item)]
                  .imageUrl,
              value: state.prizeData.content
                  .prizes[state.prizeData.content.prizes.indexOf(item)].value
                  .toString(),
              points: state.prizeData.content
                  .prizes[state.prizeData.content.prizes.indexOf(item)].points,
              title: state
                  .prizeData
                  .content
                  .prizes[state.prizeData.content.prizes.indexOf(item)]
                  .displayName,
              color: getPrizeColor(
                  state, state.prizeData.content.prizes.indexOf(item)),
            ),
          )
          .toList();
    } else
      return null;
  }
}
