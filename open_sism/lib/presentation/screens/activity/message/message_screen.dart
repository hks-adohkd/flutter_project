import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/screens/activity/message/components/build_message.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:open_sism/logic/blocs/contactUSBloc/contact_us_bloc.dart';
import 'package:open_sism/logic/blocs/contactUSBloc/contact_us_event.dart';
import 'package:open_sism/logic/blocs/contactUSBloc/contact_us_state.dart';

class Messages extends StatefulWidget {
  static const String routeName = "/messageScreen";
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  BuildMessage buildMessage = BuildMessage();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    // _bloc.add(LoadHomeAds());
    // _categoriesBloc.add(LoadCategories());
    // _featuredBloc.add(LoadFeaturedAds());
    await Future.delayed(Duration(milliseconds: 1000));
    // context.read<FinishedTaskBloc>().add(FinishedTaskPageRequested());
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
                    "Messages",
                    style: kHeadingStyle,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Container(
                    height: SizeConfig.screenHeight * 0.8,
                    child: BlocBuilder<ContactUsBloc, ContactUsState>(
                      builder: (context, state) {
                        if (state is ContactUSLoadInProgress) {
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
                        if (state is ContactUSLoadedSuccess) {
                          //create List
                          //print(prizeList.first.description);
                          if (state.contactData.content.content.isEmpty) {
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
                              contactUsList: state.contactUsList);
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

  ListView buildListView({List<ContactUsList> contactUsList}) {
    return ListView.builder(
        itemCount: contactUsList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildMessage.buildList(context, index, "",
              contactUsList: contactUsList);
        });
  }
}
