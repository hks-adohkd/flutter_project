import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/components/appBar.dart';
import 'package:open_sism/presentation/screens/activity/components/activityBundel.dart';
import 'package:open_sism/presentation/screens/activity/components/activity_row.dart';

class ActivityScreen extends StatefulWidget {
  static const String routeName = "/activity_screen";

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: kAppBarHeight,
        child: ReusableAppBar(
          appBarTitle: "Activity",
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: kGradiantsPrimaryColor,
            ),
            border: Border.all(style: BorderStyle.solid, color: Colors.black),
          ),
          child: new Container(
            color: new Color(0xFF736AB7),
            child: new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) => new ActivityRow(
                        activity: activities[index],
                        type: activities[index].name,
                      ),
                      childCount: activities.length,
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
