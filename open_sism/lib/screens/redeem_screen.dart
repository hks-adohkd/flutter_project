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

bool scrollBarShown() {
  if (SizeConfig.orientation == Orientation.landscape) {
    return true;
  } else
    return false;
}

class _RedeemScreenState extends State<RedeemScreen> {
  bool scrollShown;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    scrollShown = scrollBarShown();
    //double defaultSize = SizeConfig.defaultSize;
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
                    child: Scrollbar(
                      isAlwaysShown: scrollShown,
                      hoverThickness: 10,
                      thickness: 20,
                      child: SingleChildScrollView(
                        child: Container(
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GridView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 1,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: SizeConfig.orientation ==
                                          Orientation.landscape
                                      ? 2
                                      : 1,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: SizeConfig.orientation ==
                                          Orientation.landscape
                                      ? SizeConfig.defaultSize * 2
                                      : 0,
                                  childAspectRatio: 1.65,
                                ),
                                itemBuilder: (context, index) =>
                                    RecipeBundelCard(
                                  selectedGender: ScreenType.prize,
                                  recipeBundle: widget.prizeBundle,
                                  press: () {},
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                  'this is a gift card for google play this is a gift card for google play'),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Redeem Reward'),
                              ),
                            ],
                          ),
                        ),
                      ),
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
}
