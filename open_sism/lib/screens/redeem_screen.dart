import 'package:flutter/material.dart';
import 'package:open_sism/components/appBar.dart';
import 'package:open_sism/configurations/constants.dart';
import 'package:open_sism/configurations/prizeBundel.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:open_sism/components/card_component.dart';

class RedeemScreen extends StatefulWidget {
  final PrizeBundle prizeBundle;
  RedeemScreen({@required this.prizeBundle});
  @override
  _RedeemScreenState createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: 'Redeem',
          leadingIcon: Icons.arrow_back_ios,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                // Color(0xff002171),
                // Color(0xff8bf6ff),
                Color(0xff512DA8),
                Color(0xff536DFE),
              ],
            ),
            border: Border.all(style: BorderStyle.solid, color: Colors.black),
          ),
          //constraints: BoxConstraints.expand(),
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
                    child: GridView.builder(
                      itemCount: 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            SizeConfig.orientation == Orientation.landscape
                                ? 1
                                : 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing:
                            SizeConfig.orientation == Orientation.landscape
                                ? SizeConfig.defaultSize * 1
                                : 0,
                        childAspectRatio: 1.65,
                      ),
                      itemBuilder: (context, index) => RecipeBundelCard(
                        selectedGender: ScreenType.prize,
                        recipeBundle: widget.prizeBundle,
                        press: () {},
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('hello'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
