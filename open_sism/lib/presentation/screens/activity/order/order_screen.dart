import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/activity/order/components/build_oeder.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:open_sism/logic/blocs/requested_prize_bloc/requestedPrize_bloc.dart';
import 'package:open_sism/logic/blocs/requested_prize_bloc/requestedPrize_event.dart';
import 'package:open_sism/logic/blocs/requested_prize_bloc/requestedPrize_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BuildOrder buildOrder = BuildOrder();

class Order extends StatefulWidget {
  static const String routeName = "/orderScreen";
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    // _bloc.add(LoadHomeAds());
    // _categoriesBloc.add(LoadCategories());
    // _featuredBloc.add(LoadFeaturedAds());
    await Future.delayed(Duration(milliseconds: 1000));
    context.read<RequestedPrizeBloc>().add(RequestedPrizePageRequested());
    print("refresh");
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SmartRefresher(
            controller: _refreshController,
            onRefresh: () => _onRefresh(context),
            child: Stack(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Container(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.13),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: kBoxDecoration,
                  child: BlocBuilder<RequestedPrizeBloc, RequestedPrizeState>(
                    builder: (context, state) {
                      if (state is RequestedPrizeLoadedSuccess) {
                        //create List
                        //print(prizeList.first.description);
                        if (state.requestedPrizeData.content.content.isEmpty) {
                          return Center(
                            child: Text(
                              "No Data Available , please Refresh",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        } else {
                          return buildListView(state.orderList);
                        }
                      } else
                        return Center(
                          child: Text(
                            "No Data Available , please Refresh",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        );
                    },
                  ),
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
      ),
    );
  }

  ListView buildListView(List<OrderList> orderList) {
    return ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (BuildContext context, int index) {
          String earnDate = orderList[index].earnDate.year.toString() +
              "/" +
              orderList[index].earnDate.month.toString() +
              "/" +
              orderList[index].earnDate.day.toString();
          String requestDate = orderList[index].requestDate.year.toString() +
              "/" +
              orderList[index].requestDate.month.toString() +
              "/" +
              orderList[index].requestDate.day.toString();
          return buildOrder.buildList(
              context, index, orderList, earnDate, requestDate);
        });
  }
}
