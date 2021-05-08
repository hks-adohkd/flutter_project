import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/activity/order/components/build_oeder.dart';

BuildOrder buildOrder = BuildOrder();

class Order extends StatefulWidget {
  static String routeName = "/orderScreen";
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Container(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.13),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: kBoxDecoration,
                child: ListView.builder(
                    itemCount: buildOrder.orderLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildOrder.buildList(context, index);
                    }),
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.05), // 4%
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Orders",
                        style: kHeadingStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
