import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/screens/activity/finished_task/components/build_finished_task.dart';
import 'package:open_sism/logic/blocs/finished_task_bloc/finishedTask_bloc.dart';
import 'package:open_sism/logic/blocs/finished_task_bloc/finishedTask_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/finished_task_bloc/finishedTask_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

BuildFinishedTask finishedTask = BuildFinishedTask();

class FinishedTask extends StatefulWidget {
  static const String routeName = "/finishedTaskScreen";
  @override
  _FinishedTaskState createState() => _FinishedTaskState();
}

class _FinishedTaskState extends State<FinishedTask> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    // _bloc.add(LoadHomeAds());
    // _categoriesBloc.add(LoadCategories());
    // _featuredBloc.add(LoadFeaturedAds());
    await Future.delayed(Duration(milliseconds: 1000));
    context.read<FinishedTaskBloc>().add(FinishedTaskPageRequested());
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
                  child: BlocBuilder<FinishedTaskBloc, FinishedTaskState>(
                    builder: (context, state) {
                      if (state is FinishedTaskLoadedSuccess) {
                        //create List
                        //print(prizeList.first.description);
                        return buildListView(state.finishedTaskList);
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
                          "Finished Task",
                          style: kHeadingStyle,
                        ),
                      ),

                      //SizedBox(height: SizeConfig.screenHeight * 0.04),
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

  ListView buildListView(List<FinishedTaskList> finishedTaskList) {
    return ListView.builder(
        itemCount: finishedTaskList.length,
        itemBuilder: (BuildContext context, int index) {
          return finishedTask.buildList(context, index, finishedTaskList);
        });
  }
}
