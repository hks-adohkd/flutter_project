import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_bloc.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_event.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_bloc.dart';
import 'package:open_sism/logic/blocs/prizeBloc/prize_state.dart';
import 'package:open_sism/logic/blocs/redeemBloc/redeem_bloc.dart';
import 'package:open_sism/logic/blocs/redeemBloc/redeem_event.dart';
import 'package:open_sism/logic/blocs/redeemBloc/redeem_state.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/activity/activity_screen.dart';
import 'package:open_sism/presentation/screens/activity/order/order_screen.dart';
import 'package:open_sism/presentation/screens/home/home_screen.dart';
import 'package:open_sism/presentation/screens/reward/components/prizeBundel.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/components/card_component.dart';
import 'package:open_sism/presentation/components/alert_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:open_sism/presentation/configurations/utils.dart';
import 'package:open_sism/presentation/screens/reward/rewards_screen.dart';

class RedeemScreen extends StatefulWidget {
  static const String routeName = "/redeemScreen";
  final PrizeBundle prizeBundleArgs;
  RedeemScreen({this.prizeBundleArgs});
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
  var result;
  AlertWidget redeemAlert = AlertWidget();
  PrizeBundle prizeBundle;
  // return success dialog after redeemption accepted
  startTaskResultAweasom(bool result) {
    if (result) {
      return AwesomeDialog(
          context: context,
          animType: AnimType.LEFTSLIDE,
          headerAnimationLoop: false,
          dialogType: DialogType.SUCCES,
          title: 'Success',
          desc: 'you have requested Prize successfully',
          btnOkOnPress: () {
            // debugPrint('OnClcik');

            int count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 2;
            });
          },
          btnOkIcon: Icons.check_circle,
          onDissmissCallback: () {
            // debugPrint('Dialog Dissmiss from callback');
            // Navigator.pop(context);
            context.read<HomeBloc>().add(HomePageRequested());
          }).show();
    } else {
      return AwesomeDialog(
              context: context,
              animType: AnimType.LEFTSLIDE,
              headerAnimationLoop: false,
              dialogType: DialogType.ERROR,
              title: 'Failed',
              desc: 'your redemption rejected ',
              btnOkOnPress: () {
                // debugPrint('OnClcik');
              },
              btnOkIcon: Icons.close_rounded,
              onDissmissCallback: () {
                // debugPrint('Dialog Dissmiss from callback');
              })
          .show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RedeemBloc>().add(RedeemDataAdded());
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = true;
    //print((ModalRoute.of(context).settings.arguments).toString());
    prizeBundle = ModalRoute.of(context).settings.arguments as PrizeBundle;
    // print(prizeBundle.currentCustomer.currentPoints);
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
        child: BlocListener<RedeemBloc, RedeemState>(
          listener: (context, state) {
            print(state.toString());
            if (state is RedeemLoadedSuccess) {
              if (prizeBundle.currentCustomer.currentPoints <
                  prizeBundle.points) {
                isValid = false;
                showSnackBar(
                  context,
                  "No Sufficient point",
                  SnackBarType.error,
                );
              } else if (prizeBundle.currentCustomer.currentPoints >=
                  prizeBundle.points) {
                isValid = true;
                showSnackBar(
                  context,
                  "Redeem Valid ",
                  SnackBarType.wheel,
                );
              } else {
                print("Error");
                isValid = false;
                showSnackBar(
                  context,
                  "Error",
                  SnackBarType.error,
                );
              }
            }
            if (state is RedeemRequestState) {
              // showSnackBar(
              //   context,
              //   "Request Prize",
              //   SnackBarType.wheel,
              // );
            }
            if (state is RedeemCheckPrizeState) {
              if (state.prizeStoredData.message == "success") {
                // Scaffold.of(context)
                //   ..hideCurrentSnackBar()
                //   ..showSnackBar(
                //     SnackBar(
                //       elevation: 4,
                //       margin: EdgeInsets.only(
                //         left: Values.medium,
                //         right: Values.medium,
                //         bottom: Values.big,
                //       ),
                //       behavior: SnackBarBehavior.floating,
                //       duration: Duration(seconds: 2),
                //       content: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'الرجاء الانتظار...',
                //           ),
                //           CircularProgressIndicator(
                //             valueColor: AlwaysStoppedAnimation<Color>(
                //                 CustomColors.white),
                //           )
                //         ],
                //       ),
                //       backgroundColor: CustomColors.green,
                //     ),
                //   ).close();

                startTaskResultAweasom(true);
              } else {
                startTaskResultAweasom(false);
              }
            } else {
              print("no");
            }
          },
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
                                    recipeBundle: prizeBundle,
                                    press: () {},
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  prizeBundle.description,
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (isValid) {
                                      result = await redeemAlert
                                          .onAlertButtonsPressed(
                                        context,
                                        "Redeem ALERT",
                                        "Are you sure to redeem this Reward",
                                      );

                                      // startTaskResultAweasom(result);
                                      if (result == true) {
                                        context.read<RedeemBloc>().add(
                                            RedeemRequestPrize(
                                                prizeId: prizeBundle.id));
                                      } else {}

                                      print(result);
                                    } else {
                                      showSnackBar(
                                        context,
                                        "No Sufficient point",
                                        SnackBarType.error,
                                      );
                                    }
                                  },
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
      ),
    );
  }
}
