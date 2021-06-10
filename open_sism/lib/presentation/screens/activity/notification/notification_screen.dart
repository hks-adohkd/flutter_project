import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/activity/notification/components/build_notification.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:open_sism/logic/blocs/notificationBloc/notification_bloc.dart';
import 'package:open_sism/logic/blocs/notificationBloc/notification_event.dart';
import 'package:open_sism/logic/blocs/notificationBloc/notification_state.dart';

class Notifications extends StatefulWidget {
  static const String routeName = "/notificationScreen";
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  BuildNotification buildNotification = BuildNotification();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    // _bloc.add(LoadHomeAds());
    // _categoriesBloc.add(LoadCategories());
    // _featuredBloc.add(LoadFeaturedAds());
    await Future.delayed(Duration(milliseconds: 1000));
    context.read<NotificationBloc>().add(NotificationPageRequested());
    print("refresh");
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: kBoxDecoration,
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: () => _onRefresh(context),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03), // 4%
                  Text(
                    "Notifications",
                    style: kHeadingStyle,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Container(
                    height: SizeConfig.screenHeight * 0.8,
                    child: BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        if (state is NotificationLoadInProgress) {
                          return Center(
                            child: Text(
                              "Loading Data , please Wait",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                        if (state is NotificationLoadedSuccess) {
                          //create List
                          //print(prizeList.first.description);
                          if (state.messageData.content.content.isEmpty) {
                            return Center(
                              child: Text(
                                "No Message Available , please Refresh",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }
                          return buildListView(
                              notificationList: state.notificationList);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView buildListView({List<NotificationList> notificationList}) {
    return ListView.builder(
        itemCount: notificationList.length,
        itemBuilder: (BuildContext context, int index) {
          String sendDate = notificationList[index].sendDate.year.toString() +
              "/" +
              notificationList[index].sendDate.month.toString() +
              "/" +
              notificationList[index].sendDate.day.toString();
          return buildNotification.buildList(context, index, "", sendDate,
              notificationList: notificationList);
        });
  }
}
